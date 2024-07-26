import 'package:flutter/foundation.dart';
import 'package:state_shruti/providers/cart.dart';

// Defining an OrderItem class to represent an individual order
class OrderItem {
  // Declaring properties of an order item
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime dateTime;

  // Constructor for initializing order item properties
  OrderItem({
    required this.id,
    required this.amount,
    required this.products,
    required this.dateTime,
  });
}

// Defining an Order class that includes ChangeNotifier for state management
class Order with ChangeNotifier {
  // A private list to hold orders
  List<OrderItem> _orders = [];

  // A getter to access the list of orders
  List<OrderItem> get orders {
    return [..._orders];
  }

  // Method to add a new order
  void addOrder(List<CartItem> cartProducts, double total) {
    // Inserting a new order at the beginning of the list
    _orders.insert(
      0,
      OrderItem(
        id: DateTime.now().toString(),
        amount: total,
        products: cartProducts,
        dateTime: DateTime.now(),
      ),
    );
    // Notify listeners to rebuild the UI
    notifyListeners();
  }
}