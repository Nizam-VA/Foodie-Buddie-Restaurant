import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/order/order_bloc.dart';
import 'package:foodiebuddierestaurant/utils/constants.dart';
import 'package:foodiebuddierestaurant/utils/text_styles.dart';
import 'package:foodiebuddierestaurant/view/screen/order_details/screen_order_details.dart';
import 'package:intl/intl.dart';

class ScreenOrders extends StatelessWidget {
  const ScreenOrders({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<OrderBloc>().add(GetAllOrdersEvent());
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            centerTitle: true,
            title: const Text(
              'Orders',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
            bottom: TabBar(
              labelColor: Colors.green[900],
              isScrollable: true,
              unselectedLabelColor: Colors.white,
              indicator: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.green, width: 5),
              ),
              tabs: const [
                Tab(text: 'All Orders'),
                Tab(text: "Cooking"),
                Tab(text: "Food Ready"),
                Tab(text: "Delivered"),
              ],
            ),
          ),
          body: TabBarView(children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  return state.orders.isEmpty
                      ? Center(
                          child: Image.asset('assets/images/icons/empty.gif'))
                      : ListView.builder(
                          itemCount: state.orders.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ScreenOrderDetails(
                                      order: state.orders[index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: width,
                                // height: height * .25,
                                padding: const EdgeInsets.all(18),
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.green),
                                ),
                                child: Column(
                                  children: [
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Order Id: '),
                                        Text(
                                          state.orders[index].orderId
                                              .toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: boldGreen,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Order on: '),
                                        Text(
                                          DateFormat("d MMM yyyy").format(
                                            DateTime.parse(state
                                                .orders[index].deliveryDate),
                                          ),
                                          style: semiBoldGreen,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Total Amount: '),
                                        Text(
                                          '₹ ${state.orders[index].totalPrice - state.orders[index].deliveryCharge}',
                                          style: semiBoldGreen,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Item count: '),
                                        Text(
                                          state.orders[index].itemCount
                                              .toString(),
                                          style: semiBoldGreen,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Delivery Status: '),
                                        Text(
                                          state.orders[index].orderStatus,
                                          style: semiBoldGreen,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  final orders = state.orders
                      .where((element) =>
                          element.orderStatus.toLowerCase() == 'cooking')
                      .toList();
                  return orders.isEmpty
                      ? Center(
                          child: Image.asset('assets/images/icons/empty.gif'))
                      : ListView.builder(
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ScreenOrderDetails(
                                      order: orders[index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: width,
                                // height: height * .25,
                                padding: const EdgeInsets.all(18),
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.green),
                                ),
                                child: Column(
                                  children: [
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Order Id: '),
                                        Text(
                                          orders[index].orderId.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Order on: '),
                                        Text(
                                          DateFormat("d MMM yyyy").format(
                                            DateTime.parse(
                                                orders[index].deliveryDate),
                                          ),
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Total Amount: '),
                                        Text(
                                          '₹ ${state.orders[index].totalPrice - state.orders[index].deliveryCharge}',
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Item count: '),
                                        Text(
                                          orders[index].itemCount.toString(),
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Delivery Status: '),
                                        Text(
                                          orders[index].orderStatus,
                                          style: orders[index].orderStatus ==
                                                      'COOKING' ||
                                                  orders[index].orderStatus ==
                                                      'FOOD READY'
                                              ? semiBoldBlack
                                              : semiBoldGreen,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  final orders = state.orders
                      .where((element) =>
                          element.orderStatus.toLowerCase() == 'food ready')
                      .toList();
                  return orders.isEmpty
                      ? Center(
                          child: Image.asset('assets/images/icons/empty.gif'))
                      : ListView.builder(
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ScreenOrderDetails(
                                      order: orders[index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: width,
                                // height: height * .25,
                                padding: const EdgeInsets.all(18),
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.green),
                                ),
                                child: Column(
                                  children: [
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Order Id: '),
                                        Text(
                                          orders[index].orderId.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Order on: '),
                                        Text(
                                          DateFormat("d MMM yyyy").format(
                                            DateTime.parse(
                                                orders[index].deliveryDate),
                                          ),
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Total Amount: '),
                                        Text(
                                          '₹ ${state.orders[index].totalPrice - state.orders[index].deliveryCharge}',
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Item count: '),
                                        Text(
                                          orders[index].itemCount.toString(),
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Delivery Status: '),
                                        Text(
                                          orders[index].orderStatus,
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  final orders = state.orders
                      .where((element) =>
                          element.orderStatus.toLowerCase() == 'delivered')
                      .toList();
                  return orders.isEmpty
                      ? Center(
                          child: Image.asset('assets/images/icons/empty.gif'))
                      : ListView.builder(
                          itemCount: orders.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ScreenOrderDetails(
                                      order: orders[index],
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: width,
                                // height: height * .25,
                                padding: const EdgeInsets.all(18),
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(color: Colors.green),
                                ),
                                child: Column(
                                  children: [
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Order Id: '),
                                        Text(
                                          orders[index].orderId.toString(),
                                          overflow: TextOverflow.ellipsis,
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Order on: '),
                                        Text(
                                          DateFormat("d MMM yyyy").format(
                                            DateTime.parse(
                                                orders[index].deliveryDate),
                                          ),
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Total Amount: '),
                                        Text(
                                          '₹ ${state.orders[index].totalPrice - state.orders[index].deliveryCharge}',
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Item count: '),
                                        Text(
                                          orders[index].itemCount.toString(),
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text('Delivery Status: '),
                                        Text(
                                          orders[index].orderStatus,
                                          style: semiBoldBlack,
                                        ),
                                      ],
                                    ),
                                    kHight10,
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                },
              ),
            )
          ])),
    );
  }
}
