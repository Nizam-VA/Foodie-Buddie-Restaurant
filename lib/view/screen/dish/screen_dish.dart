import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/model/dish.dart';
import 'package:foodiebuddierestaurant/utils/constants.dart';
import 'package:foodiebuddierestaurant/view/widgets/app_bar.dart';
import 'package:foodiebuddierestaurant/view/widgets/section_header.dart';

class ScreenDish extends StatelessWidget {
  ScreenDish({super.key, required this.dish});
  final DishModel? dish;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarWidget(title: dish!.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            kHight20,
            Container(
              width: width,
              height: height * .25,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: dish!.image == ''
                        ? const AssetImage('assets/images/categories/dish.jpg')
                            as ImageProvider
                        : NetworkImage(dish!.image!),
                    fit: BoxFit.cover),
              ),
            ),
            kHight10,
            Container(
              width: width,
              height: height * .4,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  kHight10,
                  SectionHead(heading: dish!.name),
                  kHight10,
                  Text(dish!.description),
                  kHight10,
                  SectionHead(heading: '₹ ${dish!.price.toString()}'),
                  kHight10,
                  SectionHead(heading: 'Quantity: ${dish!.quantity}'),
                  kHight10,
                  SectionHead(heading: 'Veg: ${dish!.isVeg}'),
                  kHight10,
                  SectionHead(heading: 'Availability: ${dish!.isAvailable}'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
