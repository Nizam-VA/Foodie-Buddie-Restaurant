part of 'order_bloc.dart';

class OrderState {
  final List<Order> orders;
  final List<OrderItem> orderItems;
  OrderState({required this.orders, required this.orderItems});
}

final class OrderInitial extends OrderState {
  OrderInitial() : super(orders: [], orderItems: []);
}
