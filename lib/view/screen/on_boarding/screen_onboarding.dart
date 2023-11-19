import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/utils/constants.dart';
import 'package:foodiebuddierestaurant/view/screen/login/screen_login.dart';

class ScreenOnboard extends StatelessWidget {
  ScreenOnboard({super.key});
  final images = [
    'assets/images/food-app.png',
    'assets/images/food.png',
    'assets/images/smartphone.png'
  ];
  final titles = [
    'Wide range of Food Categories & more',
    'Free Deliveries for One Month!',
    'Get started on Ordering your Food'
  ];
  final subTitles = [
    "Browse through our extensive list of restaurants and dishes, and when you're ready to order, simply add your desired items to your cart and checkout. It's that easy!",
    'Get your favorite meals delivered to your doorstep for free with our online food delivery app - enjoy a whole month of complimentary delivery!',
    'Get your favorite meals delivered to your doorstep for free with our online food delivery app - enjoy a whole month of complimentary delivery!'
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: PageView.builder(itemBuilder: (context, position) {
        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(24),
            child: Column(
              children: [
                kHight100,
                SizedBox(
                  width: width,
                  height: height * .35,
                  child: Image.asset(
                    images[position],
                    fit: BoxFit.contain,
                  ),
                ),
                kHight20,
                Text(
                  titles[position],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                kHight10,
                Text(
                  subTitles[position],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  width: width * .3,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ScreenLoginRegister()));
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(position == 2 ? "Let's Start" : 'Skip'),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
