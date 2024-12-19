import 'package:ecommerce/models/product_detail.dart';

class CartItem {
  final ProductDetail product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}
