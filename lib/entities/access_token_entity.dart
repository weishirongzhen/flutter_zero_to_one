import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_zero_to_one/entities/serializers.dart';

part 'access_token_entity.g.dart';

abstract class AccessTokenEntity implements Built<AccessTokenEntity, AccessTokenEntityBuilder> {
  static Serializer<AccessTokenEntity> get serializer => _$accessTokenEntitySerializer;

  AccessTokenEntity._();

  @nullable
  @BuiltValueField(wireName: 'refresh_token')
  String get refreshToken;

  @nullable
  @BuiltValueField(wireName: 'expires_in')
  int get expiresIn;

  @nullable
  @BuiltValueField(wireName: 'session_key')
  String get sessionKey;

  @nullable
  @BuiltValueField(wireName: 'access_token')
  String get accessToken;

  @nullable
  String get scope;

  @nullable
  @BuiltValueField(wireName: 'session_secret')
  String get sessionSecret;

  factory AccessTokenEntity([void Function(AccessTokenEntityBuilder) updates]) = _$AccessTokenEntity;

  String toJson() {
    return jsonEncode(standardSerializers.serializeWith(serializer, this));
  }

  static AccessTokenEntity fromJson(String jsonString) {
    return standardSerializers.deserializeWith(serializer, jsonDecode(jsonString));
  }
}
