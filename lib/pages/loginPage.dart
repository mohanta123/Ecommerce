import 'package:appman_ecommerce/pages/signupPage.dart';
import 'package:flutter/material.dart';

import '../bottomNavigationBar.dart';
import '../constants.dart';
import '../widgets/fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
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
            Positioned(
              top: screenHeight * 0.06,
              left: screenWidth * 0.1,
              child: CircleAvatar(
                radius: screenWidth * 0.07,
                backgroundColor: customColor,
              ),
            ),
            Positioned(
              top: screenHeight * 0.12,
              right: screenWidth * 0.15,
              child: CircleAvatar(
                radius: screenWidth * 0.03,
                backgroundColor: customColor,
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.15),
                    CircleAvatar(
                      radius: screenWidth * 0.15,
                      backgroundColor: customColor,
                      child: Text(
                        'LOGO',
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Container(
                      padding: EdgeInsets.all(screenWidth * 0.05),
                      decoration: BoxDecoration(
                        color: Colors.black38.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(screenWidth * 0.05),
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
                              'Login',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.015),
                          _buildTextField('E-mail'),
                          SizedBox(height: screenHeight * 0.015),
                          _buildTextField('Password', isPassword: true),
                          SizedBox(height: screenHeight * 0.03),
                          Row(
                            children: [
                              Text(
                                'New User?',
                                style: TextFont.normal_TextStyle.copyWith(
                                  fontSize: screenWidth * 0.03,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: screenWidth * 0.01),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpPage()),
                                  );
                                },
                                child: Text(
                                  'Signup',
                                  style: TextFont.normal_TextStyle.copyWith(
                                    fontSize: screenWidth * 0.035,
                                    color: customColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.03),
                          // Register button
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ButtonNavigation()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: customColor,
                                padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.1,
                                  vertical: screenHeight * 0.01,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                  BorderRadius.circular(screenWidth * 0.05),
                                ),
                              ),
                              child: Text(
                                'Login',
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
      obscureText: isPassword && !_isPasswordVisible,
      style: TextFont.normal_TextStyle.copyWith(
        fontSize: screenWidth * 0.035,
        color: Colors.white,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextFont.normal_TextStyle.copyWith(
          fontSize: screenWidth * 0.035,
          color: Colors.white,
        ),
        filled: true,
        fillColor: Colors.black26,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          borderSide: BorderSide(color: Colors.grey.shade800),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          borderSide: BorderSide(color: Colors.grey.shade800),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          borderSide: BorderSide(color: Colors.grey.shade800),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.03),
          borderSide: const BorderSide(color: Colors.red),
        ),
        suffixIcon: isPassword
            ? IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        )
            : null,
      ),
    );
  }
}
