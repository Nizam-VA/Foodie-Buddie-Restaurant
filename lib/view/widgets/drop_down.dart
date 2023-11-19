import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddierestaurant/controller/api_services/categories/api_calls.dart';
import 'package:foodiebuddierestaurant/controller/blocs/dish/dish_bloc.dart';
import 'package:foodiebuddierestaurant/model/category.dart';

class DropDownWidget extends StatelessWidget {
  DropDownWidget({super.key, required this.categories, required this.title});

  final List<Category> categories;
  final List<String> categoryList = [];
  final List<int> categoryId = [];
  final String title;
  String category = '';

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < categories.length; i++) {
      categoryList.add(categories[i].name);
      categoryId.add(categories[i].id);
    }

    return DropdownButtonFormField(
      validator: (value) {
        if (value == null) return 'Choose category';
      },
      decoration: InputDecoration(
        label: Text(title),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      items: categoryList.map((category) {
        return DropdownMenuItem(
          value: category,
          child: Text(category),
        );
      }).toList(),
      onChanged: (value) async {
        category = value.toString();
        await CategoriesApiServices().fetchAllCategories();
        int index = categoryList.indexOf(category);

        context.read<DishBloc>().add(
              AddCategoryEvent(
                categoryId: categoryId[index],
              ),
            );
      },
    );
  }
}
