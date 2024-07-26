import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_shruti/providers/cart.dart';
import 'package:state_shruti/providers/orders.dart';

import 'package:state_shruti/widgets/cart_item.dart';

// Defining a CartScreen widget which is stateless
class CartScreen extends StatelessWidget {
  // Defining a static route name for navigation
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    // Accessing the cart provider to get cart data
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        // Setting the title of the app bar
        title: Text("Your Cart"),
      ),
      body: Column(
        children: [
          // Displaying a card with the total amount and order button
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Displaying the total label
                  Text(
                    "Total",
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(), // Adding space between total and chip
                  // Displaying the total amount in a chip
                  Chip(
                    label: Text('\$${cart.totalAmount.toStringAsFixed(2)}'),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  // Displaying the order now button
                  TextButton(
                    onPressed: () {
                      // Adding the current cart items to orders and clearing the cart
                      Provider.of<Order>(context, listen: false).addOrder(
                        cart.items.values.toList(),
                        cart.totalAmount,
                      );
                      cart.clear();
                    },
                    child: Text('Order Now'),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          // Displaying the list of cart items
          Expanded(
            child: ListView.builder(
              itemCount: cart.itemCount, // Number of items in the cart
              itemBuilder: (ctx, i) => CartItemScreen(
                // Creating a CartItemScreen widget for each item in the cart
                id: cart.items.values.toList()[i].id,
                price: cart.items.values.toList()[i].price,
                quantity: cart.items.values.toList()[i].quantity,
                title: cart.items.values.toList()[i].title,
                productId: cart.items.keys.toList()[i],
              ),
            ),
          ),
        ],
      ),
    );
  }
}







