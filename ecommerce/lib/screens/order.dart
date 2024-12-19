import 'package:ecommerce/models/cart_provider.dart';
import 'package:ecommerce/models/customization.dart';
import 'package:ecommerce/models/shipping_method.dart';
import 'package:ecommerce/widget/main_screen_app_bar.dart';
import 'package:ecommerce/widget/order_summary.dart';
import 'package:ecommerce/widget/product_row_card_with_update_quantity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context); 
    final shippingMethodProvider = Provider.of<ShippingMethodProvider>(context);
    final customizationProvider = Provider.of<CustomizationProvider>(context);

    double subtotalFromCart = cartProvider.subtotal;
    double deliveryFeeFromShipping = shippingMethodProvider.deliveryFee;
    double wrapFeeFromCustomize = customizationProvider.wrapFee;
    double totalCalculation = subtotalFromCart + deliveryFeeFromShipping + wrapFeeFromCustomize;

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
            OrderSummary(
              subtotal: subtotalFromCart,
              deliveryFee: deliveryFeeFromShipping,
              wrapFee: wrapFeeFromCustomize,
              total: totalCalculation,
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
