import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _products = [];

  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    final snapshot = await FirebaseFirestore.instance.collection('products').orderBy('createdAt', descending: true).get();
    _products.clear();
    for (var doc in snapshot.docs) {
      _products.add(Product.fromFirestore(doc.data(), doc.id));
    }
    notifyListeners();
  }
}
