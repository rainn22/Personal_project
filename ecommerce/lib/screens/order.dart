import 'package:ecommerce/models/cart_provider.dart';
import 'package:ecommerce/models/customization_model.dart';
import 'package:ecommerce/models/order_total_model.dart';
import 'package:ecommerce/models/shipping_method.dart';
import 'package:ecommerce/widget/main_screen_app_bar.dart';
import 'package:ecommerce/widget/order_success_modal.dart';
import 'package:ecommerce/widget/order_total.dart';
import 'package:ecommerce/widget/product_row_card_with_update_quantity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  void showOrderSuccessModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing the modal by tapping outside
      builder: (BuildContext context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          child: OrderSuccessModal(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final shippingMethodProvider = Provider.of<ShippingMethodProvider>(context);
    final customizationProvider = Provider.of<CustomizationProvider>(context);
    final orderTotalModel = Order(
      subtotal: cartProvider.subtotal,
      deliveryFee: shippingMethodProvider.deliveryFee,
      wrapFee: customizationProvider.wrapFee,
    );

    return Scaffold(
      appBar: const CustomAppBar(appBarType: AppBarType.other),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 90.0), // Space for floating total bar
            child: SingleChildScrollView(
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
                      'YOUR CUSTOMIZE',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Gift Wrap: '),
                    trailing: Text(customizationProvider.wrapGiftChoice.label, 
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),
                  ),
                  ListTile(
                    title: const Text('Gift Card: '),
                    trailing: Text(customizationProvider.giftCardChoice.label,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),
                  ),
                  ListTile(
                    title: const Text('Your Message: '),
                    trailing: Text(customizationProvider.userMessage,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      )),
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
                      shrinkWrap: true,
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
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OrderTotal(orderTotal: orderTotalModel),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    onPressed: () {
                      cartProvider.clearCart();
                      customizationProvider.clearCustomization();
                      showOrderSuccessModal(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    child: const Text('PLACE ORDER', style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
