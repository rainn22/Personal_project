import 'package:flutter/material.dart';

class CustomTypeButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  const CustomTypeButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.isSelected, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed, 
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: isSelected ? const Color(0xFFF98CA0) : const Color(0xFF888888), // White text if selected, dark grey if unselected
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
