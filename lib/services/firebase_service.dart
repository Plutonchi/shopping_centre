import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  CollectionReference users = FirebaseFirestore.instance.collection('user');
}
