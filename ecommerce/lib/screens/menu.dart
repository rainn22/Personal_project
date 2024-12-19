import 'package:ecommerce/widget/pink_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Menu Items
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Setting'),
              onTap: () {
                // Handle setting tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Help Center'),
              onTap: () {
                // Handle help center tap
              },
            ),
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About Us'),
              onTap: () {
                // Handle about us tap
              },
            ),

            const Spacer(), // Pushes the bottom widgets down

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
                    // Add action for Instagram button
                  },
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.instagram, size: 28),
                  onPressed: () {
                    // Add action for Instagram button
                  },
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.youtube, size: 28),
                  onPressed: () {
                    // Add action for Instagram button
                  },
                ),
              ],
            ),

            // Logout Button
            PinkButton(
              text: 'Logout',
              onPressed: () {
                Navigator.pushNamed(context, '/login'); // Navigate to login page
              },
            ),
          ],
        ),
      ),
    );
  }
}
