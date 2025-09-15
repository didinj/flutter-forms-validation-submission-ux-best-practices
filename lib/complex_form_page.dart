import 'package:flutter/material.dart';

class ComplexFormPage extends StatefulWidget {
  const ComplexFormPage({super.key});

  @override
  State<ComplexFormPage> createState() => _ComplexFormPageState();
}

class _ComplexFormPageState extends State<ComplexFormPage> {
  final _formKey = GlobalKey<FormState>();

  String? _name;
  String? _email;
  String? _gender;
  bool _agree = false;

  final List<String> _genders = ['Male', 'Female', 'Other'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Complex Form")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
                onSaved: (value) => _name = value,
                validator: (value) =>
                    value == null || value.isEmpty ? "Enter your name" : null,
              ),
              const SizedBox(height: 16),

              // Email
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) => _email = value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter your email";
                  }
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                  return !emailRegex.hasMatch(value)
                      ? "Enter a valid email"
                      : null;
                },
              ),
              const SizedBox(height: 16),

              // Dropdown for Gender
              DropdownButtonFormField<String>(
                decoration: const InputDecoration(
                  labelText: "Gender",
                  border: OutlineInputBorder(),
                ),
                initialValue: _gender,
                items: _genders
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (value) => setState(() => _gender = value),
                validator: (value) =>
                    value == null ? "Please select a gender" : null,
              ),
              const SizedBox(height: 16),

              // Checkbox for Agreement
              CheckboxListTile(
                title: const Text("I agree to the Terms and Conditions"),
                value: _agree,
                onChanged: (value) => setState(() => _agree = value ?? false),
                controlAffinity: ListTileControlAffinity.leading,
                subtitle: !_agree
                    ? const Text(
                        "Required",
                        style: TextStyle(color: Colors.red),
                      )
                    : null,
              ),
              const SizedBox(height: 24),

              // Submit button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      if (!_agree) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("You must agree to continue"),
                          ),
                        );
                        return;
                      }
                      _formKey.currentState?.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Submitted: $_name, $_email, $_gender, Agree: $_agree",
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text("Submit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
