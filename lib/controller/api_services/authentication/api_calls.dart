import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:foodiebuddierestaurant/model/restaurant.dart';
import 'package:foodiebuddierestaurant/utils/tokens.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  static const String baseUrl =
      'http://ec2-51-21-2-21.eu-north-1.compute.amazonaws.com';

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
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setBool('LOGIN', true);
        final body = jsonDecode(response.body) as Map;
        saveToken(body['token']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      const url = '$baseUrl/seller/login';
      final data = {
        "email": email,
        "password": password,
      };
      final response = await http.post(
        Uri.parse(url),
        body: data,
      );
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        SharedPreferences preferences = await SharedPreferences.getInstance();
        preferences.setBool('LOGIN', true);
        final body = jsonDecode(response.body) as Map;
        saveToken(body['token']);
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
