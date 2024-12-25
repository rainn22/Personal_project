import 'package:ecommerce/models/user.dart';
import 'package:ecommerce/widget/pink_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  void handleLogin(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    String enteredUsername = usernameController.text;
    String enteredPassword = passwordController.text;

    bool isLoginSuccessful = userProvider.login(enteredUsername, enteredPassword);

    if (isLoginSuccessful) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid username or password. Please try again."),
          backgroundColor: Colors.black,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Welcome \nBack!",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 60),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                hintText: "Username",
                prefixIcon: Icon(Icons.person, color: Colors.grey[800]),
                filled: true,
                fillColor: Colors.grey[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                prefixIcon: Icon(Icons.lock, color: Colors.grey[800]),
                filled: true,
                fillColor: Colors.grey[50],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 60),
            PinkButton(
              text: 'Login',
              onPressed: () {
                handleLogin(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
