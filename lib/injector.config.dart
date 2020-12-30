// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'app/screens/auth/bloc/auth_cubit.dart';
import 'data/auth/auth_repository_impl.dart';
import 'app/screens/chat/chat_cubit.dart';
import 'data/chat/chat_repository_impl.dart';
import 'data/core/firebase_api_module.dart';
import 'domain/auth/auth_repository.dart';
import 'domain/chat/chat_repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseApiModule = _$FirebaseApiModule();
  gh.lazySingleton<FirebaseAuth>(() => firebaseApiModule.firebaseAuth);
  gh.lazySingleton<Firestore>(() => firebaseApiModule.firestore);
  gh.factory<IAuthRepository>(() => AuthRepositoryImpl(get<FirebaseAuth>()));
  gh.factory<IChatRepository>(() => ChatRepositoryImpl(get<Firestore>()));
  gh.factory<ChatCubit>(() => ChatCubit(get<IChatRepository>()));

  // Eager singletons must be registered in the right order
  gh.singleton<AuthCubit>(AuthCubit(get<IAuthRepository>()));
  return get;
}

class _$FirebaseApiModule extends FirebaseApiModule {}
