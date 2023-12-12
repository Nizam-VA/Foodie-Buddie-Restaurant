import 'package:dio/dio.dart';
import 'package:foodiebuddierestaurant/model/sales_report.dart';
import 'package:foodiebuddierestaurant/utils/tokens.dart';
import 'package:foodiebuddierestaurant/utils/url.dart';

class SalesApiServices {
  Dio dio = Dio(BaseOptions(baseUrl: ApiEndPoints.baseUrl));

  Future<SalesReport?> getSalesReport() async {
    try {
      final token = await getToken();
      final response = await dio.get(
        ApiEndPoints.dailyStatus,
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
        final result = body['result'] as Map<String, dynamic>;
        final salesReport = SalesReport.fromJson(result);
        return salesReport;
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
