import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/core/constants.dart';
import 'package:foodiebuddierestaurant/view/widgets/button_widget.dart';

class ScreenConfirmation extends StatelessWidget {
  const ScreenConfirmation({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Please wait till your restaurant data is been verified',
              ),
              kHight20,
              ButtonWidget(
                width: width,
                text: 'Reload',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
