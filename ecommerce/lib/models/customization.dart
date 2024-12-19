import 'package:flutter/material.dart';

class CustomizationProvider with ChangeNotifier {
  // Holds the current customization choices
  WrapGiftChoices _wrapGiftChoice = WrapGiftChoices.paperbag;
  GiftCard _giftCardChoice = GiftCard.simple;
  String _userMessage = "";

  // Getters for wrap gift choice, gift card choice, and message
  WrapGiftChoices get wrapGiftChoice => _wrapGiftChoice;
  GiftCard get giftCardChoice => _giftCardChoice;
  String get userMessage => _userMessage;

  // Getter for wrap fee
  double get wrapFee => _wrapGiftChoice.price;

  // Getter for wrap gift price
  double get totalPrice => wrapFee; // Add any other calculations for the total if needed

  // Method to update the wrap gift choice
  void selectWrapGiftChoice(WrapGiftChoices choice) {
    _wrapGiftChoice = choice;
    notifyListeners();
  }

  // Method to update the gift card choice
  void selectGiftCardChoice(GiftCard card) {
    _giftCardChoice = card;
    notifyListeners();
  }

  // Method to update the user message
  void updateUserMessage(String message) {
    _userMessage = message;
    notifyListeners();
  }

  // Method to clear the customization (optional)
  void clearCustomization() {
    _wrapGiftChoice = WrapGiftChoices.paperbag;
    _giftCardChoice = GiftCard.simple;
    _userMessage = "";
    notifyListeners();
  }
}

enum WrapGiftChoices {
  paperbag('Paper Bag', 0.00),
  giftWrap('Gift Wrap', 1.00),
  giftBox('Gift Box', 5.00);

  final String label;
  final double price;
  const WrapGiftChoices(this.label, this.price);
}

enum GiftCard {
  simple('Default'),
  bd('BirthdayCard'),
  thanks('Thank you Card'),
  valentine('Valentine day Card');

  final String label;
  const GiftCard(this.label);
}
