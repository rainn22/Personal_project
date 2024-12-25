import 'package:flutter/material.dart';

class OrderSuccessModal extends StatelessWidget {
  const OrderSuccessModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 60.0,
            ),
            const SizedBox(height: 16.0),
            const Text(
              "ORDER SUCCESS",
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              "Your order was successful",
              style: TextStyle(fontSize: 14.0, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30.0),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.grey), 
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero), 
                ),
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: const Text(
                  'BACK TO HOME',
                  style: TextStyle(
                    color: Colors.black, 
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
