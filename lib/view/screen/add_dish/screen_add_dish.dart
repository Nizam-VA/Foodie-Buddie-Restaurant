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

enum Operation { add, edit }

class ScreenAddDishes extends StatefulWidget {
  ScreenAddDishes(
      {super.key,
      required this.categories,
      this.dish,
      required this.operation});

  Operation operation;
  DishModel? dish;
  final List<Category> categories;

  @override
  State<ScreenAddDishes> createState() => _ScreenAddDishesState();
}

class _ScreenAddDishesState extends State<ScreenAddDishes> {
  initTextControllers() {
    if (widget.dish != null) {
      dishController.text = widget.dish!.name;
      descriptionController.text = widget.dish!.description;
      priceController.text = widget.dish!.price.toString();
      quantityController.text = widget.dish!.quantity.toString();
      isVeg = widget.dish!.isVeg;
      isAvailable = widget.dish!.isAvailable;
      image = widget.dish!.image!;
    }
  }

  final formKey = GlobalKey<FormState>();

  final dishController = TextEditingController();

  final descriptionController = TextEditingController();

  final priceController = TextEditingController();

  final quantityController = TextEditingController();

  bool isVeg = false;

  bool isAvailable = false;

  int categoryId = 0;

  XFile? imagePath;

  String image = '';

  @override
  void initState() {
    if (widget.operation == Operation.edit) {
      initTextControllers();
      print(widget.dish!.dishId);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarWidget(
            title: widget.operation == Operation.add
                ? 'Add New Dish'
                : 'Update Dish'),
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
                              child: widget.operation == Operation.add
                                  ? image != ''
                                      ? Image.file(File(image))
                                      : const Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(Icons.add_a_photo, size: 30),
                                            Text('Add Image')
                                          ],
                                        )
                                  : image != ''
                                      ? Image.network(image)
                                      : null,
                            ),
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
                              if (value!.isEmpty) {
                                return 'Enter the description';
                              }
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
                              print(widget.dish);
                              categoryId = state is AddCategoryState
                                  ? state.categoryId
                                  : 0;

                              return DropDownWidget(
                                categories: widget.categories,
                                title: 'Category',
                                dish: widget.operation == Operation.add
                                    ? null
                                    : widget.dish,
                                operation: widget.operation,
                              );
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
                                        : isVeg,
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
                                        : isAvailable,
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
                            text: widget.operation == Operation.add
                                ? 'Add dish'
                                : 'Update',
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                if (image == '') {
                                  showSnack(context, Colors.red,
                                      'Image is mandatory');
                                } else {
                                  if (widget.operation == Operation.add) {
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
                                    context.read<DishBloc>().add(
                                        AddNewDishEvent(
                                            dish: dish, context: context));
                                  } else {
                                    DishModel dishModel = DishModel(
                                      dishId: widget.dish!.dishId,
                                      sellerId: 0,
                                      name: dishController.text,
                                      description: descriptionController.text,
                                      price: int.parse(priceController.text),
                                      image: widget.dish!.image,
                                      quantity:
                                          int.parse(quantityController.text),
                                      categoryId: categoryId,
                                      isVeg: widget.dish!.isVeg,
                                      isAvailable: widget.dish!.isAvailable,
                                    );
                                    // await DishApiServices()
                                    //     .updateDish(dishModel);
                                    context.read<DishBloc>().add(
                                        UpdateDishEvent(
                                            dishModel: dishModel,
                                            context: context));
                                  }
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
