import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/category/category_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/dish/dish_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/offer/offer_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/order/order_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/sales_report/sales_report_bloc.dart';
import 'package:foodiebuddierestaurant/view/screen/splash/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryBloc()),
        BlocProvider(create: (context) => DishBloc()),
        BlocProvider(create: (context) => BottomNavigationBloc()),
        BlocProvider(create: (context) => OfferBloc()),
        BlocProvider(create: (context) => OrderBloc()),
        BlocProvider(create: (context) => SalesReportBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const ScreenSplash(),
      ),
    );
  }
}
