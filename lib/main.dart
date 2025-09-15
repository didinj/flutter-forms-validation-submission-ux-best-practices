// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Forms Demo',
//       theme: ThemeData(
//         inputDecorationTheme: const InputDecorationTheme(
//           errorStyle: TextStyle(color: Colors.red, fontSize: 14),
//           focusedErrorBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.red, width: 2),
//           ),
//         ),
//       ),
//       home: const SimpleFormPage(),
//     );
//   }
// }

// class SimpleFormPage extends StatefulWidget {
//   const SimpleFormPage({super.key});

//   @override
//   State<SimpleFormPage> createState() => _SimpleFormPageState();
// }

// class _SimpleFormPageState extends State<SimpleFormPage> {
//   final _formKey = GlobalKey<FormState>();

//   String? _name;
//   String? _email;

//   bool _isSubmitting = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Simple Form")),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           child: Column(
//             children: [
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: "Name",
//                   border: OutlineInputBorder(),
//                 ),
//                 onSaved: (value) => _name = value,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please enter your name";
//                   }
//                   if (value.length < 3) {
//                     return "Name must be at least 3 characters long";
//                   }
//                   return null; // input is valid
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 decoration: const InputDecoration(
//                   labelText: "Email",
//                   hintText: "example@email.com",
//                   helperText: "We'll never share your email",
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return "Please enter your email";
//                   }
//                   final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
//                   if (!emailRegex.hasMatch(value)) {
//                     return "Enter a valid email address";
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 24),
//               ElevatedButton(
//                 onPressed: _isSubmitting
//                     ? null
//                     : () async {
//                         if (_formKey.currentState?.validate() ?? false) {
//                           setState(() => _isSubmitting = true);
//                           await Future.delayed(
//                             const Duration(seconds: 2),
//                           ); // fake API call
//                           _formKey.currentState?.save();
//                           setState(() => _isSubmitting = false);

//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text("Form submitted: $_name, $_email"),
//                             ),
//                           );
//                         }
//                       },
//                 child: _isSubmitting
//                     ? const SizedBox(
//                         width: 20,
//                         height: 20,
//                         child: CircularProgressIndicator(
//                           strokeWidth: 2,
//                           color: Colors.white,
//                         ),
//                       )
//                     : const Text("Submit"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// lib/main.dart
import 'package:flutter/material.dart';
import 'complex_form_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Forms Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ComplexFormPage(),
    );
  }
}
