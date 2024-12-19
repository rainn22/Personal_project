import 'package:ecommerce/widget/product_card.dart';
import 'package:ecommerce/widget/type_button.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/widget/bottom_navigation_bar.dart';
import 'package:ecommerce/widget/main_screen_app_bar.dart';
import 'package:ecommerce/data/products.dart';
import 'package:ecommerce/models/recipient.dart';
import 'package:ecommerce/models/product_detail.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductDetail> filteredProducts = productDetails;
  int _currentIndex = 0; // Track the current tab 
  int _selectedIndex = 0; // Track the selected button on type

  void filterProducts(Recipient? recipient, int index) {
    setState(() {
      _selectedIndex = index; 
      if (recipient == null) {
        filteredProducts = productDetails; // Show all products
      } else {
        filteredProducts = productDetails.where((product) {
          return product.tags.contains(recipient);
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

//reminder
            Container(
              padding: const EdgeInsets.all(20),
              color: const Color(0xFFF98CA0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Molika\'s Birthday',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.timer_outlined, color: Colors.white,),
                      Text(' 10 days remaining',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
                ]
              ),
            ),

            const SizedBox(height: 20),

//trend product display
            Container(
              width: double.infinity,
              color: const Color(0xFFF98CA0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/handmade_vase2.jpg',
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Trending Item',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Buy for your belove',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),

            const SizedBox(height: 20),

//find the best choice
            const Center(
              child: Text(
                'Find the Best Choice',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

//product filter by recipient
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomTypeButton(
                      onPressed: () => filterProducts(null, 0),
                      text: 'All',
                      isSelected: _selectedIndex == 0,
                    ),
                    const SizedBox(width: 8),
                    CustomTypeButton(
                      onPressed: () => filterProducts(Recipient.forHim, 1),
                      text: 'For Him',
                      isSelected: _selectedIndex == 1,
                    ),
                    const SizedBox(width: 8),
                    CustomTypeButton(
                      onPressed: () => filterProducts(Recipient.forHer, 2),
                      text: 'For Her',
                      isSelected: _selectedIndex == 2,
                    ),
                    const SizedBox(width: 8),
                    CustomTypeButton(
                      onPressed: () => filterProducts(Recipient.forKids, 3),
                      text: 'For Kids',
                      isSelected: _selectedIndex == 3,
                    ),
                    const SizedBox(width: 8),
                    CustomTypeButton(
                      onPressed: () => filterProducts(Recipient.forTeens, 4),
                      text: 'For Teens',
                      isSelected: _selectedIndex == 4,
                    ),
                    const SizedBox(width: 8),
                    CustomTypeButton(
                      onPressed: () => filterProducts(Recipient.forParents, 5),
                      text: 'For Parents',
                      isSelected: _selectedIndex == 5,
                    ),
                    const SizedBox(width: 8),
                    CustomTypeButton(
                      onPressed: () => filterProducts(Recipient.forFriends, 6),
                      text: 'For Friends',
                      isSelected: _selectedIndex == 6,
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(), // Makes the grid scrollable with bounce effect
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Display 2 items per row
                  crossAxisSpacing: 10.0, // Spacing between columns
                  mainAxisSpacing: 10.0, // Spacing between rows
                  mainAxisExtent: 335, // Set fixed height for each card
                ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index) {
                  final product = filteredProducts[index];
                  return ProductCard(product: product);
                },
              ),
            ),

//view more
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey), // Set the border color
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), // Rectangular shape (no rounded corners)
                ),
                onPressed: () {
                  // Handle action for the 'View More' button
                },
                child: const Text(
                  'VIEW MORE',
                  style: TextStyle(
                    color: Colors.black, // Set the text color
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

          ],
        ),
      ),

      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onItemTapped: _onItemTapped,  // Just update the index
      ),
    );
  }
}

