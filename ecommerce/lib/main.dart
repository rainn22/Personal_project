import 'package:ecommerce/models/cart_provider.dart';
import 'package:ecommerce/screens/customzation.dart';
import 'package:ecommerce/screens/menu.dart';
import 'package:ecommerce/screens/order.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/cart.dart';
import 'screens/homepage.dart';
import 'screens/profile.dart';
import 'screens/types.dart';
import 'screens/login.dart'; 

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CartProvider(),
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
        '/cart': (context) => const CartScreen(), //main and other
        '/profile': (context) => const ProfileScreen(), //main
        '/menu': (context) => const MenuScreen(), //logout
        '/customization': (context) => const CustomzationScreen(), //other, continue, 2 choices to order
        '/order' : (context) => const OrderScreen(), //customer address invole with login, new method (pick up and payment), order summary()
      },
    );
  }
}
