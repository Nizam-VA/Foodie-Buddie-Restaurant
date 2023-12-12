import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/controller/api_services/dish/api_calls.dart';
import 'package:foodiebuddierestaurant/model/dish.dart';
import 'package:foodiebuddierestaurant/view/screen/main/screen_main.dart';
import 'package:foodiebuddierestaurant/view/widgets/functions/snack_bar.dart';

part 'dish_event.dart';
part 'dish_state.dart';

class DishBloc extends Bloc<DishEvent, DishState> {
  DishBloc() : super(DishInitial()) {
    on<AddVegEvent>((event, emit) {
      bool value = event.isVeg;
      emit(AddVegState(isVeg: value));
    });
    on<AddAvailableEvent>((event, emit) {
      bool value = event.isAvailable;
      emit(AddAvailState(isAvail: value));
    });
    on<AddCategoryEvent>((event, emit) {
      int categoryId = event.categoryId;
      emit(AddCategoryState(categoryId: categoryId));
    });
    on<AddNewDishEvent>((event, emit) async {
      emit(AddNewDishState(isLoading: true));
      final result = await DishApiServices().addDish(event.dish);
      if (result) {
        showSnack(event.context, Colors.green, 'Successfully Inserted.');
        Navigator.of(event.context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => ScreenMain()),
            (route) => false);
      } else {
        showSnack(event.context, Colors.red, 'Invalid entries');
        emit(AddNewDishState(isLoading: false));
      }
    });

    on<GetDishesByCategoryEvent>((event, emit) async {
      List<DishModel> dishes =
          await DishApiServices().fetchDishesbyCategory(event.categoryId);
      emit(GetDishesByCategoryState(dishes: dishes));
    });

    on<UpdateDishEvent>((event, emit) async {
      final result = await DishApiServices().updateDish(event.dishModel);
      if (result) {
        emit(UpdateDishState(isLoading: false));
        showSnack(event.context, Colors.green, 'Updated Successfully .');
        Navigator.pop(event.context);
      } else {
        showSnack(event.context, Colors.red, 'Not updated.');
      }
      List<DishModel> dishes = await DishApiServices()
          .fetchDishesbyCategory(event.dishModel.categoryId);
      emit(GetDishesByCategoryState(dishes: dishes));
    });
  }
}
