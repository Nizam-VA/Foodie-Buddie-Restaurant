import 'package:dio/dio.dart';
import 'package:foodiebuddierestaurant/controller/api_services/authentication/api_calls.dart';
import 'package:foodiebuddierestaurant/model/profile.dart';
import 'package:foodiebuddierestaurant/utils/tokens.dart';
import 'package:foodiebuddierestaurant/utils/url.dart';

class ProfileApiServices {
  Dio dio = Dio(BaseOptions(baseUrl: ApiServices.baseUrl));

  Future<Profile?> getSellerProfile() async {
    try {
      final token = await getToken();
      final response = await dio.get(
        ApiEndPoints.getSellerProfile,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
      );
      if (response.statusCode == 200) {
        final body = response.data as Map;
        final result = body['result'];
        final profile = Profile.fromJson(result);
        return profile;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
