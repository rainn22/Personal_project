import 'package:flutter/material.dart';
import 'package:ecommerce/widget/bottom_navigation_bar.dart';
import 'package:ecommerce/widget/main_screen_app_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _currentIndex = 3;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index; 
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarType: AppBarType.mainScreen),
      body: const Center(
        child: Text('Profile Screen'), 
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex, // Pass the current index to BottomNavBar
        onItemTapped: _onItemTapped, // Handle item taps
      ),
    );
  }
}
