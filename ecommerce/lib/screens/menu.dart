import 'package:ecommerce/models/user.dart';
import 'package:ecommerce/widget/pink_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); 
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menu Items
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
            ),
            const ListTile(
              leading: Icon(Icons.help),
              title: Text('Help Center'),
            ),
            const ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
            ),

            const Spacer(), 

            // Location and social media
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                Text('  No. 13, Sorya Center Point, Phnom Penh'),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.squareFacebook, size: 28),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.instagram, size: 28),
                  onPressed: () {
                  },
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.youtube, size: 28),
                  onPressed: () {
                  },
                ),
              ],
            ),

            // Logout Button
            PinkButton(
              text: 'Logout',
              onPressed: () {
                Provider.of<UserProvider>(context, listen: false).logout();
                Navigator.pushNamed(context, '/login');
              },
            ),
          ],
        ),
      ),
    );
  }
}
