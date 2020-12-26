import 'package:firebase_chat/app/screens/auth/bloc/auth_cubit.dart';
import 'package:firebase_chat/app/screens/auth/bloc/auth_state.dart';
import 'package:firebase_chat/app/shared/validators/email_validator.dart';
import 'package:firebase_chat/app/shared/validators/password_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoginForm = true;
  bool _showFormErrors = false;
  bool _hidePassword = false;
  String _emailField = '';
  String _userNameField = '';
  String _passwordField = '';

  void _formSubmitHandler() {
    final isValid = this._formKey.currentState.validate();

    // Retract soft keyboard
    FocusScope.of(context).unfocus();

    // Validate Form
    if (!isValid) {
      setState(() {
        this._showFormErrors = true;
      });
      return;
    }

    this._formKey.currentState.save();
    print(this._emailField);
    print(this._userNameField);
    print(this._passwordField);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Form(
            autovalidateMode: this._showFormErrors
                ? AutovalidateMode.onUserInteraction
                : AutovalidateMode.disabled,
            key: _formKey,
            child: Column(
              children: [
                this._buildEmailTextField(context),
                SizedBox(height: 20),
                if (!this._isLoginForm) this._buildUserNameTextField(context),
                if (!this._isLoginForm) SizedBox(height: 20),
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
      key: ValueKey('email'),
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: emailValidator,
      decoration: InputDecoration(labelText: 'Email'),
      onChanged: (value) {
        this._emailField = value;
      },
    );
  }

  Widget _buildUserNameTextField(BuildContext context) {
    return TextFormField(
      key: ValueKey('username'),
      initialValue: this._userNameField,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(labelText: 'Username'),
      onChanged: (value) {
        this._userNameField = value;
      },
    );
  }

  Widget _buildPasswordTextField(BuildContext context) {
    return TextFormField(
      key: ValueKey('password'),
      obscureText: this._hidePassword,
      textInputAction: TextInputAction.done,
      validator: passwordValidator,
      decoration: InputDecoration(
          labelText: 'Password',
          suffixIcon: IconButton(
            icon: Icon(
              this._hidePassword ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                this._hidePassword = !this._hidePassword;
              });
            },
          )),
      onChanged: (value) {
        this._passwordField = value;
      },
      onFieldSubmitted: (_) {
        this._formSubmitHandler();
      },
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        padding: EdgeInsets.symmetric(vertical: 15),
        onPressed: this._formSubmitHandler,
        child: Text(
          this._isLoginForm ? 'Login' : 'Sign Up',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildFormSwitcherButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: () {
          setState(() {
            this._isLoginForm = !this._isLoginForm;
          });
        },
        child: Text(
          this._isLoginForm ? 'Create an account' : 'Back to login',
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
