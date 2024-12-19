import 'package:ecommerce/models/customization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomzationScreen extends StatelessWidget {
  const CustomzationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the customization provider
    final customizationProvider = Provider.of<CustomizationProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Customize Your Gift")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Wrap Gift Section
            const Text(
              "Wrap Gift",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFF98CA0)),
            ),
            for (var choice in WrapGiftChoices.values)
              RadioListTile<WrapGiftChoices>(
                title: Text("${choice.label} - \$${choice.price.toStringAsFixed(2)}"),
                value: choice,
                groupValue: customizationProvider.wrapGiftChoice,
                onChanged: (value) {
                  if (value != null) {
                    customizationProvider.selectWrapGiftChoice(value);
                  }
                },
              ),
            const SizedBox(height: 20),

            // Gift Card Section
            const Text(
              "Gift Card",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFF98CA0)),
            ),
            for (var card in GiftCard.values)
              RadioListTile<GiftCard>(
                title: Text(card.label),
                value: card,
                groupValue: customizationProvider.giftCardChoice,
                onChanged: (value) {
                  if (value != null) {
                    customizationProvider.selectGiftCardChoice(value);
                  }
                },
              ),
            const SizedBox(height: 20),

            // Message Section
            const Text(
              "Your Message",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFFF98CA0)),
            ),
            const SizedBox(height: 10),
            // Message Input
            TextField(
              maxLength: 160,
              decoration: const InputDecoration(
                hintText: "Write your message here",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                customizationProvider.updateUserMessage(value);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          child: ElevatedButton(
            onPressed: () {
              // Navigate to Order Screen
              Navigator.pushNamed(context, '/order');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            child: const Text('CONTINUE', style: TextStyle(color: Colors.black)),
          ),
        ),
      ),
    );
  }
}
