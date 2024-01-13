import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_quiz_app/configs/themes/app_colors.dart';
import 'package:mobile_quiz_app/controllers/question_paper/auth_controller.dart';
import 'package:mobile_quiz_app/widgets/common/main_button.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<AuthConatroller> {
  LoginScreen({Key? key});

  static const String routeName = "/login";

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/app_splash_logo.png",
                width: 200,
                height: 200,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  "Your on-the-go learning companion, with resources, quizzes, and tools for effective, personalized studying and academic success.",
                  style: TextStyle(
                    color: onSurfaceTextColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              // Email text field
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              // Password text field
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
                  labelText: 'Password',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              SizedBox(
                  height: 16), // Add some space between text field and button
              // Sign In button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    controller.signInWithEmailAndPassword(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                    );
                  }
                },
                child: Text("Sign In"),
              ),
              // Register button
              TextButton(
                onPressed: () {
                  // Navigate to the registration page
                  controller.navigateToRegisterPage();
                },
                child: Text(
                  "Register",
                  style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              // Sign In with Google button (your existing code)
              MainButton(
                onTap: () {
                  controller.signInWithGoogle();
                },
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      child: SvgPicture.asset("assets/icons/google.svg"),
                    ),
                    Center(
                      child: Text(
                        "Sign in with Google",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
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
