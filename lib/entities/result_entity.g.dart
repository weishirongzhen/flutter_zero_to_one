// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ResultEntity> _$resultEntitySerializer =
    new _$ResultEntitySerializer();
Serializer<Result> _$resultSerializer = new _$ResultSerializer();
Serializer<BaiKeInfo> _$baiKeInfoSerializer = new _$BaiKeInfoSerializer();

class _$ResultEntitySerializer implements StructuredSerializer<ResultEntity> {
  @override
  final Iterable<Type> types = const [ResultEntity, _$ResultEntity];
  @override
  final String wireName = 'ResultEntity';

  @override
  Iterable<Object> serialize(Serializers serializers, ResultEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.logId != null) {
      result
        ..add('log_id')
        ..add(serializers.serialize(object.logId,
            specifiedType: const FullType(num)));
    }
    if (object.errorCode != null) {
      result
        ..add('error_code')
        ..add(serializers.serialize(object.errorCode,
            specifiedType: const FullType(int)));
    }
    if (object.errorMsg != null) {
      result
        ..add('error_msg')
        ..add(serializers.serialize(object.errorMsg,
            specifiedType: const FullType(String)));
    }
    if (object.result != null) {
      result
        ..add('result')
        ..add(serializers.serialize(object.result,
            specifiedType:
                const FullType(BuiltList, const [const FullType(Result)])));
    }
    return result;
  }

  @override
  ResultEntity deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResultEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'log_id':
          result.logId = serializers.deserialize(value,
              specifiedType: const FullType(num)) as num;
          break;
        case 'error_code':
          result.errorCode = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'error_msg':
          result.errorMsg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'result':
          result.result.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(Result)]))
              as BuiltList<dynamic>);
          break;
      }
    }

    return result.build();
  }
}

class _$ResultSerializer implements StructuredSerializer<Result> {
  @override
  final Iterable<Type> types = const [Result, _$Result];
  @override
  final String wireName = 'Result';

  @override
  Iterable<Object> serialize(Serializers serializers, Result object,
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
    if (object.baiKeInfo != null) {
      result
        ..add('baike_info')
        ..add(serializers.serialize(object.baiKeInfo,
            specifiedType: const FullType(BaiKeInfo)));
    }
    return result;
  }

  @override
  Result deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ResultBuilder();

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
        case 'baike_info':
          result.baiKeInfo.replace(serializers.deserialize(value,
              specifiedType: const FullType(BaiKeInfo)) as BaiKeInfo);
          break;
      }
    }

    return result.build();
  }
}

class _$BaiKeInfoSerializer implements StructuredSerializer<BaiKeInfo> {
  @override
  final Iterable<Type> types = const [BaiKeInfo, _$BaiKeInfo];
  @override
  final String wireName = 'BaiKeInfo';

  @override
  Iterable<Object> serialize(Serializers serializers, BaiKeInfo object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.baiKeUrl != null) {
      result
        ..add('baike_url')
        ..add(serializers.serialize(object.baiKeUrl,
            specifiedType: const FullType(String)));
    }
    if (object.imageUrl != null) {
      result
        ..add('image_url')
        ..add(serializers.serialize(object.imageUrl,
            specifiedType: const FullType(String)));
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
  BaiKeInfo deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BaiKeInfoBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'baike_url':
          result.baiKeUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'image_url':
          result.imageUrl = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
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

class _$ResultEntity extends ResultEntity {
  @override
  final num logId;
  @override
  final int errorCode;
  @override
  final String errorMsg;
  @override
  final BuiltList<Result> result;

  factory _$ResultEntity([void Function(ResultEntityBuilder) updates]) =>
      (new ResultEntityBuilder()..update(updates)).build();

  _$ResultEntity._({this.logId, this.errorCode, this.errorMsg, this.result})
      : super._();

  @override
  ResultEntity rebuild(void Function(ResultEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResultEntityBuilder toBuilder() => new ResultEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ResultEntity &&
        logId == other.logId &&
        errorCode == other.errorCode &&
        errorMsg == other.errorMsg &&
        result == other.result;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, logId.hashCode), errorCode.hashCode), errorMsg.hashCode),
        result.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('ResultEntity')
          ..add('logId', logId)
          ..add('errorCode', errorCode)
          ..add('errorMsg', errorMsg)
          ..add('result', result))
        .toString();
  }
}

