import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_zero_to_one/entities/access_token_entity.dart';
import 'package:flutter_zero_to_one/entities/image_entity.dart';
import 'package:flutter_zero_to_one/http/http_request.dart';

class Utils {
  ///文件转base64编码
  static String imageFileToBase64(File image) {
    return Base64Encoder().convert(image.readAsBytesSync());
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

  ///黑白图像上色
  static Future<Image> colorize(String base64, String accessToken) async {
    ImageEntity result = await HttpService.colourize(accessToken, base64);
    return base64ToImage(result.image);
  }

  ///图像无损放大
  static Future<Image> imageQualityEnhance(String base64, String accessToken) async {
    ImageEntity result = await HttpService.imageQualityEnhance(accessToken, base64);
    return base64ToImage(result.image);
  }

  ///图像去雾
  static Future<Image> dehaze(String base64, String accessToken) async {
    ImageEntity result = await HttpService.dehaze(accessToken, base64);
    return base64ToImage(result.image);
  }

  ///图像对比度增强
  static Future<Image> contrastEnhance(String base64, String accessToken) async {
    ImageEntity result = await HttpService.contrastEnhance(accessToken, base64);
    return Utils.base64ToImage(result.image);
  }

  ///拉伸图像恢复
  static Future<Image> stretchRestore(String base64, String accessToken) async {
    ImageEntity result = await HttpService.stretchRestore(accessToken, base64);
    return base64ToImage(result.image);
  }


}
