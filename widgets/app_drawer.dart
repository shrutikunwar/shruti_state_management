import 'package:flutter/material.dart';
import 'package:state_shruti/screens/order_screen.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

   @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          // App bar for the drawer
          AppBar(
            title: Text('Hello Friend'),
            automaticallyImplyLeading: false, // Hides the back button
          ),
          Divider(), // Divider to separate items
          // List tile for navigating to the shop
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Shop'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/'); // Navigate to home
            },
          ),
          Divider(), // Divider to separate items
          // List tile for navigating to the orders screen
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Orders'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName); // Navigate to orders
            },
          ),
        ],
      ),
    );
  }
}





