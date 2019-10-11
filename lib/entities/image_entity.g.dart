// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ImageEntity> _$imageEntitySerializer = new _$ImageEntitySerializer();

class _$ImageEntitySerializer implements StructuredSerializer<ImageEntity> {
  @override
  final Iterable<Type> types = const [ImageEntity, _$ImageEntity];
  @override
  final String wireName = 'ImageEntity';

  @override
  Iterable<Object> serialize(Serializers serializers, ImageEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.image != null) {
      result
        ..add('image')
        ..add(serializers.serialize(object.image,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ImageEntity deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ImageEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$ImageEntity extends ImageEntity {
  @override
  final String image;

  factory _$ImageEntity([void Function(ImageEntityBuilder) updates]) =>
      (new ImageEntityBuilder()..update(updates)).build();

  _$ImageEntity._({this.image}) : super._();

  @override
  ImageEntity rebuild(void Function(ImageEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ImageEntityBuilder toBuilder() => new ImageEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ImageEntity && image == other.image;
  }

  @override
  int get hashCode {
    return $jf($jc(0, image.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ImageEntity')..add('image', image))
        .toString();
  }
}

class ImageEntityBuilder implements Builder<ImageEntity, ImageEntityBuilder> {
  _$ImageEntity _$v;

  String _image;
  String get image => _$this._image;
  set image(String image) => _$this._image = image;

  ImageEntityBuilder();

  ImageEntityBuilder get _$this {
    if (_$v != null) {
      _image = _$v.image;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ImageEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ImageEntity;
  }

  @override
  void update(void Function(ImageEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ImageEntity build() {
    final _$result = _$v ?? new _$ImageEntity._(image: image);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
