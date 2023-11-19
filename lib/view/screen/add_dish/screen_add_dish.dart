import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/dish/dish_bloc.dart';
import 'package:foodiebuddierestaurant/model/category.dart';
import 'package:foodiebuddierestaurant/model/dish.dart';
import 'package:foodiebuddierestaurant/utils/constants.dart';
import 'package:foodiebuddierestaurant/view/screen/add_dish/functions/pick_image.dart';
import 'package:foodiebuddierestaurant/view/widgets/app_bar.dart';
import 'package:foodiebuddierestaurant/view/widgets/button_widget.dart';
import 'package:foodiebuddierestaurant/view/widgets/drop_down.dart';
import 'package:foodiebuddierestaurant/view/widgets/functions/snack_bar.dart';
import 'package:foodiebuddierestaurant/view/widgets/text_field_widget.dart';
import 'package:image_picker/image_picker.dart';

class ScreenAddDishes extends StatelessWidget {
  ScreenAddDishes({super.key, required this.categories});

  final formKey = GlobalKey<FormState>();
  final dishController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();
  final quantityController = TextEditingController();
  bool isVeg = false;
  bool isAvailable = false;
  int categoryId = 0;
  final List<Category> categories;
  XFile? imagePath;
  String image = '';
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(title: 'Add New Dish'),
      ),
      body: BlocBuilder<DishBloc, DishState>(
        builder: (context, state) {
          if (state is AddNewDishState) {}
          return state is AddNewDishState && state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add_a_photo, size: 30),
                                          Text('Add Image')
                                        ],
                                      )),
                          ),
                          kHight10,
                          TextFieldWidget(
                            userController: dishController,
                            label: 'Dish Name: ',
                            inputType: TextInputType.name,
                            obscureText: false,
                            validator: (value) {
                              if (value!.isEmpty) return 'Enter the dish name';
                            },
                          ),
                          kHight10,
                          TextFieldWidget(
                            userController: descriptionController,
                            label: 'Description: ',
                            inputType: TextInputType.name,
                            obscureText: false,
                            validator: (value) {
                              if (value!.isEmpty)
                                return 'Enter the description';
                            },
                          ),
                          kHight10,
                          TextFieldWidget(
                            userController: priceController,
                            label: 'Price: ',
                            inputType: TextInputType.name,
                            obscureText: false,
                            validator: (value) {
                              if (value!.isEmpty) return 'Enter the price';
                            },
                          ),
                          kHight10,
                          TextFieldWidget(
                            userController: quantityController,
                            label: 'Quantity: ',
                            inputType: TextInputType.name,
                            obscureText: false,
                            validator: (value) {
                              if (value!.isEmpty) return 'Enter the quantity';
                            },
                          ),
                          kHight10,
                          BlocBuilder<DishBloc, DishState>(
                            buildWhen: (previous, current) =>
                                current is AddCategoryState,
                            builder: (context, state) {
                              categoryId = state is AddCategoryState
                                  ? state.categoryId
                                  : 0;
                              print(categoryId);
                              return DropDownWidget(
                                  categories: categories, title: 'Category');
                            },
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('  Vegetarian: '),
                              BlocBuilder<DishBloc, DishState>(
                                buildWhen: (previous, current) =>
                                    current is AddVegState,
                                builder: (context, state) {
                                  return Switch(
                                    value: state is AddVegState
                                        ? state.isVeg
                                        : false,
                                    onChanged: (value) {
                                      context.read<DishBloc>().add(
                                            AddVegEvent(isVeg: value),
                                          );
                                      isVeg = value;
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                          // kHight10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('  Available: '),
                              BlocBuilder<DishBloc, DishState>(
                                buildWhen: (previous, current) =>
                                    current is AddAvailState,
                                builder: (context, state) {
                                  return Switch(
                                    value: state is AddAvailState
                                        ? state.isAvail
                                        : false,
                                    onChanged: (value) {
                                      context.read<DishBloc>().add(
                                            AddAvailableEvent(
                                                isAvailable: value),
                                          );
                                      isAvailable = value;
                                      print(isAvailable);
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                          kHight10,
                          ButtonWidget(
                            width: width,
                            text: 'Add dish',
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                if (image == '') {
                                  showSnack(context, Colors.red,
                                      'Image is mandatory');
                                } else {
                                  MultipartFile imageFile =
                                      await MultipartFile.fromFile(image);
                                  Dish dish = Dish(
                                    dishId: 0,
                                    sellerId: 0,
                                    name: dishController.text,
                                    description: descriptionController.text,
                                    price: int.parse(priceController.text),
                                    image: imageFile,
                                    quantity:
                                        int.parse(quantityController.text),
                                    categoryId: categoryId,
                                    isVeg: isVeg,
                                    isAvailable: isAvailable,
                                  );
                                  context.read<DishBloc>().add(AddNewDishEvent(
                                      dish: dish, context: context));
                                }
                                // Navigator.of(context).push(
                                //   MaterialPageRoute(
                                //     builder: (context) => ScreenAddOffer(),
                                //   ),
                                // );
                              }
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
