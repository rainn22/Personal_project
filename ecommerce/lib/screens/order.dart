import 'package:ecommerce/models/customization_provider.dart';
import 'package:ecommerce/models/shipping_method.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/models/cart_provider.dart';
import 'package:ecommerce/widget/product_row_card_with_update_quantity.dart';
import 'package:ecommerce/widget/main_screen_app_bar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context); 
    final shippingMethodProvider = Provider.of<ShippingMethodProvider>(context);
    final customizationProvider = Provider.of<CustomizationProvider>(context);


    // Calculate subtotal
    double subtotal = 0.0;
    for (var cartItem in cartProvider.cartItems) {
      subtotal += cartItem.product.price * cartItem.quantity;
    }

    // Calculate delivery fee based on selected shipping method
    double deliveryFee = shippingMethodProvider.deliveryFee; 

    // Calculate wrap gift fee based on selected customization
    double wrapFee = customizationProvider.wrapFee;

    // Calculate total
    double total = subtotal + deliveryFee;

    return Scaffold(
      appBar: const CustomAppBar(appBarType: AppBarType.other),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'SHIPPING METHOD',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              title: Text(ShippingMethod.pickup.label),
              subtitle: const Text('FREE'),
              leading: Radio<ShippingMethod>(
                value: ShippingMethod.pickup,
                groupValue: shippingMethodProvider.selectedShippingMethod,
                onChanged: (ShippingMethod? value) {
                  if (value != null) {
                    shippingMethodProvider.selectShippingMethod(value);
                  }
                },
              ),
            ),
            ListTile(
              title: Text(ShippingMethod.delivery.label),
              subtitle: Text('\$${ShippingMethod.delivery.deliveryFee.toStringAsFixed(2)}'),
              leading: Radio<ShippingMethod>(
                value: ShippingMethod.delivery,
                groupValue: shippingMethodProvider.selectedShippingMethod,
                onChanged: (ShippingMethod? value) {
                  if (value != null) {
                    shippingMethodProvider.selectShippingMethod(value);
                  }
                },
              ),
            ),
            // Payment Method Section
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'PAYMENT METHOD',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              title: const Text('Cash on Delivery'),
              leading: Radio<ShippingMethod>(
                value: ShippingMethod.delivery, // Bind to the delivery method
                groupValue: shippingMethodProvider.selectedShippingMethod,
                onChanged: (ShippingMethod? value) {
                  if (value != null) {
                    shippingMethodProvider.selectShippingMethod(value);
                  }
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'ORDER SUMMARY',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: cartProvider.cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartProvider.cartItems[index];
                  return CartItemWidget(
                    cartItem: cartItem,
                    mode: CardMode.orderScreen,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'SUB TOTAL',
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'DELIVERY FEE',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${deliveryFee.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF98CA0),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'WRAP GIFT',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '\$${wrapFee.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF98CA0),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'TOTAL',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Text(
                        '\$${total.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFF98CA0),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/receipt');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            child: const Text('PLACE ORDER', style: TextStyle(color: Colors.black)),
          ),
        ),
      ),
    );
  }
}
