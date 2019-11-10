import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_zero_to_one/entities/history_entity.dart';
import 'package:flutter_zero_to_one/entities/result_entity.dart';
import 'package:flutter_zero_to_one/events.dart';
import 'package:flutter_zero_to_one/image_type.dart';
import 'package:flutter_zero_to_one/notifier/history_notifier.dart';
import 'package:flutter_zero_to_one/notifier/recognize_notifier.dart';
import 'package:flutter_zero_to_one/ui/title_widget.dart';
import 'package:flutter_zero_to_one/utils/user_default.dart';
import 'package:flutter_zero_to_one/utils/utils.dart';
import 'package:flutter_zero_to_one/wtf_bus.dart';
import 'package:provider/provider.dart';

///将RecognizeNotifier 放到这里是为了在ResultPage dispose的时候将识别结果一并dispose。
///因为RecognizeNotifier必须提供在要使用的界面的上一级， 所以封装了一级，不知道有没有其他更方便的办法
class ResultPage extends StatelessWidget {
  final File _imageFile;
  final ImageType _imageType;

  ResultPage(this._imageFile, this._imageType);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(builder: (_) => RecognizeNotifier()),
    ], child: RecognizeWidget(_imageFile, _imageType));
  }
}

class RecognizeWidget extends StatefulWidget {
  final File _imageFile;
  final ImageType _imageType;

  RecognizeWidget(this._imageFile, this._imageType);

  @override
  _RecognizeWidgetState createState() => _RecognizeWidgetState();
}

class _RecognizeWidgetState extends State<RecognizeWidget> {
  @override
  void initState() {
    Utils.checkConnectivity(context);
    _startRecognizeProcess();
    super.initState();
  }

  void _saveRecognizeResult(ResultEntity entity) async {
    if (entity.result != null) {
      String imagePath;

      ///首个结果的name,作为该图片的命名后缀
      if (entity.result.first.name != null) {
        imagePath = await Utils.saveImageFile(entity.result.first.name, widget._imageFile.readAsBytesSync());
      }

      ///首个结果的name,作为该历史的title
      HistoryItem historyItem = HistoryItem((update) => update
        ..title = entity.result.first.name
        ..imagePath = imagePath
        ..result.addAll(entity.result.map((data) {
          return ItemInfo((item) => item
            ..name = data.name
            ..score = data.score
            ..description = data.baiKeInfo?.description ?? '暂无描述信息');
        }).toList()));
      if (historyItem.title != '非植物' && historyItem.title != '非动物') {
        UserDefault.saveHistory(historyItem);

        ///延迟100ms 刷新上层历史界面
        await Future.delayed(Duration(milliseconds: 100));
        Provider.of<HistoryNotifier>(context, listen: false).updateHistory();
      }
    }
  }

  ///调用接口识别图片
  Future<ResultEntity> _recognize(File imageFile, ImageType type) {
    if (type == ImageType.plant) {
      return Utils.recognizePlant(Utils.imageFileToBase64(imageFile.readAsBytesSync()), 10, UserDefault.getToken());
    } else {
      return Utils.recognizeAnimal(Utils.imageFileToBase64(imageFile.readAsBytesSync()), 10, UserDefault.getToken());
    }
  }

  ///检查token是否过期
  Future<void> _startRecognizeProcess() async {
    ResultEntity result = await _recognize(widget._imageFile, widget._imageType);
    if (result != null && result.errorCode == 110) {
      UserDefault.setTokenExpireTime(-1);
      await Utils.initialAPIAccessToken();
      result = await _recognize(widget._imageFile, widget._imageType);
    }
    Provider.of<RecognizeNotifier>(context, listen: false).updateResult(result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('识别结果'),
        actions: <Widget>[
          SizedBox(
            child: FlatButton(
              child: Text(
                '重选',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              onPressed: () async {
                Navigator.of(context).pop();
                WtfBus().postEvent(ReSelectEvent(widget._imageType));
              },
            ),
          )
        ],
      ),
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
                    SizedBox(
                      height: 80,
                    ),
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

  ///图片预览
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
            child: Consumer<RecognizeNotifier>(
              builder: (context, snapshot, _) {
                if (snapshot.entity == null) {
                  return CircularProgressIndicator(
                    strokeWidth: 10,
                  );
                } else {
                  return SizedBox();
                }
              },
            )),
      ),
    );
  }

  ///创建识别结果list
  Widget _buildRecognizeResult() {
    return Consumer<RecognizeNotifier>(
      builder: (context, snapshot, _) {
        if (snapshot.entity != null && snapshot.entity.result != null) {
          _saveRecognizeResult(snapshot.entity);
          return ListView.separated(
              separatorBuilder: (BuildContext context, int index) => Divider(
                    height: 4,
                  ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: snapshot.entity.result.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return _buildDescription(snapshot.entity.result[index]);
              });
        } else {
          return SizedBox();
        }
      },
    );
  }

  ///创建识别结果item
  Widget _buildDescription(Result result) {
    if (result.baiKeInfo == null || result.baiKeInfo?.description == null) {
      return Column(
        children: <Widget>[
          TitleWidget(result.score, result.name),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular((10.0)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              child: Text(
                '暂无描述信息',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 4.0,
                      color: Colors.black,
                      offset: Offset(1.0, 1.0),
                    ),
                  ],
                ),
              ),
            ),
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
                      offset: Offset(1.0, 1.0),
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
