// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'chat_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ChatStateTearOff {
  const _$ChatStateTearOff();

// ignore: unused_element
  ChatInitial initial() {
    return const ChatInitial();
  }

// ignore: unused_element
  ChatLoading loading() {
    return const ChatLoading();
  }

// ignore: unused_element
  ChatLoaded loaded(List<dynamic> messages) {
    return ChatLoaded(
      messages,
    );
  }

// ignore: unused_element
  ChatError error(Failure failure) {
    return ChatError(
      failure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ChatState = _$ChatStateTearOff();

/// @nodoc
mixin _$ChatState {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult loaded(List<dynamic> messages),
    @required TResult error(Failure failure),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult loaded(List<dynamic> messages),
    TResult error(Failure failure),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(ChatInitial value),
    @required TResult loading(ChatLoading value),
    @required TResult loaded(ChatLoaded value),
    @required TResult error(ChatError value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult initial(ChatInitial value),
    TResult loading(ChatLoading value),
    TResult loaded(ChatLoaded value),
    TResult error(ChatError value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res> implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  final ChatState _value;
  // ignore: unused_field
  final $Res Function(ChatState) _then;
}

/// @nodoc
abstract class $ChatInitialCopyWith<$Res> {
  factory $ChatInitialCopyWith(
          ChatInitial value, $Res Function(ChatInitial) then) =
      _$ChatInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChatInitialCopyWithImpl<$Res> extends _$ChatStateCopyWithImpl<$Res>
    implements $ChatInitialCopyWith<$Res> {
  _$ChatInitialCopyWithImpl(
      ChatInitial _value, $Res Function(ChatInitial) _then)
      : super(_value, (v) => _then(v as ChatInitial));

  @override
  ChatInitial get _value => super._value as ChatInitial;
}

/// @nodoc
class _$ChatInitial implements ChatInitial {
  const _$ChatInitial();

  @override
  String toString() {
    return 'ChatState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ChatInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult loaded(List<dynamic> messages),
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
    TResult loaded(List<dynamic> messages),
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
    @required TResult initial(ChatInitial value),
    @required TResult loading(ChatLoading value),
    @required TResult loaded(ChatLoaded value),
    @required TResult error(ChatError value),
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
    TResult initial(ChatInitial value),
    TResult loading(ChatLoading value),
    TResult loaded(ChatLoaded value),
    TResult error(ChatError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ChatInitial implements ChatState {
  const factory ChatInitial() = _$ChatInitial;
}

/// @nodoc
abstract class $ChatLoadingCopyWith<$Res> {
  factory $ChatLoadingCopyWith(
          ChatLoading value, $Res Function(ChatLoading) then) =
      _$ChatLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$ChatLoadingCopyWithImpl<$Res> extends _$ChatStateCopyWithImpl<$Res>
    implements $ChatLoadingCopyWith<$Res> {
  _$ChatLoadingCopyWithImpl(
      ChatLoading _value, $Res Function(ChatLoading) _then)
      : super(_value, (v) => _then(v as ChatLoading));

  @override
  ChatLoading get _value => super._value as ChatLoading;
}

/// @nodoc
class _$ChatLoading implements ChatLoading {
  const _$ChatLoading();

  @override
  String toString() {
    return 'ChatState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ChatLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult loaded(List<dynamic> messages),
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
    TResult loaded(List<dynamic> messages),
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
    @required TResult initial(ChatInitial value),
    @required TResult loading(ChatLoading value),
    @required TResult loaded(ChatLoaded value),
    @required TResult error(ChatError value),
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
    TResult initial(ChatInitial value),
    TResult loading(ChatLoading value),
    TResult loaded(ChatLoaded value),
    TResult error(ChatError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ChatLoading implements ChatState {
  const factory ChatLoading() = _$ChatLoading;
}

/// @nodoc
abstract class $ChatLoadedCopyWith<$Res> {
  factory $ChatLoadedCopyWith(
          ChatLoaded value, $Res Function(ChatLoaded) then) =
      _$ChatLoadedCopyWithImpl<$Res>;
  $Res call({List<dynamic> messages});
}

/// @nodoc
class _$ChatLoadedCopyWithImpl<$Res> extends _$ChatStateCopyWithImpl<$Res>
    implements $ChatLoadedCopyWith<$Res> {
  _$ChatLoadedCopyWithImpl(ChatLoaded _value, $Res Function(ChatLoaded) _then)
      : super(_value, (v) => _then(v as ChatLoaded));

  @override
  ChatLoaded get _value => super._value as ChatLoaded;

  @override
  $Res call({
    Object messages = freezed,
  }) {
    return _then(ChatLoaded(
      messages == freezed ? _value.messages : messages as List<dynamic>,
    ));
  }
}

/// @nodoc
class _$ChatLoaded implements ChatLoaded {
  const _$ChatLoaded(this.messages) : assert(messages != null);

  @override
  final List<dynamic> messages;

  @override
  String toString() {
    return 'ChatState.loaded(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChatLoaded &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(messages);

  @override
  $ChatLoadedCopyWith<ChatLoaded> get copyWith =>
      _$ChatLoadedCopyWithImpl<ChatLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult loaded(List<dynamic> messages),
    @required TResult error(Failure failure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loaded != null);
    assert(error != null);
    return loaded(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult initial(),
    TResult loading(),
    TResult loaded(List<dynamic> messages),
    TResult error(Failure failure),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult initial(ChatInitial value),
    @required TResult loading(ChatLoading value),
    @required TResult loaded(ChatLoaded value),
    @required TResult error(ChatError value),
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
    TResult initial(ChatInitial value),
    TResult loading(ChatLoading value),
    TResult loaded(ChatLoaded value),
    TResult error(ChatError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ChatLoaded implements ChatState {
  const factory ChatLoaded(List<dynamic> messages) = _$ChatLoaded;

  List<dynamic> get messages;
  $ChatLoadedCopyWith<ChatLoaded> get copyWith;
}

/// @nodoc
abstract class $ChatErrorCopyWith<$Res> {
  factory $ChatErrorCopyWith(ChatError value, $Res Function(ChatError) then) =
      _$ChatErrorCopyWithImpl<$Res>;
  $Res call({Failure failure});
}

/// @nodoc
class _$ChatErrorCopyWithImpl<$Res> extends _$ChatStateCopyWithImpl<$Res>
    implements $ChatErrorCopyWith<$Res> {
  _$ChatErrorCopyWithImpl(ChatError _value, $Res Function(ChatError) _then)
      : super(_value, (v) => _then(v as ChatError));

  @override
  ChatError get _value => super._value as ChatError;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(ChatError(
      failure == freezed ? _value.failure : failure as Failure,
    ));
  }
}

/// @nodoc
class _$ChatError implements ChatError {
  const _$ChatError(this.failure) : assert(failure != null);

  @override
  final Failure failure;

  @override
  String toString() {
    return 'ChatState.error(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ChatError &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  $ChatErrorCopyWith<ChatError> get copyWith =>
      _$ChatErrorCopyWithImpl<ChatError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult initial(),
    @required TResult loading(),
    @required TResult loaded(List<dynamic> messages),
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
    TResult loaded(List<dynamic> messages),
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
    @required TResult initial(ChatInitial value),
    @required TResult loading(ChatLoading value),
    @required TResult loaded(ChatLoaded value),
    @required TResult error(ChatError value),
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
    TResult initial(ChatInitial value),
    TResult loading(ChatLoading value),
    TResult loaded(ChatLoaded value),
    TResult error(ChatError value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ChatError implements ChatState {
  const factory ChatError(Failure failure) = _$ChatError;

  Failure get failure;
  $ChatErrorCopyWith<ChatError> get copyWith;
}
