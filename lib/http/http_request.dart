import 'package:built_value/serializer.dart';
import 'package:dio/dio.dart';
import 'package:flutter_zero_to_one/entities/access_token_entity.dart';
import 'package:flutter_zero_to_one/entities/result_entity.dart';
import 'package:flutter_zero_to_one/entities/serializers.dart';
import 'package:flutter_zero_to_one/http/http_base.dart';
import 'package:flutter_zero_to_one/wtf_bus.dart';

import 'api_address.dart';

class HttpService {
  static T serialize<T>(Serializer<T> serializer, Response response) {
    if (response != null) {
      ///发送事件流，如需要可监听
      WtfBus().postEvent(standardSerializers.deserializeWith(serializer, handleApiWrongResponse(response).data));
      return standardSerializers.deserializeWith(serializer, handleApiWrongResponse(response).data);
    } else {
      return null;
    }
  }

  ///处理百度两个api返回字段不一致的问题，官方文档中虽然说明score返回值都为uint32，但是实际上在animal中，score返回为String
  static Response handleApiWrongResponse(Response response) {
    if (response?.data['result'] != null) {
      response.data['result']?.forEach((item) {
        if (item['score'] != null) {
          item['score'] = double.parse(item['score'].toString());
        }
      });
    }
    return response;
  }

  ///获取百度Api accessToken
  static Future<AccessTokenEntity> getAccessToken(String apiKey, String secretKey) async {
    Response response =
        await HttpBase().post(ApiAddress.baiDuApiAddress, ApiAddress.getAccessToken, data: FormData.fromMap({'grant_type': 'client_credentials', 'client_id': apiKey, 'client_secret': secretKey}));
    return serialize(AccessTokenEntity.serializer, response);
  }

  ///植物识别
  static Future<ResultEntity> plant(String accessToken, String image, int baikeNum) async {
    Response response = await HttpBase().post(ApiAddress.baiDuApiAddress, '${ApiAddress.plant}?access_token=$accessToken',
        data: {'image': image, 'baike_num': baikeNum}, options: Options(contentType: Headers.formUrlEncodedContentType));
    return serialize(ResultEntity.serializer, response);
  }

  ///动物识别
  static Future<ResultEntity> animal(String accessToken, String image, int baikeNum) async {
    Response response = await HttpBase().post(ApiAddress.baiDuApiAddress, '${ApiAddress.animal}?access_token=$accessToken',
        data: {'image': image, 'baike_num': baikeNum}, options: Options(contentType: Headers.formUrlEncodedContentType));
    return serialize(ResultEntity.serializer, response);
  }
}
