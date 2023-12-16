import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/category/category_bloc.dart';
import 'package:foodiebuddierestaurant/view/screen/add_dish/screen_add_dish.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ScreenAddDishes(
                  categories: state.categories,
                  operation: Operation.add,
                ),
              ),
            );
          },
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add, size: 18, color: Colors.white),
              Text(
                'Add Dish',
                style: TextStyle(fontSize: 8, color: Colors.white),
              )
            ],
          ),
        );
      },
    );
  }
}
