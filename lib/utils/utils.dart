import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zero_to_one/entities/access_token_entity.dart';
import 'package:flutter_zero_to_one/entities/result_entity.dart';
import 'package:flutter_zero_to_one/http/http_request.dart';

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
  static Future<AccessTokenEntity> getAccessToken() async {
    String apiKey = (await Utils.getBaiDuKeys())['api_key'];
    String secretKeys = (await Utils.getBaiDuKeys())['secret_key'];
    return HttpService.getAccessToken(apiKey, secretKeys);
  }

  ///获取私有keys
  static Future<Map<String, dynamic>> getBaiDuKeys() async {
    String jsonString = await rootBundle.loadString('local/config.json');
    Map<String, dynamic> map = jsonDecode(jsonString);
    return map;
  }

  ///植物识别
  static Future<ResultEntity> plant(String base64, int baikeNum, String accessToken) async {
    ResultEntity result = await HttpService.plant(accessToken, base64, baikeNum);
    return result;
  }

  ///动物识别
  static Future<ResultEntity> animal(String base64, String accessToken) async {
    var result = await HttpService.animal(accessToken, base64);
    return result;
  }
}
