import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddierestaurant/controller/api_services/offer/api_calls.dart';
import 'package:foodiebuddierestaurant/controller/blocs/category/category_bloc.dart';
import 'package:foodiebuddierestaurant/model/category.dart';
import 'package:foodiebuddierestaurant/model/offer.dart';
import 'package:foodiebuddierestaurant/utils/constants.dart';
import 'package:foodiebuddierestaurant/view/screen/add_offer/functions/pick_image.dart';
import 'package:foodiebuddierestaurant/view/widgets/app_bar.dart';
import 'package:foodiebuddierestaurant/view/widgets/button_widget.dart';
import 'package:foodiebuddierestaurant/view/widgets/functions/snack_bar.dart';
import 'package:foodiebuddierestaurant/view/widgets/text_field_widget.dart';
import 'package:image_picker/image_picker.dart';

enum Operation { add, edit }

class ScreenAddOffer extends StatelessWidget {
  ScreenAddOffer({super.key});

  final formKey = GlobalKey<FormState>();
  final offerController = TextEditingController();
  final offerPerController = TextEditingController();
  final List<Category> categories = [];
  int categoryId = 0;
  XFile? imagePath;
  String image = '';

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(title: 'Add New Offer'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                InkWell(
                  onTap: () async {
                    imagePath = await showBottomSheetWidget(context);
                    if (imagePath != null) {
                      image = imagePath!.path;
                      print(image);
                    }
                  },
                  child: Container(
                      width: width,
                      height: height * .25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(width: .5),
                      ),
                      child: image != ''
                          ? Image.file(File(image))
                          : const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.add_a_photo, size: 30),
                                Text('Add Banner')
                              ],
                            )),
                ),
                kHight10,
                TextFieldWidget(
                  userController: offerController,
                  label: 'Offer name: ',
                  inputType: TextInputType.name,
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) return 'Add offer name';
                  },
                ),
                kHight10,
                BlocBuilder<CategoryBloc, CategoryState>(
                  builder: (context, state) {
                    return DropdownButtonFormField(
                      validator: (value) {
                        if (value == null) return 'Choose category';
                      },
                      decoration: InputDecoration(
                        label: Text(state.categories[0].name),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      items: state.categories.map((cat) {
                        return DropdownMenuItem(
                          value: cat,
                          child: Text(cat.name),
                        );
                      }).toList(),
                      onChanged: (value) async {
                        categoryId = value!.id;
                        print(categoryId);
                      },
                    );
                  },
                ),
                kHight10,
                TextFieldWidget(
                  userController: offerPerController,
                  label: 'Offer percentage: ',
                  inputType: TextInputType.number,
                  obscureText: false,
                  validator: (value) {
                    if (value!.isEmpty) return 'Add offer percentage';
                  },
                ),
                kHight10,
                ButtonWidget(
                  width: width,
                  text: 'Add Offer',
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      if (image == '') {
                        showSnack(context, Colors.red, 'Add Banner');
                      } else {
                        MultipartFile imageFile =
                            await MultipartFile.fromFile(image);
                        final offer = OfferRequest(
                          categoryId: categoryId,
                          offerName: offerController.text,
                          status: 'ACTIVE',
                          percentage: int.parse(offerPerController.text),
                          image: imageFile,
                        );
                        final value = await OfferApiServices().addOffer(offer);
                        if (value) {
                          showSnack(context, Colors.green,
                              'Offer added successfully.');
                          Navigator.pop(context);
                        } else {
                          showSnack(context, Colors.red,
                              'Offer not added successfully.');
                        }
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
