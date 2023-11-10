import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/model/restaurant.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static const String baseUrl = 'http://10.0.2.2:8080';

  Future<bool> register(Restaurant restaurant) async {
    const url = '$baseUrl/seller/register';
    final data = {
      "email": restaurant.email,
      "password": restaurant.password,
      "confirmPassword": restaurant.password,
      "name": restaurant.name,
      "description": restaurant.description,
      "pinCode": restaurant.pinCode
    };
    try {
      final response = await http.post(Uri.parse(url), body: data);
      debugPrint('${response.statusCode}');
      if (response.statusCode == 200) {
        // final body = jsonDecode(response.body) as Map;
        // final sharedPreferences = await SharedPreferences.getInstance();
        // sharedPreferences.setString('token', body['token']);
        // print(body['token']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
