import 'package:firebase_chat/app/screens/auth/widgets/auth_form.dart';
import 'package:flutter/material.dart';

class AuthBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // padding: EdgeInsets.only(bottom: 20),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height - 25,
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: IntrinsicHeight(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              this._buildLogo(context),
              AuthForm(),
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
