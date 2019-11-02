// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<HistoryEntity> _$historyEntitySerializer =
    new _$HistoryEntitySerializer();
Serializer<HistoryItem> _$historyItemSerializer = new _$HistoryItemSerializer();
Serializer<ItemInfo> _$itemInfoSerializer = new _$ItemInfoSerializer();

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
    if (object.title != null) {
      result
        ..add('title')
        ..add(serializers.serialize(object.title,
            specifiedType: const FullType(String)));
    }
    if (object.imagePath != null) {
      result
        ..add('imagePath')
        ..add(serializers.serialize(object.imagePath,
            specifiedType: const FullType(String)));
    }
    if (object.result != null) {
      result
        ..add('result')
        ..add(serializers.serialize(object.result,
            specifiedType:
                const FullType(BuiltList, const [const FullType(ItemInfo)])));
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
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'imagePath':
          result.imagePath = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'result':
          result.result.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(ItemInfo)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$ItemInfoSerializer implements StructuredSerializer<ItemInfo> {
  @override
  final Iterable<Type> types = const [ItemInfo, _$ItemInfo];
  @override
  final String wireName = 'ItemInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, ItemInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.name != null) {
      result
        ..add('name')
        ..add(serializers.serialize(object.name,
            specifiedType: const FullType(String)));
    }
    if (object.score != null) {
      result
        ..add('score')
        ..add(serializers.serialize(object.score,
            specifiedType: const FullType(num)));
    }
    if (object.description != null) {
      result
        ..add('description')
        ..add(serializers.serialize(object.description,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  ItemInfo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ItemInfoBuilder();

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
        case 'score':
          result.score = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
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
  final String title;
  @override
  final String imagePath;
  @override
  final BuiltList<ItemInfo> result;

  factory _$HistoryItem([void Function(HistoryItemBuilder) updates]) =>
      (new HistoryItemBuilder()..update(updates)).build();

  _$HistoryItem._({this.title, this.imagePath, this.result}) : super._();

  @override
  HistoryItem rebuild(void Function(HistoryItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HistoryItemBuilder toBuilder() => new HistoryItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HistoryItem &&
        title == other.title &&
        imagePath == other.imagePath &&
        result == other.result;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, title.hashCode), imagePath.hashCode), result.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HistoryItem')
          ..add('title', title)
          ..add('imagePath', imagePath)
          ..add('result', result))
        .toString();
  }
}

class HistoryItemBuilder implements Builder<HistoryItem, HistoryItemBuilder> {
  _$HistoryItem _$v;

  String _title;
  String get title => _$this._title;
  set title(String title) => _$this._title = title;

  String _imagePath;
  String get imagePath => _$this._imagePath;
  set imagePath(String imagePath) => _$this._imagePath = imagePath;

  ListBuilder<ItemInfo> _result;
  ListBuilder<ItemInfo> get result =>
      _$this._result ??= new ListBuilder<ItemInfo>();
  set result(ListBuilder<ItemInfo> result) => _$this._result = result;

  HistoryItemBuilder();

  HistoryItemBuilder get _$this {
    if (_$v != null) {
      _title = _$v.title;
      _imagePath = _$v.imagePath;
      _result = _$v.result?.toBuilder();
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
    _$HistoryItem _$result;
    try {
      _$result = _$v ??
          new _$HistoryItem._(
              title: title, imagePath: imagePath, result: _result?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'result';
        _result?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'HistoryItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$ItemInfo extends ItemInfo {
  @override
  final String name;
  @override
  final num score;
  @override
  final String description;

  factory _$ItemInfo([void Function(ItemInfoBuilder) updates]) =>
      (new ItemInfoBuilder()..update(updates)).build();

  _$ItemInfo._({this.name, this.score, this.description}) : super._();

  @override
  ItemInfo rebuild(void Function(ItemInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ItemInfoBuilder toBuilder() => new ItemInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemInfo &&
        name == other.name &&
        score == other.score &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), score.hashCode), description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ItemInfo')
          ..add('name', name)
          ..add('score', score)
          ..add('description', description))
        .toString();
  }
}

class ItemInfoBuilder implements Builder<ItemInfo, ItemInfoBuilder> {
  _$ItemInfo _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  num _score;
  num get score => _$this._score;
  set score(num score) => _$this._score = score;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  ItemInfoBuilder();

  ItemInfoBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _score = _$v.score;
      _description = _$v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ItemInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ItemInfo;
  }

  @override
  void update(void Function(ItemInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ItemInfo build() {
    final _$result = _$v ??
        new _$ItemInfo._(name: name, score: score, description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
