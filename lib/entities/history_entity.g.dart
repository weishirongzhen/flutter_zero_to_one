// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HistoryEntity> _$historyEntitySerializer =
    new _$HistoryEntitySerializer();
Serializer<HistoryItem> _$historyItemSerializer = new _$HistoryItemSerializer();

class _$HistoryEntitySerializer implements StructuredSerializer<HistoryEntity> {
  @override
  final Iterable<Type> types = const [HistoryEntity, _$HistoryEntity];
  @override
  final String wireName = 'HistoryEntity';

  @override
  Iterable<Object> serialize(Serializers serializers, HistoryEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.list != null) {
      result
        ..add('list')
        ..add(serializers.serialize(object.list,
            specifiedType: const FullType(
                BuiltList, const [const FullType(HistoryItem)])));
    }
    return result;
  }

  @override
  HistoryEntity deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HistoryEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'list':
          result.list.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(HistoryItem)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$HistoryItemSerializer implements StructuredSerializer<HistoryItem> {
  @override
  final Iterable<Type> types = const [HistoryItem, _$HistoryItem];
  @override
  final String wireName = 'HistoryItem';

  @override
  Iterable<Object> serialize(Serializers serializers, HistoryItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    if (object.imagePath != null) {
      result
        ..add('imagePath')
        ..add(serializers.serialize(object.imagePath,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  HistoryItem deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new HistoryItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imagePath':
          result.imagePath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$HistoryEntity extends HistoryEntity {
  @override
  final BuiltList<HistoryItem> list;

  factory _$HistoryEntity([void Function(HistoryEntityBuilder) updates]) =>
      (new HistoryEntityBuilder()..update(updates)).build();

  _$HistoryEntity._({this.list}) : super._();

  @override
  HistoryEntity rebuild(void Function(HistoryEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HistoryEntityBuilder toBuilder() => new HistoryEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HistoryEntity && list == other.list;
  }

  @override
  int get hashCode {
    return $jf($jc(0, list.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HistoryEntity')..add('list', list))
        .toString();
  }
}

class HistoryEntityBuilder
    implements Builder<HistoryEntity, HistoryEntityBuilder> {
  _$HistoryEntity _$v;

  ListBuilder<HistoryItem> _list;
  ListBuilder<HistoryItem> get list =>
      _$this._list ??= new ListBuilder<HistoryItem>();
  set list(ListBuilder<HistoryItem> list) => _$this._list = list;

  HistoryEntityBuilder();

  HistoryEntityBuilder get _$this {
    if (_$v != null) {
      _list = _$v.list?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HistoryEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HistoryEntity;
  }

  @override
  void update(void Function(HistoryEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HistoryEntity build() {
    _$HistoryEntity _$result;
    try {
      _$result = _$v ?? new _$HistoryEntity._(list: _list?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'list';
        _list?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HistoryEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$HistoryItem extends HistoryItem {
  @override
  final String name;
  @override
  final String description;
  @override
  final String imagePath;

  factory _$HistoryItem([void Function(HistoryItemBuilder) updates]) =>
      (new HistoryItemBuilder()..update(updates)).build();

  _$HistoryItem._({this.name, this.description, this.imagePath}) : super._();

  @override
  HistoryItem rebuild(void Function(HistoryItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HistoryItemBuilder toBuilder() => new HistoryItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HistoryItem &&
        name == other.name &&
        description == other.description &&
        imagePath == other.imagePath;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc(0, name.hashCode), description.hashCode), imagePath.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HistoryItem')
          ..add('name', name)
          ..add('description', description)
          ..add('imagePath', imagePath))
        .toString();
  }
}

class HistoryItemBuilder implements Builder<HistoryItem, HistoryItemBuilder> {
  _$HistoryItem _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  String _imagePath;
  String get imagePath => _$this._imagePath;
  set imagePath(String imagePath) => _$this._imagePath = imagePath;

  HistoryItemBuilder();

  HistoryItemBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _description = _$v.description;
      _imagePath = _$v.imagePath;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HistoryItem other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HistoryItem;
  }

  @override
  void update(void Function(HistoryItemBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HistoryItem build() {
    final _$result = _$v ??
        new _$HistoryItem._(
            name: name, description: description, imagePath: imagePath);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
