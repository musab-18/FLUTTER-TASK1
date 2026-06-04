import 'package:flutter/material.dart';
import 'homescreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Form Key for validation
  final _formKey = GlobalKey<FormState>();

  // Controllers to retrieve text field values
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
        centerTitle: true,
      ),
      // Using Container as requested for the UI structure
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Email Field with validation
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "example@gmail.com",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter email";
                  }
                  // Proper email format validation using regex
                  String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(value)) {
                    return "Enter a valid email format";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Password Field with validation
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  // Ensure password field is not empty
                  if (value == null || value.isEmpty) {
                    return "Please enter password";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Forgot Password Text widget inside a Row
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Login Button (Using TextButton as modern replacement for FlatButton)
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextButton(
                  onPressed: () {
                    // Form Validation check
                    if (_formKey.currentState!.validate()) {
                      // Navigate to Home Screen using Navigator.push()
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomeScreen(),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
