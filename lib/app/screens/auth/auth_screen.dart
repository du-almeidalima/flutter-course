import 'package:firebase_chat/app/screens/auth/bloc/auth_cubit.dart';
import 'package:firebase_chat/app/screens/auth/widgets/auth_body.dart';
import 'package:firebase_chat/injector.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (_) => getIt<AuthCubit>(),
          child: AuthBody(),
        ),
      ),
    );
  }
}
