import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/order/order_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/profile/profile_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/sales_report/sales_report_bloc.dart';
import 'package:foodiebuddierestaurant/utils/constants.dart';
import 'package:foodiebuddierestaurant/utils/text_styles.dart';
import 'package:foodiebuddierestaurant/view/screen/all_categories/screen_all_categories.dart';
import 'package:foodiebuddierestaurant/view/screen/home/widgets/categories_grid_view.dart';
import 'package:foodiebuddierestaurant/view/screen/oders/screen_orders.dart';
import 'package:foodiebuddierestaurant/view/screen/order_details/screen_order_details.dart';
import 'package:foodiebuddierestaurant/view/widgets/floating_button.dart';
import 'package:foodiebuddierestaurant/view/widgets/section_header.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    context.read<OrderBloc>().add(GetAllOrdersEvent());
    context.read<SalesReportBloc>().add(GetDailySalesReportEvent());
    context.read<ProfileBloc>().add(GetProfileEvent());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              width: width,
              height: height * .375,
              decoration: BoxDecoration(
                color: Colors.green[700],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(48),
                  bottomRight: Radius.circular(48),
                ),
              ),
              child: Column(
                children: [
                  kHight20,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BlocBuilder<ProfileBloc, ProfileState>(
                        builder: (context, state) {
                          return RichText(
                            text: TextSpan(
                              // style: DefaultTextStyle.of(cxt).style,
                              children: <TextSpan>[
                                const TextSpan(
                                    text: '\nHello Welcome\n',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    )),
                                TextSpan(
                                  text: state.profile?.name ?? 'Hotel Name',
                                  style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  kHight20,
                  BlocBuilder<SalesReportBloc, SalesReportState>(
                    builder: (context, state) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: width * .275,
                            height: height * .15,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${state.report?.saleCount}',
                                  style: TextStyle(
                                    fontSize: 36,
                                    color: Colors.red[700],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Text("Today's Order")
                              ],
                            ),
                          ),
                          Container(
                            width: width * .55,
                            height: height * .15,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '₹ ${state.report?.totalSales.round()}.00',
                                  style: TextStyle(
                                    fontSize: 36,
                                    color: Colors.red[700],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/icons/revenue.png',
                                      height: 28,
                                    ),
                                    const Text("Today's revenue")
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
            kHight10,
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHead(heading: 'Recent orders'),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ScreenOrders(),
                            ),
                          );
                        },
                        child: const Text('View All'),
                      )
                    ],
                  ),
                  BlocBuilder<OrderBloc, OrderState>(
                    builder: (context, state) {
                      return state.orders.isEmpty
                          ? const Center(child: CircularProgressIndicator())
                          : Column(
                              children: List.generate(2, (index) {
                                return Column(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ScreenOrderDetails(
                                              order: state.orders[index],
                                            ),
                                          ),
                                        );
                                      },
                                      child: ListTile(
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 8),
                                        title: Text(
                                          'Order id: ${state.orders[index].orderId}',
                                          style: boldBlack,
                                        ),
                                        subtitle: Text(
                                          'Order Amount: ${state.orders[index].totalPrice - state.orders[index].deliveryCharge}',
                                          style: semiBoldBlack,
                                        ),
                                        trailing: const Icon(CupertinoIcons
                                            .chevron_right_circle_fill),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          side: const BorderSide(
                                              color: Colors.green, width: 1),
                                        ),
                                      ),
                                    ),
                                    kHight10
                                  ],
                                );
                              }),
                            );
                    },
                  ),
                  kHight10,
                  divider2,
                  kHight10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SectionHead(heading: 'Categories'),
                      TextButton(
                          onPressed: () async {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ScreenAllCategories(),
                              ),
                            );
                          },
                          child: const Text('View All'))
                    ],
                  ),
                  CategoriesGridview(height: height, width: width),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingButton(),
    );
  }
}
