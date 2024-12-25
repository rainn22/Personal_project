import 'package:ecommerce/data/products.dart';
import 'package:ecommerce/models/product_detail.dart';
import 'package:ecommerce/widget/main_screen_app_bar.dart';
import 'package:ecommerce/widget/product_card.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ProductDetail> _searchResults = [];
  final TextEditingController _searchController = TextEditingController();

  void _searchProducts(String query) {
    if (query.isEmpty) {
      setState(() {
        _searchResults = [];
      });
    } else {
      setState(() {
        _searchResults = productDetails
            .where((product) =>
              product.name.toLowerCase().contains(query.toLowerCase())
            )
            .toList();
      });
    }
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarType: AppBarType.other),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                            _searchResults = [];
                          });
                        },
                      )
                    : null,
              ),
              onChanged: _searchProducts,
            ),
            const SizedBox(height: 20),
            // Search Results
            Expanded(
              child: _searchResults.isEmpty
                  ? Center(
                      child: _searchController.text.isEmpty
                          ? const Text('Start typing to search products...')
                          : const Text('No products found.'),
                    )
                  : GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        mainAxisExtent: 380,
                      ),
                      itemCount: _searchResults.length,
                      itemBuilder: (context, index) {
                        final product = _searchResults[index];
                        return ProductCard(product: product);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
