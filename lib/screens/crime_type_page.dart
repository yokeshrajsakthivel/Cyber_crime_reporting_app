import 'package:flutter/material.dart';
import 'anonymous_report_page.dart';
import 'register_page.dart';

class CrimeTypePage extends StatelessWidget {
  const CrimeTypePage({super.key}); // Added key

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Report a Crime"),),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10), // Adjust Overall Page Padding
        child: Column(
          children: [
            // Women/Children Related Crime
            CrimeCategory(
              title: "Women/Children Related Crime",
              imagePath: "assets/womenpng.png", // Image Path
              anonymousRoute: const AnonymousReportPage(),
              registerRoute: const RegisterPage(),
            ),

            // Financial Fraud
            CrimeCategory(
              title: "Financial Fraud",
              imagePath: "assets/Finencial.png", // Image Path
              anonymousRoute: null,
              registerRoute: const RegisterPage(),
            ),

            // Other Cyber Crimes
            CrimeCategory(
              title: "Other Cyber Crime",
              imagePath: "assets/other_crime.png", // Image Path
              anonymousRoute: null,
              registerRoute: const RegisterPage(),
            ),
          ],
        ),
      ),
    );
  }
}

class CrimeCategory extends StatelessWidget {
  final String title;
  final String imagePath; // New Parameter for Image
  final Widget? anonymousRoute;
  final Widget registerRoute;

  const CrimeCategory({
    super.key,
    required this.title,
    required this.imagePath, // Initialize Image
    this.anonymousRoute,
    required this.registerRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10), // Adjust Card Margin
      child: Padding(
        padding: const EdgeInsets.all(8), // Add Padding Inside Card
        child: Column(
          mainAxisSize: MainAxisSize.min, // Keep content compact
          children: [
            // Crime Image
            Image.asset(
              imagePath,
              height: 120, // Adjust Image Size
            ),

            const SizedBox(height: 8), // Add Space

            // Crime Title
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center, // Center Align Title
            ),

            const SizedBox(height: 10), // Add Space

            // Buttons (Centered)
            Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center Buttons
              children: [
                if (anonymousRoute != null)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Change Button Color
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => anonymousRoute!),
                      );
                    },
                    child: const Text("Report Anonymously"),
                  ),
                const SizedBox(width: 10), // Space Between Buttons
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Change Button Color
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => registerRoute),
                    );
                  },
                  child: const Text("Register & Track"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
