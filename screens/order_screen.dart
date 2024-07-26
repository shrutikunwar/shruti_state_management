import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_shruti/providers/orders.dart';
import 'package:state_shruti/widgets/app_drawer.dart';
import 'package:state_shruti/widgets/order_item_widget.dart';


// Defining an OrderScreen widget which is stateless
class OrderScreen extends StatelessWidget {
  // Defining a static route name for navigation
  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    // Printing debug information to console
    print("OrderScreen: Building OrderScreen");
    
    // Accessing the order provider to get order data
    final orderData = Provider.of<Order>(context);
    
    // Printing debug information to console
    if (orderData.orders.isNotEmpty) {
      print("OrderScreen: First Order Item: ${orderData.orders[0]}");
    } else {
      print("OrderScreen: No orders found");
    }

    return Scaffold(
      appBar: AppBar(
        // Setting the title of the app bar
        title: Text('Your Orders'),
      ),
      // Adding a drawer to the scaffold
      drawer: AppDrawer(),
      // Building a list view of orders
      body: ListView.builder(
        itemCount: orderData.orders.length, // Number of orders
        itemBuilder: (ctx, i) {
          // Printing debug information to console
          print("OrderScreen: Building OrderItemWidget for Order: ${orderData.orders[i]}");
          // Creating an OrderItemWidget for each order
          return OrderItemWidget(orderItem: orderData.orders[i]);
        },
      ),
    );
  }
}





