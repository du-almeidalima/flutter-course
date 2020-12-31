import 'package:firebase_chat/app/screens/auth/auth_screen.dart';
import 'package:firebase_chat/app/screens/chat/chat_screen.dart';
import 'package:firebase_chat/injector.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencyInjection();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.orange,
        backgroundColor: Colors.orange[300],
        accentColor: Colors.lightBlueAccent,
        accentColorBrightness: Brightness.light,
        buttonTheme: ButtonTheme.of(context).copyWith(
          buttonColor: Colors.black87,
          textTheme: ButtonTextTheme.primary
        )
      ),
      home: false ? ChatScreen() : AuthScreen(),
    );
  }
}