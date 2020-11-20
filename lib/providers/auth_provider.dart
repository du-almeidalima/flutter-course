import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopps/config.dart';

class Auth with ChangeNotifier {
  String _token;
  String _userId;
  DateTime _expirationDate;
  Timer _logoutTimer;

  bool get isAuth {
    return this.token != null;
  }

  String get token {
    if (this._token != null &&
        this._expirationDate != null &&
        _expirationDate.isAfter(DateTime.now())
    ) {
      return this._token;
    }

    return null;
  }

  String get userId {
    return this._userId;
  }

  Future<void> _authUser(String email, String password, String url) async {
    try {
      final res = await http.post(url,
          body: json.encode(
              {
                'email': email,
                'password': password,
                'returnSecureToken': true
              }));

      this._handleResponse(json.decode(res.body));
      this._startAutoLogoutTimer(
        this._expirationDate.difference(DateTime.now()
      ));
      notifyListeners();

      final encodedUserData = json.encode({
        'token': this._token,
        'userId': this._userId,
        'expirationDate': this._expirationDate.toIso8601String()
      });
      final sharedPrefs = await SharedPreferences.getInstance();
      sharedPrefs.setString('userData', encodedUserData);
    } catch (e) {
      throw e;
    }
  }

  void _handleResponse(Map<String, dynamic> parsedRes) {
    if (parsedRes['error'] != null) {
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

  Future<bool> tryAutoLogin() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    if (!sharedPrefs.containsKey('userData')) {
      return false;
    }

    final extractedUserData = json.decode(sharedPrefs.getString('userData'));
    final expirationDate = DateTime.parse(extractedUserData['expirationDate']);

    if (expirationDate.isBefore(DateTime.now())) {
      return false;
    }

    this._token = extractedUserData['token'];
    this._userId = extractedUserData['userId'];
    this._expirationDate = DateTime.parse(extractedUserData['expirationDate']);

    // Notifying the Consumer<Auth> in main.dart
    notifyListeners();
    this._startAutoLogoutTimer(this._expirationDate.difference(DateTime.now()));
    return true;
  }

  void signOut() async {
    this._userId = null;
    this._token = null;
    this._expirationDate = null;
    if (this._logoutTimer != null) {
      this._logoutTimer.cancel();
    }

    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.remove('userData');

    notifyListeners();
  }

  void _startAutoLogoutTimer(Duration expirationTime) {
    if (this._logoutTimer != null) {
      this._logoutTimer.cancel();
    }
    this._logoutTimer = Timer(expirationTime, () {
      this.signOut();
    });
  }
}
