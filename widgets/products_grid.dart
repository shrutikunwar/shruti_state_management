import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_shruti/providers/products_provider.dart';
import 'package:state_shruti/widgets/product_item.dart';

// Defining a stateless widget for displaying a grid of products.
class ProductsGrid extends StatelessWidget {
  // Declaring a final field to determine whether to show only favourite products.
  final bool showFavourites;

  // Constructor for initializing the showFavourites field.
  ProductsGrid(this.showFavourites);

  @override
  Widget build(BuildContext context) {
    // Using the Provider to access the products data.
    final productsData = Provider.of<ProductsProvider>(context);
    // Determining which products to display based on the showFavourites flag.
    final products = showFavourites ? productsData.favouriteItems : productsData.items;
    
    // Returning a GridView.builder to create a scrollable grid of products.
    return GridView.builder(
      // Setting the number of items in the grid.
      itemCount: products.length,
      // Adding padding around the grid.
      padding: EdgeInsets.all(10.0),
      // Defining the item builder to create each product item in the grid.
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        // Providing the product data to the ProductItem widget.
        value: products[i],
        // Creating the ProductItem widget.
        child: ProductItem(),
      ),
      // Defining the grid layout using a SliverGridDelegateWithFixedCrossAxisCount.
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        // Setting the number of columns in the grid.
        crossAxisCount: 2,
        // Setting the aspect ratio of the grid items.
        childAspectRatio: 3 / 2,
        // Setting the horizontal spacing between grid items.
        crossAxisSpacing: 10,
        // Setting the vertical spacing between grid items.
        mainAxisSpacing: 10,
      ),
    );
  }
}
