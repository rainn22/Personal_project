import 'package:flutter/material.dart';

class CustomizationProvider with ChangeNotifier {
  WrapGiftChoices _wrapGiftChoice = WrapGiftChoices.paperbag;
  GiftCard _giftCardChoice = GiftCard.simple;
  String _userMessage = "";

  WrapGiftChoices get wrapGiftChoice => _wrapGiftChoice;
  GiftCard get giftCardChoice => _giftCardChoice;
  String get userMessage => _userMessage;

  double get wrapFee => _wrapGiftChoice.price;

  void selectWrapGiftChoice(WrapGiftChoices choice) {
    _wrapGiftChoice = choice;
    notifyListeners();
  }

  void selectGiftCardChoice(GiftCard card) {
    _giftCardChoice = card;
    notifyListeners();
  }

  void updateUserMessage(String message) {
    _userMessage = message;
    notifyListeners();
  }

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
