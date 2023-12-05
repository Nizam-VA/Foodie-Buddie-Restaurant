import 'package:dio/dio.dart';
import 'package:foodiebuddierestaurant/model/order.dart';
import 'package:foodiebuddierestaurant/model/order_item.dart';
import 'package:foodiebuddierestaurant/model/order_status.dart';
import 'package:foodiebuddierestaurant/utils/tokens.dart';
import 'package:foodiebuddierestaurant/utils/url.dart';

class OrderApiServices {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  Future<List<Order>> getAllOrders() async {
    final token = await getToken();
    try {
      final response = await dio.get(
        ApiEndPoints.getAllOrders,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        final body = response.data as Map;
        final result = body['orders'] as List;
        List<Order> orders = [];
        for (int i = 0; i < result.length; i++) {
          final order = Order.fromJson(result[i]);
          orders.add(order);
        }
        return orders;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List<OrderItem>> getOrderById(int orderId) async {
    final token = await getToken();
    try {
      final response = await dio.get(
        '${ApiEndPoints.getOrderById}$orderId',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        final body = response.data as Map;
        final result = body['orderItems'] as List;
        List<OrderItem> orderItems = [];
        for (int i = 0; i < result.length; i++) {
          final orderItem = OrderItem.fromJson(result[i]);
          orderItems.add(orderItem);
        }
        return orderItems;
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<bool> updateStatus(int orderId, OrderStatus status) async {
    try {
      final token = await getToken();
      final data = status.toJson(status);
      final response = await dio.patch(
        '/seller/orders/$orderId',
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': token,
          },
        ),
        data: data,
      );

      if (response.statusCode == 500) {
        print('Internal Server Error: ${response.data}');
        return false;
      } else if (response.statusCode == 200) {
        print('Response Data: ${response.data}');
        return true;
      } else {
        print('Error Response Data: ${response.data}');
        return false;
      }
    } catch (e) {
      print('Error occurred: $e');
      return false;
    }
  }
}
