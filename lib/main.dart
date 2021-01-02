import 'package:firebase_auth/firebase_auth.dart';
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
          primarySwatch: Colors.amber,
          backgroundColor: Colors.amberAccent,
          accentColor: Colors.lightBlueAccent,
          accentColorBrightness: Brightness.light,
          buttonTheme: ButtonTheme.of(context).copyWith(
              buttonColor: Colors.black87, textTheme: ButtonTextTheme.primary)),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, authSnapshot) {
          if (authSnapshot.hasData) {
            return ChatScreen();
          }

          return AuthScreen();
        },
      ),
    );
  }
}
