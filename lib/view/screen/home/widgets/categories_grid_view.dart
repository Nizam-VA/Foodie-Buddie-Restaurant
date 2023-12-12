import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodiebuddierestaurant/controller/blocs/category/category_bloc.dart';
import 'package:foodiebuddierestaurant/view/screen/category/screen_category.dart';

class CategoriesGridview extends StatelessWidget {
  CategoriesGridview({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    context.read<CategoryBloc>().add(CategoryEvent());
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        return GridView.builder(
          itemCount: 6,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            if (state.categories.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return InkWell(
              onTap: () async {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        ScreenCategory(category: state.categories[index]),
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
                      index < 6 ? state.categories[index].iconUrl : '',
                      height: height * .07,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      index < 6 ? state.categories[index].name : '',
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
    );
  }
}
