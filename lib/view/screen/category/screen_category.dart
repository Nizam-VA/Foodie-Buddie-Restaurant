import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddierestaurant/controller/api_services/dish/api_calls.dart';
import 'package:foodiebuddierestaurant/controller/blocs/category/category_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/dish/dish_bloc.dart';
import 'package:foodiebuddierestaurant/model/category.dart';
import 'package:foodiebuddierestaurant/model/dish.dart';
import 'package:foodiebuddierestaurant/utils/constants.dart';
import 'package:foodiebuddierestaurant/view/screen/add_dish/screen_add_dish.dart';
import 'package:foodiebuddierestaurant/view/screen/dish/screen_dish.dart';
import 'package:foodiebuddierestaurant/view/widgets/app_bar.dart';

class ScreenCategory extends StatelessWidget {
  ScreenCategory({super.key, required this.category});
  final Category category;
  DishModel? dish;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<CategoryBloc>().add(CategoryEvent());
    context
        .read<DishBloc>()
        .add(GetDishesByCategoryEvent(categoryId: category.id));
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBarWidget(title: category.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            kHight10,
            Expanded(
              child: BlocBuilder<DishBloc, DishState>(
                buildWhen: (previous, current) =>
                    current is GetDishesByCategoryState,
                builder: (context, state) {
                  return state is GetDishesByCategoryState &&
                          state.dishes.length == 0
                      ? Center(child: const Text('No dishes available'))
                      : ListView.builder(
                          itemCount: state is GetDishesByCategoryState
                              ? state.dishes.length
                              : 0,
                          itemBuilder: (context, index) {
                            dish = state is GetDishesByCategoryState
                                ? state.dishes[index]
                                : null;
                            print(state is GetDishesByCategoryState
                                ? state.dishes[index].image
                                : '');
                            return Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => ScreenDish(
                                          dish: dish,
                                        ),
                                      ),
                                    );
                                  },
                                  contentPadding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  leading: Container(
                                    width: width * .15,
                                    height: height * .075,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: dish!.image == ''
                                              ? const AssetImage(
                                                      'assets/images/categories/dish.jpg')
                                                  as ImageProvider
                                              : NetworkImage(dish!.image!),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  title: Text(state is GetDishesByCategoryState
                                      ? state.dishes[index].name
                                      : ''),
                                  subtitle: Text(state
                                          is GetDishesByCategoryState
                                      ? '₹ ${state.dishes[index].price.toString()}'
                                      : ''),
                                  trailing: SizedBox(
                                    width: width * .24,
                                    child: BlocBuilder<CategoryBloc,
                                        CategoryState>(
                                      builder: (context, state) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ScreenAddDishes(
                                                      categories:
                                                          state.categories,
                                                      operation: Operation.edit,
                                                      dish: dish,
                                                    ),
                                                  ),
                                                );
                                              },
                                              icon: const Icon(
                                                CupertinoIcons
                                                    .eyedropper_halffull,
                                              ),
                                            ),
                                            IconButton(
                                              onPressed: () async {
                                                await DishApiServices()
                                                    .deleteDish(dish!.dishId)
                                                    .then((value) => context
                                                        .read<DishBloc>()
                                                        .add(
                                                            GetDishesByCategoryEvent(
                                                                categoryId:
                                                                    category
                                                                        .id)));
                                              },
                                              icon: const Icon(
                                                CupertinoIcons.delete,
                                              ),
                                            )
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: const BorderSide(
                                        color: Colors.green, width: 1),
                                  ),
                                ),
                                kHight10,
                              ],
                            );
                          });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
