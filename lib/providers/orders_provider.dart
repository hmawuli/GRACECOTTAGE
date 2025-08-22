import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/cart_item.dart';

class OrdersProvider with ChangeNotifier {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> placeOrder(Map<String, CartItem> cartItems, double total) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final orderData = {
      "userId": user.uid,
      "date": Timestamp.now(),
      "total": total,
      "status": "pending",
      "items": cartItems.values.map((item) => {
        "name": item.name,
        "quantity": item.quantity,
        "price": item.price,
      }).toList(),
    };

    await _db.collection("orders").add(orderData);
  }

  Stream<QuerySnapshot> getUserOrders() {
    final user = FirebaseAuth.instance.currentUser;
    return _db
        .collection("orders")
        .where("userId", isEqualTo: user?.uid)
        .orderBy("date", descending: true)
        .snapshots();
  }
}
