import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:flutter_zero_to_one/entities/access_token_entity.dart';
import 'package:flutter_zero_to_one/entities/image_entity.dart';
import 'package:flutter_zero_to_one/entities/serializers.dart';
import 'package:flutter_zero_to_one/http/http_base.dart';
import 'package:flutter_zero_to_one/wtf_bus.dart';

import 'api_address.dart';

class HttpService {
  static T serialize<T>(Serializer<T> serializer, Response response) {
    if (response != null) {
      WtfBus().postEvent(standardSerializers.deserializeWith(serializer, response.data));
      return standardSerializers.deserializeWith(serializer, response.data);
    } else {
      return null;
    }
  }

  ///获取百度Api accessToken
  static Future<AccessTokenEntity> getAccessToken(String apiKey, String secretKey) async {
    Response response =
        await HttpBase().post(ApiAddress.baiDuApiAddress, ApiAddress.getAccessToken, data: FormData.fromMap({'grant_type': 'client_credentials', 'client_id': apiKey, 'client_secret': secretKey}));
    return serialize(AccessTokenEntity.serializer, response);
  }

  ///黑白图像上色
  static Future<ImageEntity> colourize(String accessToken, String image) async {
    Response response =
        await HttpBase().post(ApiAddress.baiDuApiAddress, '${ApiAddress.colourize}?access_token=$accessToken', data: {'image': image}, options: Options(contentType: Headers.formUrlEncodedContentType));
    return serialize(ImageEntity.serializer, response);
  }

  ///图像无损放大
  static Future<ImageEntity> imageQualityEnhance(String accessToken, String image) async {
    Response response =
    await HttpBase().post(ApiAddress.baiDuApiAddress, '${ApiAddress.image_quality_enhance}?access_token=$accessToken', data: {'image': image}, options: Options(contentType: Headers.formUrlEncodedContentType));
    return serialize(ImageEntity.serializer, response);
  }

  ///图像去雾
  static Future<ImageEntity> dehaze(String accessToken, String image) async {
    Response response =
    await HttpBase().post(ApiAddress.baiDuApiAddress, '${ApiAddress.dehaze}?access_token=$accessToken', data: {'image': image}, options: Options(contentType: Headers.formUrlEncodedContentType));
    return serialize(ImageEntity.serializer, response);
  }

  ///图像对比度增强
  static Future<ImageEntity> contrastEnhance(String accessToken, String image) async {
    Response response =
    await HttpBase().post(ApiAddress.baiDuApiAddress, '${ApiAddress.contrast_enhance}?access_token=$accessToken', data: {'image': image}, options: Options(contentType: Headers.formUrlEncodedContentType));
    return serialize(ImageEntity.serializer, response);
  }

  ///图像拉伸恢复
  static Future<ImageEntity> stretchRestore(String accessToken, String image) async {
    Response response =
    await HttpBase().post(ApiAddress.baiDuApiAddress, '${ApiAddress.stretch_restore}?access_token=$accessToken', data: {'image': image}, options: Options(contentType: Headers.formUrlEncodedContentType));
    return serialize(ImageEntity.serializer, response);
  }
}
