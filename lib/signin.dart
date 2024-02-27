// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Signin extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Profile profile = Profile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0000EB),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Color(0xFF0000EB)),
              height: 300,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('          Hi There!',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w700)),
                  Text('          Let’s Get Start',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 19,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Color(0xFFFF84C3)),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: Color(0xFFD7EC54)),
            ),
          ),
          Expanded(
            flex: 10,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      TextFormField(
                        onSaved: (value) => profile.username = value!.trim(),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          } else if (!isValidEmail(value)) {
                            return 'Please enter a valid Gmail address';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Gmail Address',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        onSaved: (value) => profile.password = value!.trim(),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        onSaved: (value) =>
                            profile.confirmPassword = value!.trim(),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm your password';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Confirm password',
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'I agreed to the ',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            'terms and conditions',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xFF46D06D)),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();

                            // Trim the passwords before comparing
                            String trimmedPassword = profile.password.trim();
                            String trimmedConfirmPassword =
                                profile.confirmPassword.trim();

                            // Check if passwords match
                            if (trimmedPassword == trimmedConfirmPassword) {
                              // Access the entered information using the profile instance
                              print("Gmail Address: ${profile.username}");
                              print("Password: $trimmedPassword");
                              print(
                                  "Confirm Password: $trimmedConfirmPassword");

                              // Save data to Firebase
                              await saveDataToFirebase(profile);

                              // Navigate to the login page
                              Navigator.pushNamed(context, '/login');
                            } else {
                              // Passwords do not match, show an error message
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Passwords do not match.'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFFFEC4DD)),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        ),
                        child: Text('Sign In',
                            style: TextStyle(color: Colors.black)),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account?',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/login');
                              // Replace '/login' with your actual login page route
                            },
                            child: Text(
                              'Log In here',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> saveDataToFirebase(Profile profile) async {
    try {
      await Firebase.initializeApp(); // Ensure Firebase is initialized

      // Get a reference to the Firestore instance
      FirebaseFirestore firestore = FirebaseFirestore.instance;

      // Add user data to a 'users' collection
      await firestore.collection('users').add({
        'gmail_address': profile.username,
        'password': profile.password,
        // Add more fields as needed
      });

      print('Data saved to Firebase!');
    } catch (e) {
      print('Error saving data to Firebase: $e');
    }
  }

  // Function to validate Gmail address format
  bool isValidEmail(String email) {
    return RegExp(r'^[a-zA-Z0-9.]+@gmail\.com$').hasMatch(email);
  }
}

class Profile {
  String username = '';
  String password = '';
  String confirmPassword = '';
}
