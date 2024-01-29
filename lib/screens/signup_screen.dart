import 'package:flutter/material.dart';
import 'package:livestreaming/resources/auth_methods.dart';
import 'package:livestreaming/screens/home_screen.dart';
import 'package:livestreaming/screens/onboarding_screen.dart';
import 'package:livestreaming/utils/colors.dart';
import 'package:livestreaming/widgets/custom_button.dart';
import 'package:livestreaming/widgets/custom_textfield.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();

  void signUpUser() async {
    bool res = await _authMethods.signUp(
      context,
      _emailController.text,
      _userNameController.text,
      _passController.text,
    );

    if (res) {
      () {
        Navigator.pushNamed(context, HomeScreen.routeName);
      }();
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
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
              const Text(
                "UserName",
                style: TextStyle(color: primaryColor),
              ),
              CustomTextField(controller: _userNameController),
              const SizedBox(
                height: 10,
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
              CustomButton(
                  onTap: () {
                    signUpUser();
                  },
                  text: "Sign Up")
            ],
          ),
        ),
      )),
    );
  }
}
