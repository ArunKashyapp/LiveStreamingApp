import 'package:flutter/material.dart';
import 'package:livestreaming/screens/onboarding_screen.dart';
import 'package:livestreaming/utils/colors.dart';
import 'package:livestreaming/widgets/custom_button.dart';
import 'package:livestreaming/widgets/custom_textfield.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(        title: const Text("Login"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, OnboardingScreen.routeName);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
          child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text("Email", style: TextStyle(color: primaryColor)),
              CustomTextField(controller: _emailController),
              const SizedBox(
                height: 10,
              ),
              const Text("Password", style: TextStyle(color: primaryColor)),
              CustomTextField(controller: _passController),
              const SizedBox(
                height: 20,
              ),
              CustomButton(onTap: () {}, text: "Login")
            ],
          ),
        ),
      )),
    );
  }
}
