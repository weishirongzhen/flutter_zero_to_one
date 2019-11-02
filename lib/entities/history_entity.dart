import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_zero_to_one/entities/serializers.dart';

part 'history_entity.g.dart';

abstract class HistoryEntity implements Built<HistoryEntity, HistoryEntityBuilder> {
  static Serializer<HistoryEntity> get serializer => _$historyEntitySerializer;

  HistoryEntity._();

  @nullable
  BuiltList<HistoryItem> get list;

  factory HistoryEntity([void Function(HistoryEntityBuilder) updates]) = _$HistoryEntity;

  String toJson() {
    return jsonEncode(standardSerializers.serializeWith(serializer, this));
  }

  static HistoryEntity fromJson(String jsonString) {
    return standardSerializers.deserializeWith(serializer, jsonDecode(jsonString));
  }
}

abstract class HistoryItem implements Built<HistoryItem, HistoryItemBuilder> {
  static Serializer<HistoryItem> get serializer => _$historyItemSerializer;

  HistoryItem._();

  @nullable
  String get title;

  @nullable
  String get imagePath;

  @nullable
  BuiltList<ItemInfo> get result;

  factory HistoryItem([void Function(HistoryItemBuilder) updates]) = _$HistoryItem;

  String toJson() {
    return jsonEncode(standardSerializers.serializeWith(serializer, this));
  }

  static HistoryItem fromJson(String jsonString) {
    return standardSerializers.deserializeWith(serializer, jsonDecode(jsonString));
  }
}

abstract class ItemInfo implements Built<ItemInfo, ItemInfoBuilder> {
  static Serializer<ItemInfo> get serializer => _$itemInfoSerializer;

  ItemInfo._();

  @nullable
  String get name;

  @nullable
  num get score;

  @nullable
  String get description;

  factory ItemInfo([void Function(ItemInfoBuilder) updates]) = _$ItemInfo;

  String toJson() {
    return jsonEncode(standardSerializers.serializeWith(serializer, this));
  }

  static ItemInfo fromJson(String jsonString) {
    return standardSerializers.deserializeWith(serializer, jsonDecode(jsonString));
  }
}
