import 'package:firebase_chat/app/screens/auth/bloc/auth_cubit.dart';
import 'package:firebase_chat/app/screens/auth/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                this._buildEmailTextField(context),
                SizedBox(height: 20),
                this._buildPasswordTextField(context),
                SizedBox(height: 20),
                this._buildLoginButton(context),
                SizedBox(height: 20),
                this._buildFormSwitcherButton(context)
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmailTextField(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(labelText: 'Email'),
    );
  }

  Widget _buildPasswordTextField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Password'),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 15),
      onPressed: () {},
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildFormSwitcherButton(BuildContext context) {
    return FlatButton(
      onPressed: () {},
      child: Text(
        'Create an account',
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
