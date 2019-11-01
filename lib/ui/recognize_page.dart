import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_zero_to_one/entities/result_entity.dart';
import 'package:flutter_zero_to_one/image_type.dart';
import 'package:flutter_zero_to_one/ui/description_widget.dart';
import 'package:flutter_zero_to_one/ui/title_widget.dart';
import 'package:flutter_zero_to_one/utils/user_default.dart';
import 'package:flutter_zero_to_one/utils/utils.dart';

class RecognizePage extends StatefulWidget {
  final File _imageFile;
  final ImageType imageType;

  RecognizePage(this._imageFile, this.imageType);

  @override
  _RecognizePageState createState() => _RecognizePageState();
}

class _RecognizePageState extends State<RecognizePage> {
  Future<ResultEntity> _result;

  @override
  void initState() {
    _result = _initialRecognize(widget._imageFile, widget.imageType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildPreview(widget._imageFile),
              _buildResultView(),
              _buildOtherResultView(),
            ],
            mainAxisSize: MainAxisSize.min,
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
        ),
      ),
    );
  }

  Widget _buildResultView() {
    return FutureBuilder<ResultEntity>(
        future: _result,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.result.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return _buildResultItemWithDescription(snapshot.data.result[index]);
                });
          } else {
            return SizedBox();
          }
        });
  }

  Widget _buildOtherResultView() {
    return FutureBuilder<ResultEntity>(
        future: _result,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: <Widget>[
                Text(
                  '其他可能',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
                ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data.result.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return _buildResultItemWithoutDescription(snapshot.data.result[index]);
                    }),
              ],
            );
          } else {
            return SizedBox();
          }
        });
  }

  Widget _buildResultItemWithoutDescription(Result result) {
    if (result.baiKeInfo == null || result.baiKeInfo?.description == null) {
      return TitleWidget(result.score, result.name);
    } else {
      return SizedBox();
    }
  }

  Widget _buildResultItemWithDescription(Result result) {
    if (result.baiKeInfo != null && result.baiKeInfo.description != null) {
      return Container(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            TitleWidget(result.score, result.name),
            DescriptionWidget(result.baiKeInfo),
          ],
        ),
      );
    } else {
      return SizedBox();
    }
  }
}