class ResultEntityBuilder
    implements Builder<ResultEntity, ResultEntityBuilder> {
  _$ResultEntity _$v;

  num _logId;
  num get logId => _$this._logId;
  set logId(num logId) => _$this._logId = logId;

  int _errorCode;
  int get errorCode => _$this._errorCode;
  set errorCode(int errorCode) => _$this._errorCode = errorCode;

  String _errorMsg;
  String get errorMsg => _$this._errorMsg;
  set errorMsg(String errorMsg) => _$this._errorMsg = errorMsg;

  ListBuilder<Result> _result;
  ListBuilder<Result> get result =>
      _$this._result ??= new ListBuilder<Result>();
  set result(ListBuilder<Result> result) => _$this._result = result;

  ResultEntityBuilder();

  ResultEntityBuilder get _$this {
    if (_$v != null) {
      _logId = _$v.logId;
      _errorCode = _$v.errorCode;
      _errorMsg = _$v.errorMsg;
      _result = _$v.result?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ResultEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$ResultEntity;
  }

  @override
  void update(void Function(ResultEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$ResultEntity build() {
    _$ResultEntity _$result;
    try {
      _$result = _$v ??
          new _$ResultEntity._(
              logId: logId,
              errorCode: errorCode,
              errorMsg: errorMsg,
              result: _result?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'result';
        _result?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'ResultEntity', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$Result extends Result {
  @override
  final String name;
  @override
  final num score;
  @override
  final BaiKeInfo baiKeInfo;

  factory _$Result([void Function(ResultBuilder) updates]) =>
      (new ResultBuilder()..update(updates)).build();

  _$Result._({this.name, this.score, this.baiKeInfo}) : super._();

  @override
  Result rebuild(void Function(ResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ResultBuilder toBuilder() => new ResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Result &&
        name == other.name &&
        score == other.score &&
        baiKeInfo == other.baiKeInfo;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), score.hashCode), baiKeInfo.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Result')
          ..add('name', name)
          ..add('score', score)
          ..add('baiKeInfo', baiKeInfo))
        .toString();
  }
}

class ResultBuilder implements Builder<Result, ResultBuilder> {
  _$Result _$v;

  String _name;
  String get name => _$this._name;
  set name(String name) => _$this._name = name;

  num _score;
  num get score => _$this._score;
  set score(num score) => _$this._score = score;

  BaiKeInfoBuilder _baiKeInfo;
  BaiKeInfoBuilder get baiKeInfo =>
      _$this._baiKeInfo ??= new BaiKeInfoBuilder();
  set baiKeInfo(BaiKeInfoBuilder baiKeInfo) => _$this._baiKeInfo = baiKeInfo;

  ResultBuilder();

  ResultBuilder get _$this {
    if (_$v != null) {
      _name = _$v.name;
      _score = _$v.score;
      _baiKeInfo = _$v.baiKeInfo?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Result other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$Result;
  }

  @override
  void update(void Function(ResultBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Result build() {
    _$Result _$result;
    try {
      _$result = _$v ??
          new _$Result._(
              name: name, score: score, baiKeInfo: _baiKeInfo?.build());
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'baiKeInfo';
        _baiKeInfo?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'Result', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

class _$BaiKeInfo extends BaiKeInfo {
  @override
  final String baiKeUrl;
  @override
  final String imageUrl;
  @override
  final String description;

  factory _$BaiKeInfo([void Function(BaiKeInfoBuilder) updates]) =>
      (new BaiKeInfoBuilder()..update(updates)).build();

  _$BaiKeInfo._({this.baiKeUrl, this.imageUrl, this.description}) : super._();

  @override
  BaiKeInfo rebuild(void Function(BaiKeInfoBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BaiKeInfoBuilder toBuilder() => new BaiKeInfoBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BaiKeInfo &&
        baiKeUrl == other.baiKeUrl &&
        imageUrl == other.imageUrl &&
        description == other.description;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, baiKeUrl.hashCode), imageUrl.hashCode),
        description.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('BaiKeInfo')
          ..add('baiKeUrl', baiKeUrl)
          ..add('imageUrl', imageUrl)
          ..add('description', description))
        .toString();
  }
}

class BaiKeInfoBuilder implements Builder<BaiKeInfo, BaiKeInfoBuilder> {
  _$BaiKeInfo _$v;

  String _baiKeUrl;
  String get baiKeUrl => _$this._baiKeUrl;
  set baiKeUrl(String baiKeUrl) => _$this._baiKeUrl = baiKeUrl;

  String _imageUrl;
  String get imageUrl => _$this._imageUrl;
  set imageUrl(String imageUrl) => _$this._imageUrl = imageUrl;

  String _description;
  String get description => _$this._description;
  set description(String description) => _$this._description = description;

  BaiKeInfoBuilder();

  BaiKeInfoBuilder get _$this {
    if (_$v != null) {
      _baiKeUrl = _$v.baiKeUrl;
      _imageUrl = _$v.imageUrl;
      _description = _$v.description;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BaiKeInfo other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$BaiKeInfo;
  }

  @override
  void update(void Function(BaiKeInfoBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$BaiKeInfo build() {
    final _$result = _$v ??
        new _$BaiKeInfo._(
            baiKeUrl: baiKeUrl, imageUrl: imageUrl, description: description);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
