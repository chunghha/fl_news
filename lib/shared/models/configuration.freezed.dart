// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'configuration.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Configuration _$ConfigurationFromJson(Map<String, dynamic> json) {
  return _Configuration.fromJson(json);
}

/// @nodoc
class _$ConfigurationTearOff {
  const _$ConfigurationTearOff();

  _Configuration call({required String newsApiKey}) {
    return _Configuration(
      newsApiKey: newsApiKey,
    );
  }

  Configuration fromJson(Map<String, Object> json) {
    return Configuration.fromJson(json);
  }
}

/// @nodoc
const $Configuration = _$ConfigurationTearOff();

/// @nodoc
mixin _$Configuration {
  String get newsApiKey => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConfigurationCopyWith<Configuration> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConfigurationCopyWith<$Res> {
  factory $ConfigurationCopyWith(
          Configuration value, $Res Function(Configuration) then) =
      _$ConfigurationCopyWithImpl<$Res>;
  $Res call({String newsApiKey});
}

/// @nodoc
class _$ConfigurationCopyWithImpl<$Res>
    implements $ConfigurationCopyWith<$Res> {
  _$ConfigurationCopyWithImpl(this._value, this._then);

  final Configuration _value;
  // ignore: unused_field
  final $Res Function(Configuration) _then;

  @override
  $Res call({
    Object? newsApiKey = freezed,
  }) {
    return _then(_value.copyWith(
      newsApiKey: newsApiKey == freezed
          ? _value.newsApiKey
          : newsApiKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ConfigurationCopyWith<$Res>
    implements $ConfigurationCopyWith<$Res> {
  factory _$ConfigurationCopyWith(
          _Configuration value, $Res Function(_Configuration) then) =
      __$ConfigurationCopyWithImpl<$Res>;
  @override
  $Res call({String newsApiKey});
}

/// @nodoc
class __$ConfigurationCopyWithImpl<$Res>
    extends _$ConfigurationCopyWithImpl<$Res>
    implements _$ConfigurationCopyWith<$Res> {
  __$ConfigurationCopyWithImpl(
      _Configuration _value, $Res Function(_Configuration) _then)
      : super(_value, (v) => _then(v as _Configuration));

  @override
  _Configuration get _value => super._value as _Configuration;

  @override
  $Res call({
    Object? newsApiKey = freezed,
  }) {
    return _then(_Configuration(
      newsApiKey: newsApiKey == freezed
          ? _value.newsApiKey
          : newsApiKey // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$_Configuration implements _Configuration {
  _$_Configuration({required this.newsApiKey});

  factory _$_Configuration.fromJson(Map<String, dynamic> json) =>
      _$_$_ConfigurationFromJson(json);

  @override
  final String newsApiKey;

  @override
  String toString() {
    return 'Configuration(newsApiKey: $newsApiKey)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Configuration &&
            (identical(other.newsApiKey, newsApiKey) ||
                const DeepCollectionEquality()
                    .equals(other.newsApiKey, newsApiKey)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newsApiKey);

  @JsonKey(ignore: true)
  @override
  _$ConfigurationCopyWith<_Configuration> get copyWith =>
      __$ConfigurationCopyWithImpl<_Configuration>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ConfigurationToJson(this);
  }
}

abstract class _Configuration implements Configuration {
  factory _Configuration({required String newsApiKey}) = _$_Configuration;

  factory _Configuration.fromJson(Map<String, dynamic> json) =
      _$_Configuration.fromJson;

  @override
  String get newsApiKey => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ConfigurationCopyWith<_Configuration> get copyWith =>
      throw _privateConstructorUsedError;
}
