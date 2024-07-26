import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_shruti/providers/products_provider.dart';

// Defining a stateless widget for displaying product details.
class ProductDetailScreen extends StatelessWidget {
  // Constructor for the ProductDetailScreen. The super.key is used to pass the key to the parent class.
  const ProductDetailScreen({super.key});

  // Defining a static constant route name for navigation to this screen.
  static const routeName = '/product-detail';

  // Building the widget tree.
  @override
  Widget build(BuildContext context) {
    // Retrieving the product ID passed as an argument to the route.
    final productId = ModalRoute.of(context)?.settings.arguments as String;
    // Printing the product ID to the console for debugging purposes.
    print(productId);
    // Using the Provider to find the product by its ID from the ProductsProvider.
    final loadedProduct =
        Provider.of<ProductsProvider>(context).findProductById(productId);
    // Printing the loaded product to the console for debugging purposes.
    print(loadedProduct);
    // Returning a Scaffold widget to provide the structure for the screen.
    return Scaffold(
      // Setting the app bar with the title of the loaded product.
      appBar: AppBar(
        title: Text(loadedProduct.title),
      ),
      // Creating a scrollable body to display the product details.
      body: SingleChildScrollView(
        // Creating a column to hold the product details.
        child: Column(
          children: <Widget>[
            // Creating a container to hold the product image.
            Container(
              height: 300,
              width: double.infinity,
              // Displaying the product image from a URL and fitting it to cover the container.
              child: Image.network(
                loadedProduct.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            // Adding a vertical space between the image and the price.
            SizedBox(
              height: 10,
            ),
            // Displaying the product price with a specific text style.
            Text(
              '${loadedProduct.price}',
              style: TextStyle(color: Colors.grey, fontSize: 20),
            ),
            // Adding a vertical space between the price and the description.
            SizedBox(height: 10,),
            // Creating a container to hold the product description.
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 10),
              // Displaying the product description with centered text alignment and wrapping text if needed.
              child: Text(
                loadedProduct.description,
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}







