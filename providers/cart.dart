import 'package:flutter/foundation.dart';

// Defining a CartItem class that includes ChangeNotifier
class CartItem with ChangeNotifier {
  // Declaring properties of a cart item
  final String id;
  final String title;
  final int quantity;
  final double price;

  // Constructor for initializing cart item properties
  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
  });
}

// Defining a Cart class that includes ChangeNotifier for state management
class Cart with ChangeNotifier {
  // A private map to hold cart items
  Map<String, CartItem> _items = {};

  // A getter to access the cart items
  Map<String, CartItem> get items {
    return {..._items};
  }

  // A getter to count the number of items in the cart
  int get itemCount {
    return _items.length;
  }

  // A getter to calculate the total amount of the cart
  double get totalAmount {
    double total = 0.0;
    // Iterating through cart items to sum up the total price
    _items.forEach((key, value) {
      total += value.price * value.quantity;
    });
    return total;
  }

  // Method to add an item to the cart
  void addItem(String productId, double price, String title) {
    // Checking if the item already exists in the cart
    if (_items.containsKey(productId)) {
      // If it exists, update the quantity
      _items.update(
        productId,
        (value) => CartItem(
          id: value.id,
          title: value.title,
          quantity: value.quantity + 1,
          price: value.price,
        ),
      );
    } else {
      // If it doesn't exist, add a new item
      _items.putIfAbsent(
        productId,
        () => CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1,
        ),
      );
      // Notify listeners to rebuild the UI
      notifyListeners();
    }
  }

  // Method to remove an item from the cart
  void removeItem(String productId) {
    _items.remove(productId);
    // Notify listeners to rebuild the UI
    notifyListeners();
  }

  // Method to clear all items from the cart
  void clear() {
    _items = {};
    // Notify listeners to rebuild the UI
    notifyListeners();
  }
}