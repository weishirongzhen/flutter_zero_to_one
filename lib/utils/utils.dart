import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zero_to_one/entities/access_token_entity.dart';
import 'package:flutter_zero_to_one/entities/result_entity.dart';
import 'package:flutter_zero_to_one/http/http_request.dart';
import 'package:flutter_zero_to_one/image_type.dart';
import 'package:flutter_zero_to_one/ui/recognize_page.dart';
import 'package:flutter_zero_to_one/utils/user_default.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';

class Utils {
  ///文件转base64编码
  static String imageFileToBase64(List<int> image) {
    return Base64Encoder().convert(image);
  }

  ///base64编码转Image Widget
  static Image base64ToImage(String base64String) {
    return Image.memory(Uint8List.fromList(Base64Decoder().convert(base64String).toList()));
  }

  ///获取接口访问token
  static Future<void> initialAPIAccessToken() async {
    if (isTokenExpired()) {
      final apiKey = (await Utils.getBaiDuKeys())['api_key'];
      final secretKeys = (await Utils.getBaiDuKeys())['secret_key'];
      AccessTokenEntity accessTokenEntity = await HttpService.getAccessToken(apiKey, secretKeys);
      if (accessTokenEntity != null) {
        await UserDefault.saveToken(accessTokenEntity.accessToken);
        await UserDefault.setTokenExpireTime(accessTokenEntity.expiresIn);
      }
    }
  }

  static bool isTokenExpired() {
    DateTime now = DateTime.now();
    DateTime expiredTime = DateTime.fromMillisecondsSinceEpoch(UserDefault.getTokenValidTime());
    if (expiredTime.compareTo(now) <= 0) {
      return true;
    } else {
      return false;
    }
  }

  ///获取私有keys
  static Future<Map<String, dynamic>> getBaiDuKeys() async {
    final jsonString = await rootBundle.loadString('local/config.json');
    Map<String, dynamic> map = jsonDecode(jsonString);
    return map;
  }

  ///保存到文件
  static Future<String> saveImageFile(String name, Uint8List bytes) async {
    String prefix = DateFormat('yyyyMMddHHmmss').format(DateTime.now());
    Directory directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$prefix$name.webp');
    file.writeAsBytes(bytes);
    return '${directory.path}/$prefix$name.webp';
  }

  static Future<Uint8List> getHistoryImageFile(String fullFileName) async {
    final directory = await getApplicationDocumentsDirectory();
    return File('${directory.path}/$fullFileName').readAsBytes();
  }

  ///植物识别
  static Future<ResultEntity> recognizePlant(String base64, int baikeNum, String accessToken) async {
    final result = await HttpService.plant(accessToken, base64, baikeNum);
    return result;
  }

  ///动物识别
  static Future<ResultEntity> recognizeAnimal(String base64, int baikeNum, String accessToken) async {
    final result = await HttpService.animal(accessToken, base64, baikeNum);
    return result;
  }

  static Future<bool> hasConnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  static Future<void> checkConnectivity(BuildContext context) async {
    if (!(await hasConnectivity())) {
      showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("无网络链连接"),
          content: Text("请连接到网络后重试"),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "好的",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      );
    }
  }

  static Future<void> showNetWorkError(BuildContext context) async {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text("提示"),
        content: Text("网络连接好像存在问题，请重试"),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              "好的",
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  ///使用ImagePicker插件获取手机图片，默认最大高宽不超过1000像素，减少网络传输量
  static Future<void> getImage(ImageSource source, ImageType type, BuildContext context) async {
    if (source != null) {
      final File imageFile = await ImagePicker.pickImage(source: source, maxWidth: 1000, maxHeight: 1000);
      if (imageFile != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ResultPage(imageFile, type)));
      }
    }
  }

  ///ios风格的图片来源选择对话框
  static Future<ImageSource> showImageSourceDialog(BuildContext context, ImageType type) async {
    return showCupertinoModalPopup<ImageSource>(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            cancelButton: CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("取消")),
            title: Text(
              type == ImageType.plant ? "选择植物" : "选择动物",
              style: TextStyle(fontSize: 20),
            ),
            actions: <Widget>[
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(context, ImageSource.camera);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.camera),
                      SizedBox(
                        width: 18,
                      ),
                      Text('拍照'),
                    ],
                  )),
              CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(context, ImageSource.gallery);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.images),
                      SizedBox(
                        width: 18,
                      ),
                      Text('相册'),
                    ],
                  )),
            ],
          );
        });
  }
}
