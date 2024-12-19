enum WrapGiftChoices {
  paperbag('Paper Bag', 0.00),
  giftWrap('Gift Wrap', 1.00),
  giftBox('Gift Box', 5.00);

  final String label;
  final double price;
  const WrapGiftChoices(this.label, this.price);
}