import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_shruti/providers/cart.dart';
import 'package:state_shruti/providers/products.dart';
import 'package:state_shruti/widgets/product_detail.dart';

// Defining a stateless widget for displaying a product item.
class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Using the Provider to access the product data.
    final productItem = Provider.of<Product>(context);
    // Using the Provider to access the cart data.
    final cart = Provider.of<Cart>(context);
    // Returning a ClipRRect widget to apply rounded corners to the grid tile.
    return ClipRRect(
      // Setting the border radius for the rounded corners.
      borderRadius: BorderRadius.circular(10),
      // Creating a GridTile to display the product item.
      child: GridTile(
        // Defining the footer for the grid tile.
        footer: GridTileBar(
          // Setting the background color of the footer.
          backgroundColor: Colors.black54,
          // Adding a leading icon button to toggle the favorite status of the product.
          leading: IconButton(
            // Setting the icon based on the favorite status of the product.
            icon: Icon(productItem.isFavourite
                ? Icons.favorite
                : Icons.favorite_border),
            // Setting the color of the icon.
            color: Colors.orange,
            // Defining the action to be taken when the icon button is pressed.
            onPressed: () {
              productItem.toggleFavouriteStatus();
            },
          ),
          // Adding a trailing icon button to add the product to the cart.
          trailing: IconButton(
            // Setting the shopping cart icon.
            icon: Icon(Icons.shopping_cart),
            // Setting the color of the icon.
            color: Colors.orange,
            // Defining the action to be taken when the icon button is pressed.
            onPressed: () {
              cart.addItem(
                  productItem.id, productItem.price, productItem.title);
            },
          ),
          // Setting the title of the footer to the product title.
          title: Text(
            productItem.title,
            textAlign: TextAlign.center,
          ),
        ),
        // Defining the child widget of the grid tile.
        child: GestureDetector(
          // Defining the action to be taken when the product image is tapped.
          onTap: () {
            // Navigating to the product detail screen and passing the product ID as an argument.
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productItem.id,
            );
          },
          // Displaying the product image from a URL and fitting it to cover the grid tile.
          child: Image.network(
            productItem.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
