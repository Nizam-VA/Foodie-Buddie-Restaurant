import 'package:bloc/bloc.dart';
import 'package:foodiebuddierestaurant/controller/api_services/order/api_calls.dart';
import 'package:foodiebuddierestaurant/model/order.dart';
import 'package:foodiebuddierestaurant/model/order_item.dart';
import 'package:foodiebuddierestaurant/model/order_status.dart';

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
      final orders = await OrderApiServices().getAllOrders();
      final orderItems = await OrderApiServices().getOrderById(event.orderId);
      emit(OrderState(orders: orders, orderItems: orderItems));
    });
  }
}
