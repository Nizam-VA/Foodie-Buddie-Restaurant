import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/view/screen/login/widgets/screen_login.dart';
import 'package:foodiebuddierestaurant/view/screen/login/widgets/screen_register.dart';

class ScreenLoginRegister extends StatelessWidget {
  const ScreenLoginRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(tabs: [
            Tab(text: 'Login'),
            Tab(text: 'Sign Up'),
          ]),
          title: const Text('Foodie Buddie'),
          centerTitle: true,
        ),
        body: TabBarView(children: [
          ScreenLogin(),
          ScreenRegister(),
        ]),
      ),
    );
  }
}
