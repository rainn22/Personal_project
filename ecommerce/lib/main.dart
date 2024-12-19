import 'package:ecommerce/models/cart_provider.dart';
import 'package:ecommerce/models/customization.dart';
import 'package:ecommerce/models/shipping_method.dart';
import 'package:ecommerce/screens/customization.dart';
import 'package:ecommerce/screens/menu.dart';
import 'package:ecommerce/screens/order.dart';
import 'package:ecommerce/screens/receipt.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/cart.dart';
import 'screens/homepage.dart';
import 'screens/profile.dart';
import 'screens/types.dart';
import 'screens/login.dart'; 

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => ShippingMethodProvider()),
        ChangeNotifierProvider(create: (_) => CustomizationProvider()),
      ],
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      initialRoute: '/home', 
      routes: {
        '/login': (context) => LoginScreen(), //login
        '/home': (context) => HomeScreen(), //main
        '/category': (context) => const CategoryScreen(), //main
        '/cart': (context) => const CartScreen(), //main
        '/profile': (context) => const ProfileScreen(), //main
        '/menu': (context) => const MenuScreen(), //logout
        '/customization': (context) => const CustomzationScreen(), //other, continue, 2 choices to order
        '/order' : (context) => const OrderScreen(), 
        '/receipt' : (context) => const ReceiptScreen(), 
      },
    );
  }
}
