import 'package:flutter/cupertino.dart';

const baseURL = 'https://du-flutter-shopps.firebaseio.com/';
const apiKey = 'AIzaSyCPK1sgZiCTuMl0UC5Or4IwrE5EmK8tul8';
const signUpURL =
    'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=$apiKey';
const signInURL =
    'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=$apiKey';

/// Builds an URL with the resource and auth token in the Firebase format.
String getAuthURL({
  @required String resource,
  @required String token,
  String params = '',
}) {
  return '$baseURL/$resource.json?auth=$token$params';
}
