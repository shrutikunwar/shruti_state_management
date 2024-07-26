import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_shruti/providers/cart.dart';

class CartItemScreen extends StatelessWidget {
  // Declaring final fields for the properties of the cart item.
  final String id; // ID of the cart item.
  final double price; // Price of the cart item.
  final int quantity; // Quantity of the cart item.
  final String title; // Title of the cart item.
  final String productId; // ID of the product.

  // Constructor for initializing the fields. The super.key is used to pass the key to the parent class.
  CartItemScreen(
      {super.key,
      required this.id,
      required this.price,
      required this.quantity,
      required this.title, 
      required this.productId});

  // Building the widget tree.
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      // Setting a unique key for the Dismissible widget using the cart item ID.
      key: ValueKey(id),
      // Creating a background widget that appears when the item is swiped.
      background: Container(
        // Setting the background color to red.
        color: Colors.red,
        // Adding a delete icon to the background.
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        // Aligning the delete icon to the right side of the container.
        alignment: Alignment.centerRight,
        // Adding padding to the right side of the container.
        padding: EdgeInsets.only(right: 20),
        // Adding horizontal and vertical margins to the container.
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
      ),
      // Setting the direction in which the item can be dismissed (swiped).
      direction: DismissDirection.endToStart,
      // Defining the action to be taken when the item is dismissed.
      onDismissed: (direction){
        // Removing the item from the cart using the removeItem method from the Cart provider.
        Provider.of<Cart>(context,listen: false).removeItem(productId);
      },
      // Creating a card widget to display the cart item.
      child: Card(
        // Adding horizontal and vertical margins to the card.
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        // Adding padding inside the card.
        child: Padding(
          padding: const EdgeInsets.all(8),
          // Creating a ListTile to display the details of the cart item.
          child: ListTile(
            // Adding a leading CircleAvatar to display the price.
            leading: CircleAvatar(
              // Adding padding inside the CircleAvatar.
              child: Padding(
                  padding: EdgeInsets.all(5),
                  // Using a FittedBox to fit the price text inside the CircleAvatar.
                  child: FittedBox(child: Text('\$$price'))),
            ),
            // Setting the title of the ListTile to the cart item title.
            title: Text(title),
            // Setting the subtitle of the ListTile to display the total price.
            subtitle: Text('Total: \$${price * quantity}'),
            // Adding a trailing widget to display the quantity.
            trailing: Text('$quantity x'),
          ),
        ),
      ),
    );
  }
}
