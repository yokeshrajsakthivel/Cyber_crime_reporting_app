import 'package:flutter/material.dart';
import 'crime_type_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 🔹 Main Content
          Padding(
            padding: const EdgeInsets.all(20), // Adjust overall page padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start, 
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: [
                const SizedBox(height: 100), // Space after logos

                // 🔹 Title
                const Text(
                  "Report Cybercrimes & Stay Safe Online", 
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 10), // Adjust space between title & description

                // 🔹 Description (Customizable)
                const Text(
                  "Your safety is our priority. Report online threats, frauds, "
                  "and cybercrimes with ease. Stay protected by staying informed.",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.center, 
                ),

                const SizedBox(height: 40), // Adjust space before image

                // 🔹 Centered Image
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/landing_image.png', 
                    height: 350,
                  ),
                ),

                const SizedBox(height: 60), // Adjust space before button

                // 🔹 Button Section (Customizable)
                Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, 
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10), 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CrimeTypePage()),
                      );
                    },
                    child: const Text(
                      "Report Crime", 
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 🔹 Top Bar with Logos
          Positioned(
            top: 40, // Adjust distance from the top
            left: 30, // Adjust left logo position
            right: 10, // Adjust right logo position
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Place logos at both ends
              children: [
                // 🔹 Left Logo
                Image.asset(
                  'assets/indianlogo.png', // Replace with actual logo file
                  height: 50, // Adjust logo size
                ),

                // 🔹 Right Logo
                Image.asset(
                  'assets/digital india.png', // Replace with actual logo file
                  height: 40, // Adjust logo size
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
