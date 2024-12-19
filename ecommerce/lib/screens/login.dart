import 'package:ecommerce/data/users.dart'; // Assuming users are stored in this data
import 'package:ecommerce/widget/pink_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin(BuildContext context) {
    String enteredUsername = usernameController.text;
    String enteredPassword = passwordController.text;

    bool isUserFound = users.any((user) =>
        user.name == enteredUsername && user.password == enteredPassword);

    if (isUserFound) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // Show an error message
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
            // Welcome caption
            const Text(
              "Welcome \nBack!",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 60),

            // Username Field
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

            // Password Field (without visibility icon)
            TextField(
              controller: passwordController,
              obscureText: true,  // Always obscure the text
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

            // Login Button
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
