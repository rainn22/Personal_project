class Customization {
  WrapGiftChoices wrapGiftChoice;
  GiftCard giftCardChoice;
  String userMessage;

  Customization({
    this.wrapGiftChoice = WrapGiftChoices.paperbag,
    this.giftCardChoice = GiftCard.simple,
    this.userMessage = "",
  });

  double get wrapGiftPrice => wrapGiftChoice.price; 
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