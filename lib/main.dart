import 'package:flutter/material.dart';
import 'screens/landing_page.dart';

void main() {
  runApp(const CyberCrimeReportApp());
}

class CyberCrimeReportApp extends StatelessWidget {
  const CyberCrimeReportApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cyber Crime Reporting App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LandingPage(), // Remove 'const' OR make LandingPage const
    );
  }
}
