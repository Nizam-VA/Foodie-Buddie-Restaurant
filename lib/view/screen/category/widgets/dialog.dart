import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddierestaurant/controller/api_services/dish/api_calls.dart';
import 'package:foodiebuddierestaurant/controller/blocs/dish/dish_bloc.dart';
import 'package:foodiebuddierestaurant/model/category.dart';
import 'package:foodiebuddierestaurant/model/dish.dart';

showDialogBox(BuildContext context, DishModel dish, Category category) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Delete'),
          content: const Text('Are you sure to delete?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () async {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () async {
                await DishApiServices().deleteDish(dish.dishId).then(
                      (value) => context.read<DishBloc>().add(
                            GetDishesByCategoryEvent(
                              categoryId: category.id,
                            ),
                          ),
                    );
                Navigator.pop(context);
              },
            ),
          ],
        );
      });
}
