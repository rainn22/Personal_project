class Order {
  final double subtotal;
  final double deliveryFee;
  final double wrapFee;

  Order({
    required this.subtotal,
    required this.deliveryFee,
    required this.wrapFee,
  });

  double get total => subtotal + deliveryFee + wrapFee;
}
