enum Province {
  phnomPenh('Phnom Penh'),
  kampongCham('Kampong Cham'),
  siemReab('Siem Reap'),
  battambang('Battambang'),
  kapot('Kampot'),
  kep('Kep'),
  kps('Preah Sihanouk'),
  mdk('Mondulkiri');

  final String label;

  const Province(this.label);
}

class User{
  final String name;
  final String phoneNumber;
  final Province province;
  final String commune;
  final String password;

  User({
    required this.name, 
    required this.phoneNumber, 
    required this.province,
    required this.commune, 
    required this.password,
  });
}