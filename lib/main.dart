import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/category/category_bloc.dart';
import 'package:foodiebuddierestaurant/controller/blocs/dish/dish_bloc.dart';
import 'package:foodiebuddierestaurant/view/screen/on_boarding/screen_onboarding.dart';

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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: ScreenOnboard(),
      ),
    );
  }
}
