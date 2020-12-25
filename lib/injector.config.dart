// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'app/screens/auth/bloc/auth_cubit.dart';
import 'app/screens/chat/chat_cubit.dart';
import 'data/repositories/chat/chat_repository_impl.dart';
import 'data/api/firebase_api_module.dart';
import 'domain/chat/repositories/chat_repository.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final firebaseApiModule = _$FirebaseApiModule();
  gh.lazySingleton<Firestore>(() => firebaseApiModule.firestore);
  gh.factory<IChatRepository>(() => ChatRepositoryImpl(get<Firestore>()));
  gh.factory<AuthCubit>(() => AuthCubit(get<IChatRepository>()));
  gh.factory<ChatCubit>(() => ChatCubit(get<IChatRepository>()));
  return get;
}

class _$FirebaseApiModule extends FirebaseApiModule {}
