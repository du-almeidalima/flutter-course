import 'package:firebase_chat/app/screens/auth/widgets/auth_form.dart';
import 'package:flutter/material.dart';

class AuthBody extends StatefulWidget {
  @override
  _AuthBodyState createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody> {
  bool isLogin = true;

  void _switchAuthFormMode() {
    setState(() {
      this.isLogin = !this.isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final statusBarHeight = MediaQuery.of(context).padding.top;
    final screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      padding: EdgeInsets.only(top: statusBarHeight),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: screenHeight - statusBarHeight,
          minWidth: screenWidth,
        ),
        child: IntrinsicHeight(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(this.isLogin) this._buildLogo(context),
              Expanded(
                flex: this.isLogin ? 0 : 1,
                child: AuthForm(
                  switchAuthFormMode: this._switchAuthFormMode,
                  isLogin: this.isLogin,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/firebase-logo.png',
          height: MediaQuery.of(context).size.height * 0.4,
        ),
        RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            text: 'Firebase ',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            children: [
              const TextSpan(
                text: 'Chat',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
