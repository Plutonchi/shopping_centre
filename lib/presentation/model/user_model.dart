import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String ID = 'id';
  String NAME = "name";
  String EMAIL = "email";
  // String CART = 'cart';

  //////

  String? id;
  String? name;
  String? email;
  // List<CardItemModel>? cart;
  UserModel({
    this.id,
    this.name,
    this.email,
    // this.cart,
  });

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot.get(NAME);
    email = snapshot.get(EMAIL);
    id = snapshot.get(ID);
    // cart = _convertCartItems(snapshot.data[CART] ?? []);
  }
}
