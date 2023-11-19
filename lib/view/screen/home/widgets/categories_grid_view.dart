import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodiebuddierestaurant/controller/blocs/category/category_bloc.dart';

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
    return SizedBox(
      height: height * .35,
      child: Expanded(
        child: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
            return GridView.builder(
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3),
              itemBuilder: (context, index) {
                print(state.categories[index].iconUrl);
                return InkWell(
                  onTap: () {},
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
                          index < 5 ? state.categories[index].iconUrl : '',
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
        ),
      ),
    );
  }
}
