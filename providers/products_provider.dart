import 'package:flutter/material.dart';
import 'package:state_shruti/providers/products.dart';

// Defining a ProductsProvider class that includes ChangeNotifier for state management
class ProductsProvider with ChangeNotifier {
  // A private list to hold product items
  final List<Product> _items = [
    // Adding initial product items to the list
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
  ];

  // A private variable to control the visibility of favourite items
  var _showFavouritesOnly = false;

  // A getter to access the list of product items
  List<Product> get items {
    // If only favourites should be shown, filter the list accordingly
    if (_showFavouritesOnly) {
      return _items.where((productItem) => productItem.isFavourite).toList();
    }
    // Otherwise, return a copy of the entire list
    return [..._items];
  }

  // Method to find a product by its ID
  Product findProductById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // A getter to access the list of favourite product items
  List<Product> get favouriteItems {
    return _items.where((prodItem) => prodItem.isFavourite).toList();
  }

  // Method to show only favourite items
  void showFavouritesOnly() {
    _showFavouritesOnly = true;
    // Notify listeners to rebuild the UI
    notifyListeners();
  }

  // Method to show all items
  void showAll() {
    _showFavouritesOnly = false;
    // Notify listeners to rebuild the UI
    notifyListeners();
  }

  // Method to add a new product (currently not implemented)
  void addProduct() {
    // Notify listeners to rebuild the UI
    notifyListeners();
  }
}







