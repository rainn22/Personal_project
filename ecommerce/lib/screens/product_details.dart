import 'package:ecommerce/models/cart_provider.dart';
import 'package:ecommerce/models/product_detail.dart';
import 'package:ecommerce/widget/main_screen_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final ProductDetail product;

  const ProductDetails({super.key, required this.product});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarType: AppBarType.other),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              widget.product.images[0],
              fit: BoxFit.fill,
              width: double.infinity,
            ),
            const SizedBox(height: 16),
            Text(
              widget.product.name,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '\$${widget.product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Color(0xFFF98CA0),
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(
                  label: Text(widget.product.category.label),
                ),
                const SizedBox(width: 8.0),
                Wrap(
                  spacing: 8.0,
                  children: widget.product.tags.map((tag) {
                    return Chip(
                      label: Text(tag.label),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              'Description',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.product.description,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                height: 1.5,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                final cartItem = CartItem(product: widget.product);
                Provider.of<CartProvider>(context, listen: false).addToCart(cartItem);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('This product has been added to your cart!'),
                    duration: const Duration(seconds: 3), 
                    action: SnackBarAction(
                      label: 'Visit Cart',
                      onPressed: () {
                        Navigator.pushNamed(context, '/cart');
                      },
                    ),
                  ),
                );
              },
              icon: const Icon(Icons.shopping_cart, color: Colors.black),
              label: const Text('ADD TO CART', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
