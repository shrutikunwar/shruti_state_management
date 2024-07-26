import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_shruti/providers/cart.dart';
import 'package:state_shruti/screens/cart_screen.dart';
import 'package:state_shruti/widgets/app_drawer.dart';
import 'package:state_shruti/widgets/badge.dart';
import 'package:state_shruti/widgets/products_grid.dart';

// Enum to define filter options for displaying products
enum FilterOptions {
  Favourites,
  All,
}

// Defining a ProductsOverviewScreen widget which is stateful
class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

// Defining the state for ProductsOverviewScreen
class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  // Variable to control the visibility of favourite items
  var _showFavouritesOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Setting the title of the app bar
        title: Text('MyShop'),
        actions: [
          // Adding a popup menu to filter products
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                // Updating the filter based on the selected value
                if (selectedValue == FilterOptions.Favourites) {
                  _showFavouritesOnly = true;
                } else {
                  _showFavouritesOnly = false;
                }
              });
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              // Popup menu items for filtering products
              PopupMenuItem(
                child: Text('Only Favourites'),
                value: FilterOptions.Favourites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          // Using Consumer to rebuild the badge when the cart changes
          Consumer<Cart>(
            builder: (_, cart, child) => BadgeContainer(
              value: cart.itemCount.toString(),
              color: Colors.black,
              child: child!,
            ),
            // Icon button to navigate to the cart screen
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      // Adding a drawer to the scaffold
      drawer: AppDrawer(),
      // Displaying the grid of products
      body: ProductsGrid(_showFavouritesOnly),
    );
  }
}







