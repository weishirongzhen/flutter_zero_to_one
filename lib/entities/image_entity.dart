import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_zero_to_one/entities/serializers.dart';
part 'image_entity.g.dart';

abstract class ImageEntity implements Built<ImageEntity, ImageEntityBuilder> {
  static Serializer<ImageEntity> get serializer => _$imageEntitySerializer;

  ImageEntity._();

  @nullable
  String get image;


  factory ImageEntity([void Function(ImageEntityBuilder) updates]) = _$ImageEntity;

  String toJson() {
    return jsonEncode(standardSerializers.serializeWith(serializer, this));
  }

  static ImageEntity fromJson(String jsonString) {
    return standardSerializers.deserializeWith(serializer, jsonDecode(jsonString));
  }
}

