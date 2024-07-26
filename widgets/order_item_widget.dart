import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:state_shruti/providers/orders.dart';

// Defining a stateful widget for displaying an order item.
class OrderItemWidget extends StatefulWidget {
  // Declaring a final field for the order item.
  final OrderItem orderItem;

  // Constructor for initializing the order item. The required keyword ensures that the order item is provided.
  const OrderItemWidget({required this.orderItem});

  // Creating the state for the OrderItemWidget.
  @override
  State<OrderItemWidget> createState() => _OrderItemWidgetState();
}

// Defining the state class for OrderItemWidget.
class _OrderItemWidgetState extends State<OrderItemWidget> {
  // Declaring a variable to track the expanded state of the order item.
  var _expanded = false;

  // Building the widget tree.
  @override
  Widget build(BuildContext context) {
    return Card(
      // Adding margin to the card.
      margin: EdgeInsets.all(10),
      // Creating a column to hold the order item details.
      child: Column(
        children: [
          // Creating a ListTile to display the order amount and date.
          ListTile(
            // Setting the title of the ListTile to the order amount.
            title: Text("\$${widget.orderItem.amount}"),
            // Setting the subtitle of the ListTile to the formatted order date.
            subtitle: Text(DateFormat('dd/MM/yyyy hh:mm')
                .format(widget.orderItem.dateTime)),
            // Adding a trailing icon button to expand or collapse the order item details.
            trailing: IconButton(
              // Setting the icon based on the expanded state.
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              // Defining the action to be taken when the icon button is pressed.
              onPressed: () {
                // Toggling the expanded state.
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          // Conditionally displaying the order item details if the expanded state is true.
          if (_expanded)
            // Creating a container to hold the order item products.
            Container(
              // Adding padding to the container.
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              // Setting the height of the container based on the number of products.
              height: min(widget.orderItem.products.length * 20.0 + 10, 180),
              // Creating a ListView to display the list of products.
              child: ListView(
                // Mapping the products to rows displaying the product title and quantity.
                children: widget.orderItem.products
                    .map((prod) => Row(
                          // Aligning the row contents to have space around them.
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Displaying the product title with a specific text style.
                            Text(
                              prod.title,
                              style: TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                            // Displaying the product quantity and price with a different text style.
                            Text(
                              '${prod.quantity}x \$${prod.price}',
                              style:
                                  TextStyle(fontSize: 18, color: Colors.grey),
                            ),
                          ],
                        ))
                    // Converting the mapped products to a list.
                    .toList(),
              ),
            ),
        ],
      ),
    );
  }
}





