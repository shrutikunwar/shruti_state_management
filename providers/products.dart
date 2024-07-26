import 'package:flutter/foundation.dart';

// Defining a Product class that includes ChangeNotifier for state management
class Product with ChangeNotifier {
  // Declaring properties of a product
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavourite;

  // Constructor for initializing product properties
  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
    this.isFavourite = false, // Default value for isFavourite is false
  });

  // Method to toggle the favourite status of a product
  void toggleFavouriteStatus() {
    isFavourite = !isFavourite; // Inverting the current favourite status
    notifyListeners(); // Notify listeners to rebuild the UI
  }
}





