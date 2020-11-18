import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shopps/config.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userId;
  DateTime _expirationDate;

  Future<void> signUp(String email, String password) async {
    final res = await http.post(signUpURL, body: json.encode({
      'email': email,
      'password': password,
      'returnSecureToken': true
    }));

    print(json.decode(res.body));
  }
}