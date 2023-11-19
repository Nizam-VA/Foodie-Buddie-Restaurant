import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/model/category.dart';
import 'package:foodiebuddierestaurant/utils/constants.dart';
import 'package:foodiebuddierestaurant/view/screen/profile/screen_profile.dart';
import 'package:foodiebuddierestaurant/view/widgets/app_bar.dart';
import 'package:foodiebuddierestaurant/view/widgets/button_widget.dart';
import 'package:foodiebuddierestaurant/view/widgets/drop_down.dart';
import 'package:foodiebuddierestaurant/view/widgets/text_field_widget.dart';

class ScreenAddOffer extends StatelessWidget {
  ScreenAddOffer({super.key});

  final offerController = TextEditingController();
  final offerPerController = TextEditingController();
  final List<Category> categories = [];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(title: 'Add New Offer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            TextFieldWidget(
              userController: offerController,
              label: 'Offer name: ',
              inputType: TextInputType.name,
              obscureText: false,
              validator: (value) {
                if (value!.isEmpty) return '';
              },
            ),
            kHight10,
            DropDownWidget(categories: categories, title: 'Category'),
            kHight10,
            TextFieldWidget(
              userController: offerPerController,
              label: 'Offer percentage: ',
              inputType: TextInputType.number,
              obscureText: false,
              validator: (value) {
                if (value!.isEmpty) return '';
              },
            ),
            kHight10,
            ButtonWidget(
              width: width,
              text: 'Add Offer',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ScreenProfile(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
