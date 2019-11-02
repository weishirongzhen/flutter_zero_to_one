import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_zero_to_one/entities/history_entity.dart';
import 'package:flutter_zero_to_one/entities/result_entity.dart';
import 'package:flutter_zero_to_one/image_type.dart';
import 'package:flutter_zero_to_one/notifier/history_notifier.dart';
import 'package:flutter_zero_to_one/ui/title_widget.dart';
import 'package:flutter_zero_to_one/utils/user_default.dart';
import 'package:flutter_zero_to_one/utils/utils.dart';
import 'package:provider/provider.dart';

class RecognizePage extends StatefulWidget {
  final File _imageFile;
  final ImageType imageType;

  RecognizePage(this._imageFile, this.imageType);

  @override
  _RecognizePageState createState() => _RecognizePageState();
}

class _RecognizePageState extends State<RecognizePage> {
  Future<ResultEntity> _result;
  bool _isRecognizing = true;

  @override
  void initState() {
    _result = _initialRecognize(widget._imageFile, widget.imageType);
    _initHistorySaving();
    super.initState();
  }

  void _initHistorySaving() async {
    String imagePath;
    _result.asStream().listen((onData) async {
      setState(() {
        _isRecognizing = false;
      });
      if (onData != null) {
        if (onData.result[0].name != null) {
          imagePath = await Utils.saveImageFile(onData.result[0].name, widget._imageFile.readAsBytesSync());
        }
        if (onData.result != null) {
          HistoryItem historyItem = HistoryItem((update) => update
            ..title = onData.result[0].name
            ..imagePath = imagePath
            ..result.addAll(onData.result.map((data) {
              return ItemInfo((item) => item
                ..name = data.name
                ..score = data.score
                ..description = data.baiKeInfo?.description ?? '暂无描述信息');
            }).toList()));
          if (historyItem.title != '非植物' && historyItem.title != '非动物') {
            UserDefault.saveHistory(historyItem);

            ///延迟100ms 刷新上层历史界面
            await Future.delayed(Duration(milliseconds: 100));
            Provider.of<HistoryNotifier>(context).initHistory();
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: FileImage(widget._imageFile),
          ),
        ),
        child: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildPreview(widget._imageFile),
                    _buildRecognizeResult(),
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<ResultEntity> _initialRecognize(File imageFile, ImageType type) {
    String base64code = Utils.imageFileToBase64(imageFile.readAsBytesSync());

    if (type == ImageType.plant) {
      return Utils.plant(base64code, 10, UserDefault.getToken());
    } else {
      return Utils.animal(base64code, 10, UserDefault.getToken());
    }
  }

  Widget _buildPreview(File image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Center(
        child: Container(
          height: MediaQuery.of(context).size.width * 3 / 4,
          width: MediaQuery.of(context).size.width * 3 / 4,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: FileImage(image),
              )),
          child: _isRecognizing
              ? CircularProgressIndicator(
                  strokeWidth: 10,
                )
              : SizedBox(),
        ),
      ),
    );
  }

  Widget _buildRecognizeResult() {
    return FutureBuilder<ResultEntity>(
        future: _result,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.separated(
                separatorBuilder: (BuildContext context, int index) => Divider(
                      height: 4,
                    ),
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.result.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _buildDescription(snapshot.data.result[index]);
                });
          } else {
            return SizedBox();
          }
        });
  }

  Widget _buildDescription(Result result) {
    if (result.baiKeInfo == null || result.baiKeInfo?.description == null) {
      return Column(
        children: <Widget>[
          TitleWidget(result.score, result.name),
          Text(
            '暂无描述信息',
            style: TextStyle(fontSize: 18, color: Colors.black87),
          ),
        ],
      );
    } else {
      return Column(
        children: <Widget>[
          TitleWidget(result.score, result.name),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular((10.0)), //
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Text(
                result.baiKeInfo.description,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 4.0,
                      color: Colors.black,
                      offset: Offset(2.0, 2.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}
