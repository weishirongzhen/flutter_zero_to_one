// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token_entity.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<AccessTokenEntity> _$accessTokenEntitySerializer =
    new _$AccessTokenEntitySerializer();

class _$AccessTokenEntitySerializer
    implements StructuredSerializer<AccessTokenEntity> {
  @override
  final Iterable<Type> types = const [AccessTokenEntity, _$AccessTokenEntity];
  @override
  final String wireName = 'AccessTokenEntity';

  @override
  Iterable<Object> serialize(Serializers serializers, AccessTokenEntity object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    if (object.refreshToken != null) {
      result
        ..add('refresh_token')
        ..add(serializers.serialize(object.refreshToken,
            specifiedType: const FullType(String)));
    }
    if (object.expiresIn != null) {
      result
        ..add('expires_in')
        ..add(serializers.serialize(object.expiresIn,
            specifiedType: const FullType(int)));
    }
    if (object.sessionKey != null) {
      result
        ..add('session_key')
        ..add(serializers.serialize(object.sessionKey,
            specifiedType: const FullType(String)));
    }
    if (object.accessToken != null) {
      result
        ..add('access_token')
        ..add(serializers.serialize(object.accessToken,
            specifiedType: const FullType(String)));
    }
    if (object.scope != null) {
      result
        ..add('scope')
        ..add(serializers.serialize(object.scope,
            specifiedType: const FullType(String)));
    }
    if (object.sessionSecret != null) {
      result
        ..add('session_secret')
        ..add(serializers.serialize(object.sessionSecret,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  AccessTokenEntity deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new AccessTokenEntityBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final dynamic value = iterator.current;
      switch (key) {
        case 'refresh_token':
          result.refreshToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'expires_in':
          result.expiresIn = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'session_key':
          result.sessionKey = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'access_token':
          result.accessToken = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'scope':
          result.scope = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'session_secret':
          result.sessionSecret = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
      }
    }

    return result.build();
  }
}

class _$AccessTokenEntity extends AccessTokenEntity {
  @override
  final String refreshToken;
  @override
  final int expiresIn;
  @override
  final String sessionKey;
  @override
  final String accessToken;
  @override
  final String scope;
  @override
  final String sessionSecret;

  factory _$AccessTokenEntity(
          [void Function(AccessTokenEntityBuilder) updates]) =>
      (new AccessTokenEntityBuilder()..update(updates)).build();

  _$AccessTokenEntity._(
      {this.refreshToken,
      this.expiresIn,
      this.sessionKey,
      this.accessToken,
      this.scope,
      this.sessionSecret})
      : super._();

  @override
  AccessTokenEntity rebuild(void Function(AccessTokenEntityBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  AccessTokenEntityBuilder toBuilder() =>
      new AccessTokenEntityBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is AccessTokenEntity &&
        refreshToken == other.refreshToken &&
        expiresIn == other.expiresIn &&
        sessionKey == other.sessionKey &&
        accessToken == other.accessToken &&
        scope == other.scope &&
        sessionSecret == other.sessionSecret;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, refreshToken.hashCode), expiresIn.hashCode),
                    sessionKey.hashCode),
                accessToken.hashCode),
            scope.hashCode),
        sessionSecret.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('AccessTokenEntity')
          ..add('refreshToken', refreshToken)
          ..add('expiresIn', expiresIn)
          ..add('sessionKey', sessionKey)
          ..add('accessToken', accessToken)
          ..add('scope', scope)
          ..add('sessionSecret', sessionSecret))
        .toString();
  }
}

class AccessTokenEntityBuilder
    implements Builder<AccessTokenEntity, AccessTokenEntityBuilder> {
  _$AccessTokenEntity _$v;

  String _refreshToken;
  String get refreshToken => _$this._refreshToken;
  set refreshToken(String refreshToken) => _$this._refreshToken = refreshToken;

  int _expiresIn;
  int get expiresIn => _$this._expiresIn;
  set expiresIn(int expiresIn) => _$this._expiresIn = expiresIn;

  String _sessionKey;
  String get sessionKey => _$this._sessionKey;
  set sessionKey(String sessionKey) => _$this._sessionKey = sessionKey;

  String _accessToken;
  String get accessToken => _$this._accessToken;
  set accessToken(String accessToken) => _$this._accessToken = accessToken;

  String _scope;
  String get scope => _$this._scope;
  set scope(String scope) => _$this._scope = scope;

  String _sessionSecret;
  String get sessionSecret => _$this._sessionSecret;
  set sessionSecret(String sessionSecret) =>
      _$this._sessionSecret = sessionSecret;

  AccessTokenEntityBuilder();

  AccessTokenEntityBuilder get _$this {
    if (_$v != null) {
      _refreshToken = _$v.refreshToken;
      _expiresIn = _$v.expiresIn;
      _sessionKey = _$v.sessionKey;
      _accessToken = _$v.accessToken;
      _scope = _$v.scope;
      _sessionSecret = _$v.sessionSecret;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(AccessTokenEntity other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$AccessTokenEntity;
  }

  @override
  void update(void Function(AccessTokenEntityBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$AccessTokenEntity build() {
    final _$result = _$v ??
        new _$AccessTokenEntity._(
            refreshToken: refreshToken,
            expiresIn: expiresIn,
            sessionKey: sessionKey,
            accessToken: accessToken,
            scope: scope,
            sessionSecret: sessionSecret);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
