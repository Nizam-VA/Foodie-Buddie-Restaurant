import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/utils/constants.dart';
import 'package:foodiebuddierestaurant/view/screen/all_categories/screen_all_categories.dart';
import 'package:foodiebuddierestaurant/view/screen/home/widgets/categories_grid_view.dart';
import 'package:foodiebuddierestaurant/view/widgets/floating_button.dart';
import 'package:foodiebuddierestaurant/view/widgets/section_header.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              width: width,
              height: height * .375,
              decoration: BoxDecoration(
                color: Colors.green[700],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(48),
                  bottomRight: Radius.circular(48),
                ),
              ),
              child: Column(
                children: [
                  kHight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: const TextSpan(
                          // style: DefaultTextStyle.of(cxt).style,
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Good evening\n',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                )),
                            TextSpan(
                              text: 'Hotel Name',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const CircleAvatar(
                          radius: 24, backgroundColor: Colors.white)
                    ],
                  ),
                  kHight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: width * .275,
                        height: height * .15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '25',
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.red[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Text("Today's Order")
                          ],
                        ),
                      ),
                      Container(
                        width: width * .55,
                        height: height * .15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '₹11,450.00',
                              style: TextStyle(
                                fontSize: 36,
                                color: Colors.red[700],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/icons/revenue.png',
                                    height: 18),
                                const Text("Today's revenue")
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            kHight10,
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SectionHead(heading: 'Recent orders'),
                      Text('View All')
                    ],
                  ),
                  kHight20,
                  Column(
                    children: List.generate(2, (index) {
                      return Column(
                        children: [
                          ListTile(
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 8),
                            title: Text('Order id: 12345566'),
                            subtitle: Text('Customer name: Nizam'),
                            trailing: const Icon(
                                CupertinoIcons.chevron_right_circle_fill),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: Colors.green, width: 1),
                            ),
                          ),
                          kHight10
                        ],
                      );
                    }),
                  ),
                  kHight10,
                  divider2,
                  kHight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHead(heading: 'Categories'),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ScreenAllCategories(),
                              ),
                            );
                          },
                          child: const Text('View All'))
                    ],
                  ),
                  CategoriesGridview(height: height, width: width),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingButton(),
    );
  }
}
