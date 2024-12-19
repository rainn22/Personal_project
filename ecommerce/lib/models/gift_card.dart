enum GiftCard {
  simple('Default'),
  bd('BirthdayCard'),
  thanks('Thank you Card'),
  valentine('Valentine day Card');

  final String label;
  const GiftCard(this.label);
}