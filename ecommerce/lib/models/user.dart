import 'package:flutter/material.dart';

class User{
  final String name;
  final String phoneNumber;
  final String province;
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

class UserProvider extends ChangeNotifier {
  User? _loggedInUser;

  User? get loggedInUser => _loggedInUser;

  final List<User> _users;

  UserProvider({required List<User> users}) : _users = users;

  bool login(String username, String password) {
    try {
      _loggedInUser = _users.firstWhere(
        (user) => user.name == username && user.password == password,
      );
      notifyListeners();
      return true;
    } catch (e) {
      return false; 
    }
  }

  void logout() {
    _loggedInUser = null;
    notifyListeners();
  }
}
