import 'package:dio/dio.dart';
import 'package:foodiebuddierestaurant/model/dish.dart';
import 'package:foodiebuddierestaurant/utils/tokens.dart';
import 'package:foodiebuddierestaurant/utils/url.dart';

class DishApiServices {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  Future<bool> addDish(Dish dish) async {
    final bearer = await getToken();
    try {
      final body = FormData.fromMap(dish.toJson(dish));
      final response = await dio.post(
        ApiEndPoints.addDish,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
            'accept': 'application/json',
            'Authorization': 'Bearer $bearer'
          },
        ),
        data: body,
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      print("DioException: ${e.message} is the exception");
      return false;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }

  Future<List<DishModel>> fetchDishesbyCategory(int categoryId) async {
    final bearer = await getToken();
    print(
        '${ApiEndPoints.baseUrl}${ApiEndPoints.getDishesByCategory}$categoryId');
    try {
      final response = await dio.get(
        '${ApiEndPoints.getDishesByCategory}$categoryId',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $bearer',
          },
        ),
      );
      if (response.statusCode == 200) {
        print(response.data);
        final Map<String, dynamic> data = response.data;
        final result = data['dishList'] as List;
        List<DishModel> dishes = [];
        for (int i = 0; i < result.length; i++) {
          final dish = DishModel.fromJson(result[i]);
          dishes.add(dish);
        }
        return dishes;
      } else {
        return [];
      }
    } on DioException catch (e) {
      print(e.toString());
      return [];
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<void> deleteDish(int dishId) async {
    final token = await getToken();
    final response = await dio.delete(
      '${ApiEndPoints.deleteOrUpdateDish}$dishId',
      options: Options(headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }),
    );
    print(response.statusCode);
  }

  Future<bool> updateDish(DishModel dishModel) async {
    try {
      final token = await getToken();
      final response = await dio.put(
        '${ApiEndPoints.deleteOrUpdateDish}${dishModel.dishId}',
        data: dishModel.toJson(dishModel),
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
      return false;
    }
  }
}
