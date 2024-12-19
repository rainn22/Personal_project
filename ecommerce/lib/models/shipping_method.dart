import 'package:flutter/material.dart';

class ShippingMethodProvider with ChangeNotifier {

  ShippingMethod _selectedShippingMethod = ShippingMethod.pickup;

  ShippingMethod get selectedShippingMethod => _selectedShippingMethod;

  double get deliveryFee => _selectedShippingMethod.deliveryFee;

  void selectShippingMethod(ShippingMethod method) {
    _selectedShippingMethod = method;
    notifyListeners();
  }
}

enum ShippingMethod {
  pickup('Pick up at store', 0.00, 'No'),
  delivery('Delivery', 2.00, 'Cash on Delivery');

  final String label;
  final double deliveryFee;
  final String paymentMethod;

  const ShippingMethod(this.label, this.deliveryFee, this.paymentMethod);
}
