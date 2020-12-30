import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseApiModule {
  @lazySingleton
  Firestore get firestore => Firestore.instance;

  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
}

/*
 * This class will contain all the Firebase API related
 */