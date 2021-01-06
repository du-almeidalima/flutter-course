import 'package:firebase_chat/app/screens/auth/bloc/auth_cubit.dart';
import 'package:firebase_chat/app/screens/auth/bloc/auth_state.dart';
import 'package:firebase_chat/app/screens/auth/widgets/auth_profile_image_picker.dart';
import 'package:firebase_chat/app/shared/validators/email_validator.dart';
import 'package:firebase_chat/app/shared/validators/password_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthForm extends StatefulWidget {
  final bool isLogin;
  final Function switchAuthFormMode;

  const AuthForm({
    Key key,
    @required this.isLogin,
    @required this.switchAuthFormMode,
  }) : super(key: key);

  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  bool _showFormErrors = false;
  bool _hidePassword = true;
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

    // Submit values according to form type
    widget.isLogin
        ? context.read<AuthCubit>().signInWithEmailAndPassword(
              this._emailField,
              this._passwordField,
            )
        : context.read<AuthCubit>().createUserWithEmailAndPassword(
              this._emailField,
              this._passwordField,
              this._userNameField,
            );
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
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!widget.isLogin) AuthProfileImagePicker(),
                this._buildEmailTextField(context),
                SizedBox(height: 20),
                if (!widget.isLogin) this._buildUserNameTextField(context),
                if (!widget.isLogin) SizedBox(height: 20),
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
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return state.maybeMap(
                loading: (_) => CircularProgressIndicator(),
                orElse: () => Text(
                  widget.isLogin ? 'Login' : 'Sign Up',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          )),
    );
  }

  Widget _buildFormSwitcherButton(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: FlatButton(
        onPressed: widget.switchAuthFormMode,
        child: Text(
          widget.isLogin ? 'Create an account' : 'Back to login',
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
