import 'package:flutter/material.dart';
import 'package:ecommerce/widget/bottom_navigation_bar.dart';
import 'package:ecommerce/widget/main_screen_app_bar.dart';

class ReceiptScreen extends StatefulWidget {
  const ReceiptScreen({Key? key}) : super(key: key);

  @override
  _ReceiptScreenState createState() => _ReceiptScreenState();
}

class _ReceiptScreenState extends State<ReceiptScreen> {
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
        child: Text('Receipt Screen'), 
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex, 
        onItemTapped: _onItemTapped, 
      ),
    );
  }
}
