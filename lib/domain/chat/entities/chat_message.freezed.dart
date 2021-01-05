// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'chat_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ChatMessageTearOff {
  const _$ChatMessageTearOff();

// ignore: unused_element
  _ChatMessage call(
      {@required String id,
      @required String content,
      @required String username,
      @required bool isMe}) {
    return _ChatMessage(
      id: id,
      content: content,
      username: username,
      isMe: isMe,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ChatMessage = _$ChatMessageTearOff();

/// @nodoc
mixin _$ChatMessage {
  String get id;
  String get content;
  String get username;
  bool get isMe;

  $ChatMessageCopyWith<ChatMessage> get copyWith;
}

/// @nodoc
abstract class $ChatMessageCopyWith<$Res> {
  factory $ChatMessageCopyWith(
          ChatMessage value, $Res Function(ChatMessage) then) =
      _$ChatMessageCopyWithImpl<$Res>;
  $Res call({String id, String content, String username, bool isMe});
}

/// @nodoc
class _$ChatMessageCopyWithImpl<$Res> implements $ChatMessageCopyWith<$Res> {
  _$ChatMessageCopyWithImpl(this._value, this._then);

  final ChatMessage _value;
  // ignore: unused_field
  final $Res Function(ChatMessage) _then;

  @override
  $Res call({
    Object id = freezed,
    Object content = freezed,
    Object username = freezed,
    Object isMe = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      content: content == freezed ? _value.content : content as String,
      username: username == freezed ? _value.username : username as String,
      isMe: isMe == freezed ? _value.isMe : isMe as bool,
    ));
  }
}

/// @nodoc
abstract class _$ChatMessageCopyWith<$Res>
    implements $ChatMessageCopyWith<$Res> {
  factory _$ChatMessageCopyWith(
          _ChatMessage value, $Res Function(_ChatMessage) then) =
      __$ChatMessageCopyWithImpl<$Res>;
  @override
  $Res call({String id, String content, String username, bool isMe});
}

/// @nodoc
class __$ChatMessageCopyWithImpl<$Res> extends _$ChatMessageCopyWithImpl<$Res>
    implements _$ChatMessageCopyWith<$Res> {
  __$ChatMessageCopyWithImpl(
      _ChatMessage _value, $Res Function(_ChatMessage) _then)
      : super(_value, (v) => _then(v as _ChatMessage));

  @override
  _ChatMessage get _value => super._value as _ChatMessage;

  @override
  $Res call({
    Object id = freezed,
    Object content = freezed,
    Object username = freezed,
    Object isMe = freezed,
  }) {
    return _then(_ChatMessage(
      id: id == freezed ? _value.id : id as String,
      content: content == freezed ? _value.content : content as String,
      username: username == freezed ? _value.username : username as String,
      isMe: isMe == freezed ? _value.isMe : isMe as bool,
    ));
  }
}

/// @nodoc
class _$_ChatMessage extends _ChatMessage with DiagnosticableTreeMixin {
  const _$_ChatMessage(
      {@required this.id,
      @required this.content,
      @required this.username,
      @required this.isMe})
      : assert(id != null),
        assert(content != null),
        assert(username != null),
        assert(isMe != null),
        super._();

  @override
  final String id;
  @override
  final String content;
  @override
  final String username;
  @override
  final bool isMe;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ChatMessage(id: $id, content: $content, username: $username, isMe: $isMe)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ChatMessage'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('content', content))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('isMe', isMe));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChatMessage &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.content, content) ||
                const DeepCollectionEquality()
                    .equals(other.content, content)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.isMe, isMe) ||
                const DeepCollectionEquality().equals(other.isMe, isMe)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(content) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(isMe);

  @override
  _$ChatMessageCopyWith<_ChatMessage> get copyWith =>
      __$ChatMessageCopyWithImpl<_ChatMessage>(this, _$identity);
}

abstract class _ChatMessage extends ChatMessage {
  const _ChatMessage._() : super._();
  const factory _ChatMessage(
      {@required String id,
      @required String content,
      @required String username,
      @required bool isMe}) = _$_ChatMessage;

  @override
  String get id;
  @override
  String get content;
  @override
  String get username;
  @override
  bool get isMe;
  @override
  _$ChatMessageCopyWith<_ChatMessage> get copyWith;
}
