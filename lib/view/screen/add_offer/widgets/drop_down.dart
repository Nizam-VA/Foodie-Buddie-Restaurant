import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/category/category_bloc.dart';

class DropDown extends StatelessWidget {
  DropDown({
    super.key,
  });

  String category = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
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
            category = value!.name;
            print(category);
          },
        );
      },
    );
  }
}
