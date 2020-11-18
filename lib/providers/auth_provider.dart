import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shopps/config.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userId;
  DateTime _expirationDate;

  Future<void> _authUser(String email, String password, String url) async {
    try {
      final res = await http.post(url,
          body: json.encode(
              {'email': email, 'password': password, 'returnSecureToken': true}));

      this._handleResponse(json.decode(res.body));
    } catch(e) {
      throw e;
    }
  }

  void _handleResponse(Map<String, dynamic> parsedRes) {
    if(parsedRes['error'] != null) {
      throw HttpException(parsedRes['error']['message']);
    }

    this._token = parsedRes['idToken'];
    this._userId = parsedRes['localId'];
    this._expirationDate = DateTime.now().add(Duration(
      seconds: int.parse(parsedRes['expiresIn']),
    ));
  }

  Future<void> signUp(String email, String password) async {
    return this._authUser(email, password, signUpURL);
  }

  Future<void> signIn(String email, String password) async {
    return this._authUser(email, password, signInURL);
  }
}
