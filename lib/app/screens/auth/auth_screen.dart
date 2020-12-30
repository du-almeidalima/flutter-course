import 'package:firebase_chat/app/screens/auth/bloc/auth_cubit.dart';
import 'package:firebase_chat/app/screens/auth/bloc/auth_state.dart';
import 'package:firebase_chat/app/screens/auth/widgets/auth_body.dart';
import 'package:firebase_chat/app/shared/widgets/snackbar_builder.dart';
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
          child: BlocListener<AuthCubit, AuthState>(
            listener: (context, state) {
              state.maybeMap(
                error: (error) {
                  Scaffold.of(context).showSnackBar(SnackBarBuilder.fromFailure(
                    failure: error.failure,
                    context: context,
                  ));
                },
                orElse: () => null,
              );
            },
            child: AuthBody(),
          ),
        ),
      ),
    );
  }
}
