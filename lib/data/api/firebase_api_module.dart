import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

@module
abstract class FirebaseApiModule {
  @lazySingleton
  Firestore get firestore => Firestore.instance;
}

/*
 * This class will contain all the Firebase API related
 */