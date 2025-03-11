import 'package:flutter/material.dart';
import 'landing_page.dart';

class ThankYouFinal extends StatelessWidget {
  const ThankYouFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Thank you for your report. Let’s Fight Cyber Crime Your submission has been received successfully.If you need urgent help, please contact 1930.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic), // Adjusted text size
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Change this to any color you prefer
                foregroundColor: Colors.white, // Text color
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15), // Button padding
              ),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LandingPage()),
                  (route) => false,
                );
              },
              child: const Text("Close", style: TextStyle(fontSize: 16)), // Adjusted button text size
            ),
          ],
        ),
      ),
    );
  }
}
