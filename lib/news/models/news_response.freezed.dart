// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NewsResponse _$NewsResponseFromJson(Map<String, dynamic> json) {
  return _NewsResponse.fromJson(json);
}

/// @nodoc
class _$NewsResponseTearOff {
  const _$NewsResponseTearOff();

  _NewsResponse call(
      {String? status, int? totalResults, List<Article>? articles}) {
    return _NewsResponse(
      status: status,
      totalResults: totalResults,
      articles: articles,
    );
  }

  NewsResponse fromJson(Map<String, Object?> json) {
    return NewsResponse.fromJson(json);
  }
}

/// @nodoc
const $NewsResponse = _$NewsResponseTearOff();

/// @nodoc
mixin _$NewsResponse {
  String? get status => throw _privateConstructorUsedError;
  int? get totalResults => throw _privateConstructorUsedError;
  List<Article>? get articles => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NewsResponseCopyWith<NewsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsResponseCopyWith<$Res> {
  factory $NewsResponseCopyWith(
          NewsResponse value, $Res Function(NewsResponse) then) =
      _$NewsResponseCopyWithImpl<$Res>;
  $Res call({String? status, int? totalResults, List<Article>? articles});
}

/// @nodoc
class _$NewsResponseCopyWithImpl<$Res> implements $NewsResponseCopyWith<$Res> {
  _$NewsResponseCopyWithImpl(this._value, this._then);

  final NewsResponse _value;
  // ignore: unused_field
  final $Res Function(NewsResponse) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? articles = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      articles: articles == freezed
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>?,
    ));
  }
}

/// @nodoc
abstract class _$NewsResponseCopyWith<$Res>
    implements $NewsResponseCopyWith<$Res> {
  factory _$NewsResponseCopyWith(
          _NewsResponse value, $Res Function(_NewsResponse) then) =
      __$NewsResponseCopyWithImpl<$Res>;
  @override
  $Res call({String? status, int? totalResults, List<Article>? articles});
}

/// @nodoc
class __$NewsResponseCopyWithImpl<$Res> extends _$NewsResponseCopyWithImpl<$Res>
    implements _$NewsResponseCopyWith<$Res> {
  __$NewsResponseCopyWithImpl(
      _NewsResponse _value, $Res Function(_NewsResponse) _then)
      : super(_value, (v) => _then(v as _NewsResponse));

  @override
  _NewsResponse get _value => super._value as _NewsResponse;

  @override
  $Res call({
    Object? status = freezed,
    Object? totalResults = freezed,
    Object? articles = freezed,
  }) {
    return _then(_NewsResponse(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      totalResults: totalResults == freezed
          ? _value.totalResults
          : totalResults // ignore: cast_nullable_to_non_nullable
              as int?,
      articles: articles == freezed
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NewsResponse implements _NewsResponse {
  _$_NewsResponse({this.status, this.totalResults, this.articles});

  factory _$_NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$$_NewsResponseFromJson(json);

  @override
  final String? status;
  @override
  final int? totalResults;
  @override
  final List<Article>? articles;

  @override
  String toString() {
    return 'NewsResponse(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsResponse &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.totalResults, totalResults) &&
            const DeepCollectionEquality().equals(other.articles, articles));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(totalResults),
      const DeepCollectionEquality().hash(articles));

  @JsonKey(ignore: true)
  @override
  _$NewsResponseCopyWith<_NewsResponse> get copyWith =>
      __$NewsResponseCopyWithImpl<_NewsResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NewsResponseToJson(this);
  }
}

abstract class _NewsResponse implements NewsResponse {
  factory _NewsResponse(
      {String? status,
      int? totalResults,
      List<Article>? articles}) = _$_NewsResponse;

  factory _NewsResponse.fromJson(Map<String, dynamic> json) =
      _$_NewsResponse.fromJson;

  @override
  String? get status;
  @override
  int? get totalResults;
  @override
  List<Article>? get articles;
  @override
  @JsonKey(ignore: true)
  _$NewsResponseCopyWith<_NewsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
