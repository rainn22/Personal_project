enum Recipient {
  forHim('For Him'),
  forHer('For Her'),
  forKids('For Kids'),
  forTeens('For Teens'),
  forParents('For Parents'),
  forFriends('For Friends'),
  forCouples('For Couples'),
  forColleagues('For Colleagues');

  final String label;

  const Recipient(this.label);
}
