// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'profile.dart';

class Login extends StatelessWidget {
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
          _buildHeaderSection(),
          _buildColoredSection(Color(0xFFFF84C3)),
          _buildColoredSection(Color(0xFFD7EC54)),
          _buildLoginForm(context),
        ],
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Color(0xFF0000EB)),
        height: 300,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi There!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Let’s Get Started',
              style: TextStyle(
                color: Colors.white,
                fontSize: 19,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildColoredSection(Color color) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: color),
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Expanded(
      flex: 10,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 50),
                _buildUsernameField(),
                SizedBox(height: 10),
                _buildPasswordField(),
                SizedBox(height: 20),
                _buildLoginButton(context),
                SizedBox(height: 10),
                _buildSignUpLink(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildUsernameField() {
    return TextFormField(
      onSaved: (value) => profile.username = value!,
      validator: (value) =>
          value == null || value.isEmpty ? 'Please enter your username' : null,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Username',
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      onSaved: (value) => profile.password = value!,
      validator: (value) =>
          value == null || value.isEmpty ? 'Please enter your password' : null,
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Password',
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          try {
            await signInWithEmailAndPassword(context);
          } catch (e) {
            print("Sign In Error: $e");
            Fluttertoast.showToast(
              msg: "Authentication failed",
              gravity: ToastGravity.CENTER,
            );
          }
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFEC4DD)),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
      child: Text('Log In', style: TextStyle(color: Colors.black)),
    );
  }

  Widget _buildSignUpLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don’t have an account?',
          style: TextStyle(color: Colors.grey[700]),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/signin');
          },
          child: Text(
            'Sign Up here',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> signInWithEmailAndPassword(BuildContext context) async {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: profile.username,
      password: profile.password,
    );

    print("Sign In Successful for ${userCredential.user!.email}");

    // Perform any additional actions or navigate to the next page
    Navigator.pushReplacementNamed(context, '/convert_main');
  }
}
