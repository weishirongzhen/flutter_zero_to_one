library serializers;

import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_zero_to_one/entities/access_token_entity.dart';
import 'package:flutter_zero_to_one/entities/image_entity.dart';

part 'serializers.g.dart';

@SerializersFor([
  AccessTokenEntity,
  ImageEntity,
])
final Serializers serializers = _$serializers;
final Serializers standardSerializers = (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
