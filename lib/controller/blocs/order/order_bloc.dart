import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/controller/api_services/order/api_calls.dart';
import 'package:foodiebuddierestaurant/model/order.dart';
import 'package:foodiebuddierestaurant/model/order_item.dart';
import 'package:foodiebuddierestaurant/model/order_status.dart';
import 'package:foodiebuddierestaurant/view/widgets/functions/snack_bar.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<GetAllOrdersEvent>((event, emit) async {
      final orders = await OrderApiServices().getAllOrders();
      emit(OrderState(orders: orders, orderItems: []));
    });

    on<GetOrderByIdEvent>((event, emit) async {
      final orders = await OrderApiServices().getAllOrders();
      final orderItems = await OrderApiServices().getOrderById(event.orderId);
      emit(OrderState(orders: orders, orderItems: orderItems));
    });

    on<UpdateStatusEvent>((event, emit) async {
      final value =
          await OrderApiServices().updateStatus(event.orderId, event.status);
      if (value) {
        final orders = await OrderApiServices().getAllOrders();
        final orderItems = await OrderApiServices().getOrderById(event.orderId);
        showSnack(event.context, Colors.green, 'Order Status updated.');
        emit(OrderState(orders: orders, orderItems: orderItems));
      } else {
        showSnack(event.context, Colors.red, 'Order Status not updated.');
      }
    });
  }
}
