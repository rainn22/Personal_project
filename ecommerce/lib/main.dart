import 'package:ecommerce/data/users.dart';
import 'package:ecommerce/models/cart_provider.dart';
import 'package:ecommerce/models/customization_model.dart';
import 'package:ecommerce/models/event_provider.dart';
import 'package:ecommerce/models/shipping_method.dart';
import 'package:ecommerce/models/user.dart';
import 'package:ecommerce/screens/customization.dart';
import 'package:ecommerce/screens/menu.dart';
import 'package:ecommerce/screens/order.dart';
import 'package:ecommerce/screens/search.dart';
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
        ChangeNotifierProvider(create: (_) => UserProvider(users: users)),
        ChangeNotifierProvider(create: (_) => EventProvider()),
      ],
      child: const MyApp(),
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
      initialRoute: '/login', 
      routes: {
        '/login': (context) => LoginScreen(), //login
        '/home': (context) => const HomeScreen(), //main
        '/category': (context) => const CategoryScreen(), //main
        '/cart': (context) => const CartScreen(), //main or other base on screen before it
        '/profile': (context) => const ProfileScreen(), //main
        '/menu': (context) => const MenuScreen(), //logout
        '/customization': (context) => const CustomzationScreen(), 
        '/order' : (context) => const OrderScreen(),  
        '/search' : (context) => const SearchPage(),  
      },
    );
  }
}
