part of 'dish_bloc.dart';

class DishState {}

final class DishInitial extends DishState {}

final class AddVegState extends DishState {
  final bool isVeg;

  AddVegState({required this.isVeg});
}

final class AddAvailState extends DishState {
  final bool isAvail;

  AddAvailState({required this.isAvail});
}

final class AddCategoryState extends DishState {
  final int categoryId;

  AddCategoryState({required this.categoryId});
}

final class AddNewDishState extends DishState {
  final bool isLoading;
  AddNewDishState({required this.isLoading});
}

final class GetDishesByCategoryState extends DishState {
  final List<DishModel> dishes;
  GetDishesByCategoryState({required this.dishes});
}
