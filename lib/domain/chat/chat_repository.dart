import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IChatRepository {
  Stream<QuerySnapshot> getText();
  Future<void> sendTextMessage(String message);
}