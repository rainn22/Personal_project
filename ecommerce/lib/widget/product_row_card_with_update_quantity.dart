import 'package:ecommerce/models/cart_provider.dart';
import 'package:flutter/material.dart';

enum CardMode {
  cartScreen,
  orderScreen,
}

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback? onRemove;
  final ValueChanged<int>? onEditQuantity;
  final CardMode mode;

  const CartItemWidget({
    Key? key,
    required this.cartItem,
    this.onRemove,
    this.onEditQuantity,
    required this.mode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = cartItem.product;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(0),
            child: Image.asset(
              product.images[0],
              fit: BoxFit.cover,
              width: 150,
              height: 150,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
// Product Name
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                    ),
                  ),
                  const SizedBox(height: 6),
// Product Price
                  Text(
                    '\$${(product.price * cartItem.quantity).toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Color(0xFFF98CA0),
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 6),

// Quantity and Price
                  if (mode == CardMode.cartScreen)
                    _buildQuantityControls(context)
                  else
                    Text(
                      '${cartItem.quantity}',
                      style: const TextStyle(fontSize: 18),
                    ),
                ],
              ),
            ),
          ),

          // Remove Button (only for CartScreen)
          if (mode == CardMode.cartScreen)
            IconButton(
              icon: const Icon(Icons.remove,),
              onPressed: () => _showRemoveDialog(context),
            ),
        ],
      ),
    );
  }

  Widget _buildQuantityControls(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Quantity Control
        Row(
          children: [
            // Decrease Quantity
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
              child: IconButton(
                icon: const Icon(Icons.remove, size: 16),
                onPressed: () {
                  // Decrease quantity if greater than 1
                  if (cartItem.quantity > 1) {
                    onEditQuantity?.call(cartItem.quantity - 1);
                  } else {
                    _showRemoveDialog(context);
                  }
                },
              ),
            ),
            const SizedBox(width: 10),

            // Current Quantity
            Text(
              '${cartItem.quantity}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(width: 10),

            // Increase Quantity
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey),
              ),
              child: IconButton(
                icon: const Icon(Icons.add, size: 16),
                onPressed: () {
                  // Increase quantity
                  onEditQuantity?.call(cartItem.quantity + 1);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _showRemoveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Remove Item?'),
          content: const Text('Do you want to remove this item from your cart?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                onRemove?.call();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
