import 'package:firebase_chat/domain/chat/repositories/chat_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {

  final IChatRepository _chatRepository;

  AuthCubit(this._chatRepository) : super(const AuthState.initial());
}