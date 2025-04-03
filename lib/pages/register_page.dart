import 'package:flamesdeliveryapps/components/my_button.dart';
import 'package:flamesdeliveryapps/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import '../components/my_textfield.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Text editing controllers
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  // Register function
  void register() async {
    final authService = AuthService();

    if (passwordController.text == confirmpasswordController.text) {
      try {
        await authService.signUpWithEmailPassword(
          emailController.text.trim(),
          passwordController.text.trim(),
        );

        // Navigate to LoginPage after successful registration
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage(onTap: widget.onTap)),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Registration Failed"),
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
    } else {
      showDialog(
        context: context,
        builder: (context) => const AlertDialog(title: Text("Passwords don't match!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFf48c06), // Orange
              Color(0xFFd00000), // Red
            ],
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

                // Message
                const Text(
                  "Let's create an account",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 25),

                // Email text field
                MyTextField(
                  controller: emailController,
                  hintText: "Enter your email",
                  obscureText: false,
                ),
                const SizedBox(height: 15),

                // Password text field
                MyTextField(
                  controller: passwordController,
                  hintText: "Enter your password",
                  obscureText: true,
                ),
                const SizedBox(height: 15),

                // Confirm Password text field
                MyTextField(
                  controller: confirmpasswordController,
                  hintText: "Confirm your password",
                  obscureText: true,
                ),
                const SizedBox(height: 20),

                // Sign up button
                MyButton(
                  text: "Sign Up",
                  onTap: register,
                  color: Colors.white,
                  textColor: Colors.redAccent,
                ),
                const SizedBox(height: 25),

                // "Already have an account? Login now" Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage(onTap: widget.onTap)),
                        );
                      },
                      child: const Text(
                        "Login now",
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
