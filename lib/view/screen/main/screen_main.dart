import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/view/screen/home/screen_home.dart';
import 'package:foodiebuddierestaurant/view/screen/oders/screen_orders.dart';
import 'package:foodiebuddierestaurant/view/screen/offers/screen_offers.dart';
import 'package:foodiebuddierestaurant/view/screen/profile/screen_profile.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});

  final List screens = [
    const ScreenHome(),
    const ScreenOrders(),
    const ScreenOffers(),
    const ScreenProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[0],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green[50],
        selectedItemColor: Colors.green[900],
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (value) {},
        items: const [
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/icons/foods.png')),
              label: 'Menu'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/icons/cart.png')),
              label: 'Orders'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/icons/restaurant.png')),
              label: 'Offers'),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/images/icons/profile.png')),
              label: 'Profile')
        ],
      ),
    );
  }
}
