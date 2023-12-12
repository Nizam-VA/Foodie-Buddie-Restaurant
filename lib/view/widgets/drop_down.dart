import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/dish/dish_bloc.dart';
import 'package:foodiebuddierestaurant/model/category.dart';
import 'package:foodiebuddierestaurant/model/dish.dart';
import 'package:foodiebuddierestaurant/view/screen/add_dish/screen_add_dish.dart';

class DropDownWidget extends StatelessWidget {
  DropDownWidget({
    super.key,
    required this.categories,
    required this.title,
    this.dish,
    required this.operation,
  });

  final List<Category> categories;
  final String title;
  String category = '';
  DishModel? dish;
  Operation operation;

  @override
  Widget build(BuildContext context) {
    category = dish != null
        ? categories
            .firstWhere((element) => element.id == dish!.categoryId)
            .name
        : '';
    return DropdownButtonFormField(
      validator: (value) {
        if (value == null) return 'Choose category';
      },
      decoration: InputDecoration(
        label: Text(dish != null ? category : title),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      items: categories.map((cat) {
        print(categories.length);
        return DropdownMenuItem(
          value: cat,
          child: Text(cat.name),
        );
      }).toList(),
      onChanged: (value) async {
        category = value?.name ?? 'Biriyani';
        // print(value!.name);
        context.read<DishBloc>().add(
              AddCategoryEvent(
                categoryId: value!.id,
              ),
            );
      },
    );
  }
}
