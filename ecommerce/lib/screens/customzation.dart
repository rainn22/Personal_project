import 'package:ecommerce/widget/main_screen_app_bar.dart';
import 'package:flutter/material.dart';

class CustomzationScreen extends StatefulWidget {
  const CustomzationScreen({super.key});

  @override
  State<CustomzationScreen> createState() => _CustomzationScreenState();
}

class _CustomzationScreenState extends State<CustomzationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(appBarType: AppBarType.other),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                //save all the option and it price 
                Navigator.pushNamed(context, '/order');
              },
              label: const Text('CONTINUE', style: TextStyle(color: Colors.black)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
