part of 'category_bloc.dart';

class CategoryState {
  List<Category> categories;
  bool isLoading;
  CategoryState({required this.categories, this.isLoading = false});
}

final class CategoryInitial extends CategoryState {
  CategoryInitial() : super(categories: [], isLoading: true);
}
