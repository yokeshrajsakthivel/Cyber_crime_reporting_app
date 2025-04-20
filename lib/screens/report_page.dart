import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import for date formatting
import 'package:file_picker/file_picker.dart'; // Import for file picking
import 'thank_you_final.dart';

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
  String? _fileName;

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

  // Function to pick a file
  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name; // Get the selected file name
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Submit & Track Your Report")),

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Sub-description below title bar
              const Text(
                "🛡 Report cybercrimes and track updates on your case in real time.",
                style: TextStyle(fontSize: 18, color: Color.fromARGB(255, 29, 28, 28)),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40), // Spacing before form

              Form(
                key: _formKey,
                child: Column(
                  children: [
                    // 🔹 Crime Type Dropdown
                    DropdownButtonFormField<String>(
                      value: _selectedCrime,
                      items: ["Cyberbullying", "Mobile phone Fraud", "Social media Hack", "online shopping scam"]
                          .map((String category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(category),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCrime = value;
                        });
                      },
                      decoration: InputDecoration(
                        labelText: "Type of Crime",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),

                    const SizedBox(height: 30), // Spacing

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

                    const SizedBox(height: 30), // Spacing

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

                    const SizedBox(height: 30), // Spacing

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

                    const SizedBox(height: 30), // Spacing

                    // 🔹 File Upload Field
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _fileName ?? "No file selected",
                            style: TextStyle(color: Colors.grey[700]),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: _pickFile,
                          icon: const Icon(Icons.attach_file),
                          label: const Text("Upload Evidence"),
                        ),
                      ],
                    ),

                    const SizedBox(height: 50), // Spacing before button

                    // 🔹 Submit Button
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
                                MaterialPageRoute(builder: (context) => const ThankYouFinal()),
                              );
                            },
                      child: const Text("Submit Report", style: TextStyle(fontSize: 16)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
