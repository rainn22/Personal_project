import 'package:ecommerce/data/products.dart';
import 'package:ecommerce/models/product_categories.dart';
import 'package:ecommerce/models/product_detail.dart';
import 'package:ecommerce/widget/product_card.dart';
import 'package:ecommerce/widget/type_button.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widget/bottom_navigation_bar.dart';
import 'package:ecommerce/widget/main_screen_app_bar.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List<ProductDetail> filteredProducts = productDetails;
  int _currentIndex = 1; // Track the current tab
  int _selectedIndex = 0; // Track the selected button on type

  void filterProducts(ProductCategories? productCategory, int index) {
    setState(() {
      _selectedIndex = index; 
      if (productCategory == null) {
        filteredProducts = productDetails; 
      } else {
        filteredProducts = productDetails.where((product) {
          return product.category == productCategory; 
        }).toList();
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarType: AppBarType.mainScreen),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Find the best choice
            const Center(
              child: Text(
                'Find the Best Choice',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // Category filter
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomTypeButton(
                      onPressed: () => filterProducts(null, 0), // Show all products
                      text: 'All',
                      isSelected: _selectedIndex == 0,
                    ),
                    const SizedBox(width: 8),
                    CustomTypeButton(
                      onPressed: () => filterProducts(ProductCategories.artCrafts, 1),
                      text: 'Art & Crafts',
                      isSelected: _selectedIndex == 1,
                    ),
                    const SizedBox(width: 8),
                    CustomTypeButton(
                      onPressed: () => filterProducts(ProductCategories.books, 2),
                      text: 'Books',
                      isSelected: _selectedIndex == 2,
                    ),
                    const SizedBox(width: 8),
                    CustomTypeButton(
                      onPressed: () => filterProducts(ProductCategories.clothes, 3),
                      text: 'Clothing',
                      isSelected: _selectedIndex == 3,
                    ),
                    const SizedBox(width: 8),
                    CustomTypeButton(
                      onPressed: () => filterProducts(ProductCategories.digitalAccessories, 4),
                      text: 'Digital Accessories',
                      isSelected: _selectedIndex == 4,
                    ),
                    const SizedBox(width: 8),
                    CustomTypeButton(
                      onPressed: () => filterProducts(ProductCategories.fitness, 5),
                      text: 'Fitness',
                      isSelected: _selectedIndex == 5,
                    ),
                    const SizedBox(width: 8),
                    CustomTypeButton(
                      onPressed: () => filterProducts(ProductCategories.flowers, 6),
                      text: 'Flowers',
                      isSelected: _selectedIndex == 6,
                    ),
                  ],
                ),
              ),
            ),
            // Grid view for filtered products
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(), 
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, 
                  crossAxisSpacing: 10.0, 
                  mainAxisSpacing: 10.0,
                  mainAxisExtent: 380, 
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return ProductCard(product: product);
                },
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
