import 'package:ecommerce/models/product_detail.dart';
import 'package:flutter/material.dart';

class CartProvider with ChangeNotifier {
  final List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  double get subtotal {
    double total = 0.0;
    for (var cartItem in _cartItems) {
      total += cartItem.product.price * cartItem.quantity;
    }
    return total;
  }

  void addToCart(CartItem item) {
    final existingItemIndex = _cartItems.indexWhere((cartItem) => cartItem.product.id == item.product.id);
    if (existingItemIndex >= 0) {
      _cartItems[existingItemIndex].quantity += item.quantity;
    } else {
      _cartItems.add(item);
    }
    notifyListeners(); 
  }

  void removeFromCart(ProductDetail product) {
    _cartItems.removeWhere((cartItem) => cartItem.product.id == product.id);
    notifyListeners(); 
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners(); 
  }


  void editQuantity(ProductDetail product, int newQuantity) {
    final index = _cartItems.indexWhere((cartItem) => cartItem.product.id == product.id);
    if (index >= 0 && newQuantity > 0) {
      _cartItems[index].quantity = newQuantity;
      notifyListeners(); 
    }
  }
}

class CartItem {
  final ProductDetail product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}
