import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/view/screen/login/screen_login.dart';
import 'package:foodiebuddierestaurant/view/screen/main/screen_main.dart';
import 'package:foodiebuddierestaurant/view/screen/on_boarding/screen_onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    checkUserOnBoarding();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      body: Center(
        child: Image.asset(
          'assets/images/food-app.png',
          height: 80,
        ),
      ),
    );
  }

  Future<void> gotoLogin() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const ScreenLoginRegister(),
      ),
    );
  }

  Future<void> checkUserOnBoarding() async {
    final preferences = await SharedPreferences.getInstance();
    final userBoarding = preferences.getBool('ON_BOARD');
    final userLoggedIn = preferences.get('LOGIN');
    if (userBoarding == null || userBoarding == false) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (ctx) => ScreenOnboard(),
        ),
      );
    } else {
      if (userLoggedIn == null || userLoggedIn == false) {
        await Future.delayed(const Duration(seconds: 3));
        gotoLogin();
      } else {
        await Future.delayed(const Duration(seconds: 3));
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ScreenMain(),
          ),
        );
      }
    }
  }
}
