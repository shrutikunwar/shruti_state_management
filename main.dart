import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_shruti/providers/cart.dart';
import 'package:state_shruti/providers/orders.dart';
import 'package:state_shruti/providers/products_provider.dart';
import 'package:state_shruti/screens/cart_screen.dart';
import 'package:state_shruti/screens/order_screen.dart';
import 'package:state_shruti/screens/products_overview_screen.dart';
import 'package:state_shruti/widgets/product_detail.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Using MultiProvider to manage multiple ChangeNotifierProviders
    return MultiProvider(
      providers: [
        // Providing the ProductsProvider for managing products state
        ChangeNotifierProvider(
          create: (ctx) => ProductsProvider(),
        ),
        // Providing the Cart provider for managing cart state
        ChangeNotifierProvider(
          create: (ctx) => Cart(),
        ),
        // Providing the Order provider for managing orders state
        ChangeNotifierProvider(
          create: (ctx) => Order(),
        ),
      ],
      // Building the main MaterialApp widget
      child: MaterialApp(
        // Setting the title of the application
        title: 'MyShop',
        // Defining the theme of the application
        theme: ThemeData(
          primarySwatch: Colors.green,
          // Defining the color scheme with a primary and secondary color
          colorScheme:
              ColorScheme.fromSwatch().copyWith(secondary: Colors.deepOrange),
        ),
        // Setting the home screen to ProductsOverviewScreen
        home: ProductsOverviewScreen(),
        // Disabling the debug banner
        debugShowCheckedModeBanner: false,
        // Defining routes for navigation within the app
        routes: {
          // Route for the product detail screen
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          // Route for the cart screen
          CartScreen.routeName: (ctx) => CartScreen(),
          // Route for the order screen
          OrderScreen.routeName: (ctx) => OrderScreen(),
        },
      ),
    );
  }
}





