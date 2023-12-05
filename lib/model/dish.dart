import 'package:dio/dio.dart';

class Dish {
  final int dishId;
  final int sellerId;
  final String name;
  final String description;
  final int price;
  final MultipartFile image;
  final int quantity;
  final int categoryId;
  final bool isVeg;
  final bool isAvailable;

  Dish({
    required this.dishId,
    required this.sellerId,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.quantity,
    required this.categoryId,
    required this.isVeg,
    required this.isAvailable,
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      dishId: json['dishId'],
      sellerId: json['sellerId'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['image'],
      quantity: json['quantity'],
      categoryId: json['categoryId'],
      isVeg: json['isVeg'],
      isAvailable: json['isAvailable'],
    );
  }

  Map<String, dynamic> toJson(Dish dish) {
    final Map<String, dynamic> data = {
      'name': dish.name,
      'description': dish.description,
      'price': dish.price,
      'image': dish.image,
      'quantity': dish.quantity,
      'categoryId': dish.categoryId,
      'isVeg': dish.isVeg,
      'isAvailable': dish.isAvailable,
    };

    return data;
  }
}

class DishModel {
  final int dishId;
  final int sellerId;
  final String name;
  final String description;
  final int price;
  final String? image;
  final int quantity;
  final int categoryId;
  final bool isVeg;
  final bool isAvailable;

  DishModel({
    required this.dishId,
    required this.sellerId,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.quantity,
    required this.categoryId,
    required this.isVeg,
    required this.isAvailable,
  });

  factory DishModel.fromJson(Map<String, dynamic> json) {
    return DishModel(
      dishId: json['dishId'],
      sellerId: json['sellerId'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json['imageUrl'],
      quantity: json['quantity'],
      categoryId: json['categoryId'],
      isVeg: json['isVeg'],
      isAvailable: json['isAvailable'],
    );
  }

  Map<String, dynamic> toJson(DishModel dish) {
    final Map<String, dynamic> data = {
      'name': dish.name,
      'description': dish.description,
      'price': dish.price,
      'image': dish.image,
      'quantity': dish.quantity,
      'categoryId': dish.categoryId,
      'isVeg': dish.isVeg,
      'isAvailable': dish.isAvailable,
    };

    return data;
  }
}
