import 'package:ecommerce/models/cart_provider.dart';
import 'package:ecommerce/widget/product_row_card_with_update_quantity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/widget/bottom_navigation_bar.dart';
import 'package:ecommerce/widget/main_screen_app_bar.dart';
import 'package:ecommerce/widget/pink_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  int _currentIndex = 2;

  // Handle BottomNavBar tap
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context); // Access CartProvider

    // Calculate subtotal
    double subtotal = 0.0;
    for (var cartItem in cartProvider.cartItems) {
      subtotal += cartItem.product.price * cartItem.quantity;
    }

    return Scaffold(
      appBar: const CustomAppBar(), // Use your custom app bar
      body: cartProvider.cartItems.isEmpty
          ? const Center(child: Text('Your cart is empty!'))
          : Column(
              children: [
                // Cart Items List
                Expanded(
                  child: ListView.builder(
                    itemCount: cartProvider.cartItems.length,
                    itemBuilder: (context, index) {
                      final cartItem = cartProvider.cartItems[index];
                      return CartItemWidget(
                        cartItem: cartItem,
                        onRemove: () {
                          // Remove item from cart
                          cartProvider.removeFromCart(cartItem.product);
                        },
                        onEditQuantity: (newQuantity) {
                          // Update quantity of cart item
                          cartProvider.editQuantity(cartItem.product, newQuantity);
                        },
                      );
                    },
                  ),
                ),
                // Subtotal
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Subtotal',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${subtotal.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF98CA0),
                        ),
                      ),
                    ],
                  ),
                ),
                // "Buy Now" Button
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: PinkButton(
                    text: 'Buy Now',
                    onPressed: () {
                      Navigator.pushNamed(context, '/customization'); // Navigate to customization screen
                    },
                  ),
                ),
              ],
            ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex, // Pass the current index to BottomNavBar
        onItemTapped: _onItemTapped, // Handle item taps
      ),
    );
  }
}
