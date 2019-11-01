library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_zero_to_one/entities/access_token_entity.dart';
import 'package:flutter_zero_to_one/entities/history_entity.dart';
import 'package:flutter_zero_to_one/entities/result_entity.dart';

part 'serializers.g.dart';

@SerializersFor([
  AccessTokenEntity,
  ResultEntity,
  HistoryEntity,
  HistoryItem,
])
final Serializers serializers = _$serializers;
final Serializers standardSerializers = (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

///处理built_value暂时不支持直接序列化json-array的解决办法
T deserialize<T>(dynamic value) => standardSerializers.deserializeWith<T>(standardSerializers.serializerForType(T), value);

BuiltList<T> deserializeListOf<T>(dynamic value) => BuiltList.from(value.map((value) => deserialize<T>(value)).toList(growable: false));
