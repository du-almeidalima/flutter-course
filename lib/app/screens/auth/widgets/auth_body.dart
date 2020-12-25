import 'package:firebase_chat/app/screens/auth/widgets/auth_form.dart';
import 'package:flutter/material.dart';

class AuthBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              this._buildLogo(context),
              AuthForm(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Column(
      children: [
        Image.asset('assets/images/firebase-logo.png'),
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

// Flexible(
// flex: 2,
//
// ),
// Flexible(
// flex: 1,

// ),
// ),
