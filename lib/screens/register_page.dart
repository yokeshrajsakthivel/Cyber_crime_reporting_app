import 'package:flutter/material.dart';
import 'report_page.dart'; // Ensure the import path is correct

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();

  String? _fullName;
  String? _email;
  String? _mobile;
  String? _password;

  // Spacing Constants
  static const double descriptionTopSpacing = 30;
  static const double descriptionBottomSpacing = 40;
  static const double formBottomSpacing = 30;
  static const double fieldSpacing = 30;
  static const double buttonTopSpacing = 50;
  static const double buttonBottomSpacing = 30;

  bool get isFormValid =>
      _fullName != null &&
      _email != null &&
      _mobile != null &&
      _password != null &&
      _password!.length >= 6 &&
      RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(_email!) &&
      RegExp(r'^[0-9]{10}$').hasMatch(_mobile!);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register & Track Your Complaint")),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: descriptionTopSpacing),

              // Description
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: const Text(
                    "🛡️ Secure Your Complaint - Register to Track Your Report.",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

              SizedBox(height: descriptionBottomSpacing),

              // Form inside a bordered box
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: const Color.fromARGB(255, 29, 30, 31), width: 1),
                  color: Colors.white,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Full Name",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        onChanged: (value) => setState(() => _fullName = value.isNotEmpty ? value : null),
                        validator: (value) => (value == null || value.isEmpty) ? "Enter your full name" : null,
                      ),

                      SizedBox(height: fieldSpacing),

                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) => setState(() => _email = value.isNotEmpty ? value : null),
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Enter your email";
                          if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value)) {
                            return "Enter a valid email";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: fieldSpacing),

                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Mobile No",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        keyboardType: TextInputType.phone,
                        onChanged: (value) => setState(() => _mobile = value.isNotEmpty ? value : null),
                        validator: (value) {
                          if (value == null || value.isEmpty) return "Enter your mobile number";
                          if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                            return "Enter a valid 10-digit mobile number";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: fieldSpacing),

                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                        ),
                        obscureText: true,
                        onChanged: (value) => setState(() => _password = value.isNotEmpty ? value : null),
                        validator: (value) => (value == null || value.length < 6)
                            ? "Password must be at least 6 characters"
                            : null,
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: formBottomSpacing),

              // Button to Navigate to Report Page
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(top: buttonTopSpacing, bottom: buttonBottomSpacing),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isFormValid ? Colors.blue : Colors.grey,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    onPressed: isFormValid
                        ? () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const AnonymousReportPage()), // Navigate to ReportPage
                              );
                            }
                          }
                        : null,
                    child: const Text("Register & Report", style: TextStyle(fontSize: 16)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
