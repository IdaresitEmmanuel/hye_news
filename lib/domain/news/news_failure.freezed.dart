// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'news_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NewsFailureTearOff {
  const _$NewsFailureTearOff();

  NetWorkFailure networkFailure() {
    return const NetWorkFailure();
  }

  UnexpectedFailure unexpectedFailure({required String failure}) {
    return UnexpectedFailure(
      failure: failure,
    );
  }
}

/// @nodoc
const $NewsFailure = _$NewsFailureTearOff();

/// @nodoc
mixin _$NewsFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkFailure,
    required TResult Function(String failure) unexpectedFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? networkFailure,
    TResult Function(String failure)? unexpectedFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkFailure,
    TResult Function(String failure)? unexpectedFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetWorkFailure value) networkFailure,
    required TResult Function(UnexpectedFailure value) unexpectedFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NetWorkFailure value)? networkFailure,
    TResult Function(UnexpectedFailure value)? unexpectedFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetWorkFailure value)? networkFailure,
    TResult Function(UnexpectedFailure value)? unexpectedFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsFailureCopyWith<$Res> {
  factory $NewsFailureCopyWith(
          NewsFailure value, $Res Function(NewsFailure) then) =
      _$NewsFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$NewsFailureCopyWithImpl<$Res> implements $NewsFailureCopyWith<$Res> {
  _$NewsFailureCopyWithImpl(this._value, this._then);

  final NewsFailure _value;
  // ignore: unused_field
  final $Res Function(NewsFailure) _then;
}

/// @nodoc
abstract class $NetWorkFailureCopyWith<$Res> {
  factory $NetWorkFailureCopyWith(
          NetWorkFailure value, $Res Function(NetWorkFailure) then) =
      _$NetWorkFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$NetWorkFailureCopyWithImpl<$Res> extends _$NewsFailureCopyWithImpl<$Res>
    implements $NetWorkFailureCopyWith<$Res> {
  _$NetWorkFailureCopyWithImpl(
      NetWorkFailure _value, $Res Function(NetWorkFailure) _then)
      : super(_value, (v) => _then(v as NetWorkFailure));

  @override
  NetWorkFailure get _value => super._value as NetWorkFailure;
}

/// @nodoc

class _$NetWorkFailure implements NetWorkFailure {
  const _$NetWorkFailure();

  @override
  String toString() {
    return 'NewsFailure.networkFailure()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NetWorkFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkFailure,
    required TResult Function(String failure) unexpectedFailure,
  }) {
    return networkFailure();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? networkFailure,
    TResult Function(String failure)? unexpectedFailure,
  }) {
    return networkFailure?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkFailure,
    TResult Function(String failure)? unexpectedFailure,
    required TResult orElse(),
  }) {
    if (networkFailure != null) {
      return networkFailure();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetWorkFailure value) networkFailure,
    required TResult Function(UnexpectedFailure value) unexpectedFailure,
  }) {
    return networkFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NetWorkFailure value)? networkFailure,
    TResult Function(UnexpectedFailure value)? unexpectedFailure,
  }) {
    return networkFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetWorkFailure value)? networkFailure,
    TResult Function(UnexpectedFailure value)? unexpectedFailure,
    required TResult orElse(),
  }) {
    if (networkFailure != null) {
      return networkFailure(this);
    }
    return orElse();
  }
}

abstract class NetWorkFailure implements NewsFailure {
  const factory NetWorkFailure() = _$NetWorkFailure;
}

/// @nodoc
abstract class $UnexpectedFailureCopyWith<$Res> {
  factory $UnexpectedFailureCopyWith(
          UnexpectedFailure value, $Res Function(UnexpectedFailure) then) =
      _$UnexpectedFailureCopyWithImpl<$Res>;
  $Res call({String failure});
}

/// @nodoc
class _$UnexpectedFailureCopyWithImpl<$Res>
    extends _$NewsFailureCopyWithImpl<$Res>
    implements $UnexpectedFailureCopyWith<$Res> {
  _$UnexpectedFailureCopyWithImpl(
      UnexpectedFailure _value, $Res Function(UnexpectedFailure) _then)
      : super(_value, (v) => _then(v as UnexpectedFailure));

  @override
  UnexpectedFailure get _value => super._value as UnexpectedFailure;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(UnexpectedFailure(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UnexpectedFailure implements UnexpectedFailure {
  const _$UnexpectedFailure({required this.failure});

  @override
  final String failure;

  @override
  String toString() {
    return 'NewsFailure.unexpectedFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UnexpectedFailure &&
            const DeepCollectionEquality().equals(other.failure, failure));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(failure));

  @JsonKey(ignore: true)
  @override
  $UnexpectedFailureCopyWith<UnexpectedFailure> get copyWith =>
      _$UnexpectedFailureCopyWithImpl<UnexpectedFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() networkFailure,
    required TResult Function(String failure) unexpectedFailure,
  }) {
    return unexpectedFailure(failure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? networkFailure,
    TResult Function(String failure)? unexpectedFailure,
  }) {
    return unexpectedFailure?.call(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? networkFailure,
    TResult Function(String failure)? unexpectedFailure,
    required TResult orElse(),
  }) {
    if (unexpectedFailure != null) {
      return unexpectedFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NetWorkFailure value) networkFailure,
    required TResult Function(UnexpectedFailure value) unexpectedFailure,
  }) {
    return unexpectedFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(NetWorkFailure value)? networkFailure,
    TResult Function(UnexpectedFailure value)? unexpectedFailure,
  }) {
    return unexpectedFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NetWorkFailure value)? networkFailure,
    TResult Function(UnexpectedFailure value)? unexpectedFailure,
    required TResult orElse(),
  }) {
    if (unexpectedFailure != null) {
      return unexpectedFailure(this);
    }
    return orElse();
  }
}

abstract class UnexpectedFailure implements NewsFailure {
  const factory UnexpectedFailure({required String failure}) =
      _$UnexpectedFailure;

  String get failure;
  @JsonKey(ignore: true)
  $UnexpectedFailureCopyWith<UnexpectedFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
