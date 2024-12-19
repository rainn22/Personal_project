import 'package:ecommerce/models/customization.dart';
import 'package:ecommerce/models/shipping_method.dart';
import 'package:ecommerce/widget/order_summary.dart';
import 'package:ecommerce/widget/product_row_card_with_update_quantity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce/models/cart_provider.dart';
import 'package:ecommerce/widget/main_screen_app_bar.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

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
              title: Text(shippingMethodProvider.selectedShippingMethod.label),
              trailing: Text('\$${shippingMethodProvider.selectedShippingMethod.deliveryFee}'),
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
              title: Text(shippingMethodProvider.selectedShippingMethod.paymentMethod),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'YOUR CUSTOMIZE',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ),
            ListTile(
              title: const Text('Gift Wrap: '),
              trailing: Text(customizationProvider.wrapGiftChoice.label),
            ),
            ListTile(
              title: const Text('Gift Card: '),
              trailing: Text(customizationProvider.giftCardChoice.label),
            ),
            ListTile(
              title: const Text('Your Message: '),
              trailing: Text(customizationProvider.userMessage),
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
              Navigator.pushNamed(context, '/home');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            child: const Text('BACK TO HOME', style: TextStyle(color: Colors.black)),
          ),
        ),
      ),
    );
  }
}
