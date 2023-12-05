part of 'dish_bloc.dart';

class DishEvent {}

class AddVegEvent extends DishEvent {
  bool isVeg;
  AddVegEvent({required this.isVeg});
}

class AddAvailableEvent extends DishEvent {
  bool isAvailable;
  AddAvailableEvent({required this.isAvailable});
}

class AddCategoryEvent extends DishEvent {
  int categoryId;
  AddCategoryEvent({required this.categoryId});
}

class AddNewDishEvent extends DishEvent {
  final Dish dish;
  final BuildContext context;
  AddNewDishEvent({required this.dish, required this.context});
}

class GetDishesByCategoryEvent extends DishEvent {
  final int categoryId;
  GetDishesByCategoryEvent({required this.categoryId});
}

class UpdateDishEvent extends DishEvent {
  final DishModel dishModel;
  final BuildContext context;
  UpdateDishEvent({required this.dishModel, required this.context});
}
