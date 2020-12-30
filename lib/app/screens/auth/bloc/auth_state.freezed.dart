// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'auth_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

// ignore: unused_element
  AuthInitial initial() {
    return const AuthInitial();
  }

// ignore: unused_element
  AuthLoading loading() {
    return const AuthLoading();
  }

// ignore: unused_element
  AuthLoaded loaded() {
    return const AuthLoaded();
  }

// ignore: unused_element
  AuthError error(Failure failure) {
    return AuthError(
      failure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult loaded(),
    @required TResult error(Failure failure),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult loaded(),
    TResult error(Failure failure),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(AuthInitial value),
    @required TResult loading(AuthLoading value),
    @required TResult loaded(AuthLoaded value),
    @required TResult error(AuthError value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(AuthInitial value),
    TResult loading(AuthLoading value),
    TResult loaded(AuthLoaded value),
    TResult error(AuthError value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

/// @nodoc
abstract class $AuthInitialCopyWith<$Res> {
  factory $AuthInitialCopyWith(
          AuthInitial value, $Res Function(AuthInitial) then) =
      _$AuthInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthInitialCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthInitialCopyWith<$Res> {
  _$AuthInitialCopyWithImpl(
      AuthInitial _value, $Res Function(AuthInitial) _then)
      : super(_value, (v) => _then(v as AuthInitial));

  @override
  AuthInitial get _value => super._value as AuthInitial;
}

/// @nodoc
class _$AuthInitial implements AuthInitial {
  const _$AuthInitial();

  @override
  String toString() {
    return 'AuthState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult loaded(),
    @required TResult error(Failure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult loaded(),
    TResult error(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(AuthInitial value),
    @required TResult loading(AuthLoading value),
    @required TResult loaded(AuthLoaded value),
    @required TResult error(AuthError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(AuthInitial value),
    TResult loading(AuthLoading value),
    TResult loaded(AuthLoaded value),
    TResult error(AuthError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class AuthInitial implements AuthState {
  const factory AuthInitial() = _$AuthInitial;
}

/// @nodoc
abstract class $AuthLoadingCopyWith<$Res> {
  factory $AuthLoadingCopyWith(
          AuthLoading value, $Res Function(AuthLoading) then) =
      _$AuthLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthLoadingCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthLoadingCopyWith<$Res> {
  _$AuthLoadingCopyWithImpl(
      AuthLoading _value, $Res Function(AuthLoading) _then)
      : super(_value, (v) => _then(v as AuthLoading));

  @override
  AuthLoading get _value => super._value as AuthLoading;
}

/// @nodoc
class _$AuthLoading implements AuthLoading {
  const _$AuthLoading();

  @override
  String toString() {
    return 'AuthState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult loaded(),
    @required TResult error(Failure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult loaded(),
    TResult error(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(AuthInitial value),
    @required TResult loading(AuthLoading value),
    @required TResult loaded(AuthLoaded value),
    @required TResult error(AuthError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(AuthInitial value),
    TResult loading(AuthLoading value),
    TResult loaded(AuthLoaded value),
    TResult error(AuthError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AuthLoading implements AuthState {
  const factory AuthLoading() = _$AuthLoading;
}

/// @nodoc
abstract class $AuthLoadedCopyWith<$Res> {
  factory $AuthLoadedCopyWith(
          AuthLoaded value, $Res Function(AuthLoaded) then) =
      _$AuthLoadedCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthLoadedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthLoadedCopyWith<$Res> {
  _$AuthLoadedCopyWithImpl(AuthLoaded _value, $Res Function(AuthLoaded) _then)
      : super(_value, (v) => _then(v as AuthLoaded));

  @override
  AuthLoaded get _value => super._value as AuthLoaded;
}

/// @nodoc
class _$AuthLoaded implements AuthLoaded {
  const _$AuthLoaded();

  @override
  String toString() {
    return 'AuthState.loaded()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult loaded(),
    @required TResult error(Failure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return loaded();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult loaded(),
    TResult error(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(AuthInitial value),
    @required TResult loading(AuthLoading value),
    @required TResult loaded(AuthLoaded value),
    @required TResult error(AuthError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(AuthInitial value),
    TResult loading(AuthLoading value),
    TResult loaded(AuthLoaded value),
    TResult error(AuthError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class AuthLoaded implements AuthState {
  const factory AuthLoaded() = _$AuthLoaded;
}

/// @nodoc
abstract class $AuthErrorCopyWith<$Res> {
  factory $AuthErrorCopyWith(AuthError value, $Res Function(AuthError) then) =
      _$AuthErrorCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class _$AuthErrorCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthErrorCopyWith<$Res> {
  _$AuthErrorCopyWithImpl(AuthError _value, $Res Function(AuthError) _then)
      : super(_value, (v) => _then(v as AuthError));

  @override
  AuthError get _value => super._value as AuthError;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(AuthError(
      failure == freezed ? _value.failure : failure as Failure,
    ));
  }
}

/// @nodoc
class _$AuthError implements AuthError {
  const _$AuthError(this.failure) : assert(failure != null);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'AuthState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AuthError &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  $AuthErrorCopyWith<AuthError> get copyWith =>
      _$AuthErrorCopyWithImpl<AuthError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult loaded(),
    @required TResult error(Failure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return error(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult loaded(),
    TResult error(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(AuthInitial value),
    @required TResult loading(AuthLoading value),
    @required TResult loaded(AuthLoaded value),
    @required TResult error(AuthError value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(AuthInitial value),
    TResult loading(AuthLoading value),
    TResult loaded(AuthLoaded value),
    TResult error(AuthError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AuthError implements AuthState {
  const factory AuthError(Failure failure) = _$AuthError;

  Failure get failure;
  $AuthErrorCopyWith<AuthError> get copyWith;
}
