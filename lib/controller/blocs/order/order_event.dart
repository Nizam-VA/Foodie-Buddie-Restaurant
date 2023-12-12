part of 'order_bloc.dart';

class OrderEvent {}

class GetAllOrdersEvent extends OrderEvent {}

class GetOrderByIdEvent extends OrderEvent {
  final int orderId;
  GetOrderByIdEvent({required this.orderId});
}

class UpdateStatusEvent extends OrderEvent {
  final int orderId;
  final OrderStatus status;
  final BuildContext context;
  UpdateStatusEvent(
      {required this.orderId, required this.status, required this.context});
}
