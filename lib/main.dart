import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:livestreaming/firebase_options.dart';
import 'package:livestreaming/providers/user_providers.dart';
import 'package:livestreaming/screens/home_screen.dart';
import 'package:livestreaming/screens/login_screen.dart';
import 'package:livestreaming/screens/onboarding_screen.dart';
import 'package:livestreaming/screens/signup_screen.dart';
import 'package:livestreaming/utils/colors.dart';
import 'package:provider/provider.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => UserProvider(),
    ),
  ], child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Twitch Clone Tutorial',
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        appBarTheme: AppBarTheme.of(context).copyWith(
          backgroundColor: backgroundColor,
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
          iconTheme: const IconThemeData(
            color: primaryColor,
          ),
        ),
      ),
      routes: {
        OnboardingScreen.routeName: (context) => const OnboardingScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
      },
      home: const Scaffold(
        body: OnboardingScreen(),
      ),
    );
  }
}
