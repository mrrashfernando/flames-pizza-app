import 'package:flamesdeliveryapps/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flamesdeliveryapps/components/my_textfield.dart';
import 'package:flamesdeliveryapps/components/my_button.dart';
import 'register_page.dart';
import 'home_page.dart'; // Ensure HomePage exists

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Login method
  void login() async {
    final authService = AuthService();

    try {
      // Attempt to sign in
      await authService.signInWithEmailPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      // Check if user is authenticated
      final user = authService.getCurrentUser();
      if (user != null) {
        // Navigate to HomePage
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        throw Exception("Login failed. Please try again.");
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Login Failed"),
          content: Text(e.toString()),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ Color(0xFFf48c06), // Orange
              Color(0xFFd00000), ], // Deep to light blue
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Icon(
                  Icons.local_pizza,
                  size: 100,
                  color: Colors.white,
                ),
                const SizedBox(height: 25),

                // App Name / Slogan
                const Text(
                  "Food Delivery App",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 25),

                // Email text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MyTextField(
                    controller: emailController,
                    hintText: "Enter your email",
                    obscureText: false,
                  ),
                ),
                const SizedBox(height: 15),

                // Password text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MyTextField(
                    controller: passwordController,
                    hintText: "Enter your password",
                    obscureText: true,
                  ),
                ),
                const SizedBox(height: 20),

                // Sign in button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: MyButton(
                    text: "Sign In",
                    onTap: login,
                    color: Colors.white, // White button
                    textColor: Colors.redAccent, // Dark blue text
                  ),
                ),
                const SizedBox(height: 25),

                // "Not a member? Register now" Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Not a member?",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        // Navigate to RegisterPage
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterPage(onTap: widget.onTap),
                          ),
                        );
                      },
                      child: const Text(
                        "Register now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
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
    );
  }
}
