import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_zero_to_one/entities/serializers.dart';

part 'result_entity.g.dart';

abstract class ResultEntity implements Built<ResultEntity, ResultEntityBuilder> {
  static Serializer<ResultEntity> get serializer => _$resultEntitySerializer;

  ResultEntity._();

  @nullable
  @BuiltValueField(wireName: 'log_id')
  num get logId;

  @nullable
  @BuiltValueField(wireName: 'error_code')
  int get errorCode;

  @nullable
  @BuiltValueField(wireName: 'error_msg')
  String get errorMsg;

  @nullable
  BuiltList<Result> get result;

  factory ResultEntity([void Function(ResultEntityBuilder) updates]) = _$ResultEntity;

  String toJson() {
    return jsonEncode(standardSerializers.serializeWith(serializer, this));
  }

  static ResultEntity fromJson(String jsonString) {
    return standardSerializers.deserializeWith(serializer, jsonDecode(jsonString));
  }
}

abstract class Result implements Built<Result, ResultBuilder> {
  static Serializer<Result> get serializer => _$resultSerializer;

  Result._();

  @nullable
  String get name;

  @nullable
  num get score;

  @nullable
  @BuiltValueField(wireName: 'baike_info')
  BaiKeInfo get baiKeInfo;

  factory Result([void Function(ResultBuilder) updates]) = _$Result;

  String toJson() {
    return jsonEncode(standardSerializers.serializeWith(serializer, this));
  }

  static Result fromJson(String jsonString) {
    return standardSerializers.deserializeWith(serializer, jsonDecode(jsonString));
  }
}

abstract class BaiKeInfo implements Built<BaiKeInfo, BaiKeInfoBuilder> {
  static Serializer<BaiKeInfo> get serializer => _$baiKeInfoSerializer;

  BaiKeInfo._();

  @nullable
  @BuiltValueField(wireName: 'baike_url')
  String get baiKeUrl;

  @nullable
  @BuiltValueField(wireName: 'image_url')
  String get imageUrl;

  @nullable
  String get description;

  factory BaiKeInfo([void Function(BaiKeInfoBuilder) updates]) = _$BaiKeInfo;

  String toJson() {
    return jsonEncode(standardSerializers.serializeWith(serializer, this));
  }

  static BaiKeInfo fromJson(String jsonString) {
    return standardSerializers.deserializeWith(serializer, jsonDecode(jsonString));
  }
}
