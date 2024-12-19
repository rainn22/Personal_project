import 'package:ecommerce/models/product_categories.dart';
import 'package:ecommerce/models/recipient.dart';

class ProductDetail {
  final String id;
  final String name;
  final double price;
  final List<String> images;
  final ProductCategories category;
  final List<Recipient> tags;
  final int stock;
  final bool isCustomizable;
  final String description; 
  ProductDetail({
    required this.id, 
    required this.name, 
    required this.price, 
    required this.images, 
    required this.category, 
    required this.tags,
    required this.stock, 
    this.isCustomizable = true,
    required this.description, 
  });
}
