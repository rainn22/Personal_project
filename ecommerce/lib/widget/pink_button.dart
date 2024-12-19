import 'package:flutter/material.dart';

class PinkButton extends StatelessWidget {
  final String text;  // Text to display on the button
  final VoidCallback onPressed;  // Callback for the onPressed action

  const PinkButton({
    Key? key,
    required this.text,  // Make text required
    required this.onPressed,  // Make onPressed required
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFF98CA0),  
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text, 
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
