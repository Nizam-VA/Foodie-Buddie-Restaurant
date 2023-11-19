import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodiebuddierestaurant/controller/api_services/dish/api_calls.dart';
import 'package:foodiebuddierestaurant/controller/blocs/category/category_bloc.dart';
import 'package:foodiebuddierestaurant/view/screen/category/screen_category.dart';
import 'package:foodiebuddierestaurant/view/widgets/app_bar.dart';
import 'package:foodiebuddierestaurant/view/widgets/floating_button.dart';

class ScreenAllCategories extends StatelessWidget {
  const ScreenAllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<CategoryBloc>().add(CategoryEvent());
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: AppBarWidget(title: 'All Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            return GridView.builder(
              itemCount: state.categories.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                print(state.categories[index].iconUrl);
                return InkWell(
                  onTap: () async {
                    await DishApiServices()
                        .fetchDishesbyCategory(state.categories[index].id);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ScreenCategory(category: state.categories[index]),
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    margin:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.network(
                          state.categories[index].iconUrl,
                          height: height * .07,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          state.categories[index].name,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButton: const FloatingButton(),
    );
  }
}
