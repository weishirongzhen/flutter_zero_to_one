import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zero_to_one/entities/access_token_entity.dart';
import 'package:flutter_zero_to_one/entities/result_entity.dart';
import 'package:flutter_zero_to_one/ui/description_widget.dart';
import 'package:flutter_zero_to_one/ui/title_widget.dart';
import 'package:flutter_zero_to_one/utils/user_default.dart';
import 'package:flutter_zero_to_one/utils/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:share/share.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File _imageFile;
  String _imageBase64;
  Future<ResultEntity> _result;

  @override
  void initState() {
    getToken();
    super.initState();
  }

  void getToken() async {
    if ((await UserDefault.getToken())?.isEmpty ?? true) {
      AccessTokenEntity token = await Utils.getAccessToken();
      UserDefault.saveToken(token.accessToken);
    }
  }

  Future<void> getImage() async {
    _imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);

    if (_imageFile != null) {
      setState(() {
        _result = null;
      });
      _imageBase64 = Utils.imageFileToBase64(_imageFile.readAsBytesSync());
      final String accessToken = await UserDefault.getToken();
      _result = Utils.plant(_imageBase64, 10, accessToken);
    }
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

  Widget _buildResult() {
    return Column(
      children: <Widget>[_buildResultView(), _buildOtherResultView()],
      mainAxisSize: MainAxisSize.min,
    );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '我的动植物园',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.black,
            ),
            onPressed: () {
              Share.share('你好');
            },
          )
        ],
      ),
      body: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: FloatingActionButton(
            child: Icon(Icons.photo_camera),
            onPressed: () {
              getImage();
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                _imageFile == null
                    ? Container(
                        width: double.infinity,
                        child: Text(
                          '您还没有识别过动植物哦，快去识别吧',
                          style: TextStyle(fontSize: 20, color: Colors.black87),
                        ),
                      )
                    : Container(
                        width: double.infinity,
                        height: 300,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.file(
                            _imageFile,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                _result == null ? SizedBox() : _buildResult(),
                SizedBox(
                  height: 80,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
