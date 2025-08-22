import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import '../providers/orders_provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrdersProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text("My Orders")),
      body: StreamBuilder<QuerySnapshot>(
        stream: ordersProvider.getUserOrders(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text("No orders yet."));
          }
          final orders = snapshot.data!.docs;
          return ListView.builder(
            itemCount: orders.length,
            itemBuilder: (ctx, i) {
              final order = orders[i];
              final items = (order['items'] as List<dynamic>?) ?? [];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text("Total: GHS ${order['total']}"),
                  subtitle: Text("Status: ${order['status']}"),
                  trailing: Text("${items.length} items"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
