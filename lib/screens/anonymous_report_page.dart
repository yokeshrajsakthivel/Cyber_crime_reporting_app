import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart'; // Import File Picker
import 'dart:io';
import 'thank_you_short.dart';

class AnonymousReportPage extends StatefulWidget {
  const AnonymousReportPage({super.key});

  @override
  AnonymousReportPageState createState() => AnonymousReportPageState();
}

class AnonymousReportPageState extends State<AnonymousReportPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCrime;
  String? _selectedState;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  File? _evidenceFile; // Store the selected evidence file

  // Function to select date
  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // Function to select time
  Future<void> _pickTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  // Function to pick an evidence file
  Future<void> _pickEvidence() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any, // Allows selecting any file type
    );

    if (result != null) {
      setState(() {
        _evidenceFile = File(result.files.single.path!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Anonymous Crime Report")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "🔒 Your safety is our priority. Report a crime anonymously without revealing your identity.",
              style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 29, 28, 28)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            Form(
              key: _formKey,
              child: Column(
                children: [
                  // 🔹 Crime Type Dropdown
                  DropdownButtonFormField<String>(
                    value: _selectedCrime,
                    items: ["-none-", "Cyberbullying", "Fraud", "Hacking"]
                        .map((String category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCrime = value == "-none-" ? null : value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Type of Crime",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // 🔹 Date & Time Selection (Row)
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: "Date of Incident",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          controller: TextEditingController(
                            text: _selectedDate == null
                                ? ''
                                : DateFormat.yMMMd().format(_selectedDate!),
                          ),
                          onTap: () => _pickDate(context),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: TextFormField(
                          readOnly: true,
                          decoration: InputDecoration(
                            labelText: "Time of Incident",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          controller: TextEditingController(
                            text: _selectedTime == null
                                ? ''
                                : _selectedTime!.format(context),
                          ),
                          onTap: () => _pickTime(context),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),

                  // 🔹 Incident Description Field
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Incident Description",
                       alignLabelWithHint: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    maxLines: 3,
                  ),

                  const SizedBox(height: 30),

                  // 🔹 State Selection Dropdown
                  DropdownButtonFormField<String>(
                    value: _selectedState,
                    items: [
                      "Tamil Nadu", "Karnataka", "Maharashtra", "Delhi", "Other"
                    ].map((String state) {
                      return DropdownMenuItem(
                        value: state,
                        child: Text(state),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedState = value;
                      });
                    },
                    decoration: InputDecoration(
                      labelText: "Select State",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),

                  // 🔹 File Upload Field using File Picker
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          _evidenceFile != null
                              ? _evidenceFile!.path.split('/').last // Display file name
                              : "No file selected",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      TextButton.icon(
                        onPressed: _pickEvidence,
                        icon: const Icon(Icons.attach_file),
                        label: const Text("Upload Evidence"),
                      ),
                    ],
                  ),

                  const SizedBox(height: 50),

                  // 🔹 Submit Button (Disabled if "-none-" is selected)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedCrime == null ? Colors.grey : Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    onPressed: _selectedCrime == null
                        ? null // Disable button if no crime is selected
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => ThankYouShort()),
                            );
                          },
                    child: const Text("Submit Anonymously", style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
