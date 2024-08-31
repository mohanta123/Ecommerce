import 'package:flutter/material.dart';
import '../bottomNavigationBar.dart';
import '../constants.dart';
import '../widgets/fonts.dart';
import 'loginPage.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _agreeToTerms = false;

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final padding = screenWidth * 0.05; // Adjust padding dynamically

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // Background gradient
            Container(
              height: screenHeight,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black38, Colors.black87],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            // Top circles decoration
            Positioned(
              top: screenHeight * 0.07,
              left: screenWidth * 0.1,
              child: CircleAvatar(
                radius: 20,
                backgroundColor: customColor,
              ),
            ),
            Positioned(
              top: screenHeight * 0.13,
              right: screenWidth * 0.15,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: customColor,
              ),
            ),
            // Main registration form
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.1),
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: customColor,
                      child: const Text(
                        'LOGO',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.04),
                    // White container for the form
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.black38.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: customColor, width: 0.8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 8,
                            blurRadius: 19,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              'Registration',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          _buildTextField('Username'),
                          const SizedBox(height: 10),
                          _buildTextField('Full name'),
                          const SizedBox(height: 10),
                          _buildTextField('City'),
                          const SizedBox(height: 10),
                          _buildTextField('E-mail'),
                          const SizedBox(height: 10),
                          _buildTextField('Password', isPassword: true),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Text(
                                'Already Registerd?',
                                style: TextFont.normal_TextStyle.copyWith(
                                  fontSize: screenWidth * 0.03, // Scaled font size
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.01), // Scaled spacer
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginPage()),
                                  );
                                },
                                child: Text(
                                  'Login',
                                  style: TextFont.normal_TextStyle.copyWith(
                                    fontSize: screenWidth * 0.035, // Scaled font size
                                    color: customColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          // Register button
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ButtonNavigation(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: customColor,
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.1,
                                  vertical: screenHeight * 0.01,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              child: Text(
                                'Register',
                                style: TextFont.normal_TextStyle.copyWith(
                                  fontSize: screenWidth * 0.04,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, {bool isPassword = false}) {
    final screenWidth = MediaQuery.of(context).size.width;
    return TextFormField(
      obscureText: isPassword,
      style: TextFont.normal_TextStyle.copyWith(
        fontSize: screenWidth * 0.033,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextFont.normal_TextStyle.copyWith(
          fontSize: screenWidth * 0.033,
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.black26,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade800),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade800),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade800),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
