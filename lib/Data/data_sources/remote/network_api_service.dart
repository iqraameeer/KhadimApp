import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'dart:io';
import '../../../Utils/Extensions/Helper/get_storage._helper.dart';
import 'api_constant.dart';
import 'api_error_handling.dart';
import 'api_exception.dart';
import 'base_api_service.dart';
import 'package:dio/dio.dart';

class NetworkApiService implements BaseApiServices {
  late Dio dio;
  late BaseOptions baseOptions;

  NetworkApiService() {
    baseOptions = BaseOptions(
      baseUrl: ApiConstants.baseUrl,
    );
    dio = Dio(baseOptions);
  }

  @override
  Future GetResponse(
      {required String url,
        bool isTokenRequired = true,
        Map<String, dynamic>? data,
        Map<String, dynamic>? queryParameter}) async {
    try {
      var token;
      if (isTokenRequired) {
        token = await getToken();
        debugPrint("GetResponseToken ==> $token");
      }
      var response = await dio
          .get(
        url,
        data: data,
        queryParameters: queryParameter,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      )
          .timeout(const Duration(seconds: 20));
      debugPrint("==================API RESPONSE==================");
      debugPrint(response.statusCode.toString());
      debugPrint(response.data.toString());
      return response.data;
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw NoInternetException('Network Request time out');
    } on DioException catch (e) {
      errorHandling(e);
    }
  }

  // Future GetResponse(
  //     {required String url,
  //       bool isTokenRequired = true,
  //       Map<String, dynamic>? data,
  //       Map<String, dynamic>? queryParameter}) async {
  //   try {
  //     var token;
  //     if (isTokenRequired) {
  //       token = await getToken();
  //       debugPrint("GetResponseToken ==> $token");
  //     }
  //     debugPrint("Request URL: ${baseOptions.baseUrl}$url");
  //     debugPrint("Query Parameters: $queryParameter");
  //     var response = await dio
  //         .get(
  //       url,
  //       data: data,
  //       queryParameters: queryParameter,
  //       options: Options(
  //         headers: {"Authorization": "Bearer $token"},
  //       ),
  //     )
  //         .timeout(const Duration(seconds: 20));
  //     debugPrint("==================API RESPONSE==================");
  //     debugPrint("Status Code: ${response.statusCode}");
  //     debugPrint("Response Data: ${response.data}");
  //     return response.data;
  //   } on SocketException {
  //     debugPrint("❌ SocketException: No Internet Connection");
  //     return {"success": false, "message": "No Internet Connection"};
  //   } on TimeoutException {
  //     debugPrint("❌ TimeoutException: Network Request time out");
  //     return {"success": false, "message": "Network Request time out"};
  //   } on DioException catch (e) {
  //     debugPrint("❌ DioException: ${e.message}");
  //     debugPrint("Response Data: ${e.response?.data}");
  //     debugPrint("Status Code: ${e.response?.statusCode}");
  //     return e.response?.data ?? {"success": false, "message": "Unknown error"};
  //   }
  // }

  @override
  Future PostResponse(
      {required String url,
        required Map<String, dynamic> data,
        bool isTokenRequired = true}) async {
    try {
      var token;
      if (isTokenRequired) {
        token = await getToken();
        debugPrint("user token: $token");
      }
      print('$url');

      var response = await dio
          .post(
        url,
        data: data,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      )
          .timeout(const Duration(seconds: 20));
      print('$url');

      // print('$response');
      return response.data;
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw NoInternetException('Network Request time out');
    } on DioException catch (e) {
      errorHandling(e);
    }
  }

  @override
  Future PostFormResponse(
      {required String url,
        required FormData data,
        bool isTokenRequired = true}) async {
    try {
      var token;
      if (isTokenRequired) {
        token = await getToken();
      }

      var response = await dio
          .post(
        url,
        data: data,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      )
          .timeout(const Duration(seconds: 20));
      print("***${response.statusCode}***");
      print("***${response.data}***");
      return response.data;
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw NoInternetException('Network Request time out');
    } on DioException catch (e) {
      errorHandling(e);
    }
  }

  @override
  Future PutResponse(
      {required String url,
        required dynamic data,
        bool isTokenRequired = true}) async {
    try {
      var token;
      if (isTokenRequired) {
        token = await getToken();
      }
      // debugPrint("user token: $token");
      // debugPrint("==================API REQUEST==================");
      // debugPrint("Request URL: ${baseOptions.baseUrl + url}");
      var response = await dio
          .put(
        url,
        data: data,
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      )
          .timeout(const Duration(seconds: 20));
      return response.data;
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw NoInternetException('Network Request time out');
    } on DioException catch (e) {
      errorHandling(e);
    }
  }


  Future<dynamic> PostFormUrlEncodedResponse({
    required String url,
    required Map<String, dynamic> data,
    bool isTokenRequired = true,
    String? baseUrlOverride,
  }) async {
    try {
      String? token;
      if (isTokenRequired) {
        token = await getToken();
      }

      final String fullUrl = baseUrlOverride != null
          ? baseUrlOverride + url
          : baseOptions.baseUrl + url;

      debugPrint("Login URL: $fullUrl");
      debugPrint("Login Data: $data");

      // Basic Auth: client_id:client_secret → base64 encode
      const String clientId = 'SSMS.portal.ro';
      const String clientSecret = 'secret';
      final String basicAuth = 'Basic ${base64Encode(utf8.encode('$clientId:$clientSecret'))}';

      final response = await dio.post(
        fullUrl,
        data: data,
        options: Options(
          headers: {
            "Authorization": basicAuth,  // Yeh main cheez thi!
            "Content-Type": "application/x-www-form-urlencoded",
            "X-ApiKey": "0L0zgzUYB2S4nSN8f3A0W5YFITpMSKQx",  // Curl se copy kiya
            if (token != null && token.isNotEmpty)
              "Authorization-Token": "Bearer $token", // agar future mein token bhejna pade
          },
          validateStatus: (status) => status! < 500,
        ),
      ).timeout(const Duration(seconds: 30));

      debugPrint("Status Code: ${response.statusCode}");
      debugPrint("Response Body: ${response.data}");

      if (response.statusCode == 200) {
        if (response.data is Map<String, dynamic>) {
          return response.data;
        } else if (response.data is String && response.data.trim().isNotEmpty) {
          try {
            return jsonDecode(response.data);
          } catch (e) {
            throw Exception("Invalid JSON response");
          }
        }
        throw Exception("Empty response");
      } else {
        String errorMsg = "Login failed";
        if (response.data is Map<String, dynamic>) {
          errorMsg = response.data['error_description'] ??
              response.data['error'] ??
              errorMsg;
        } else if (response.data is String) {
          errorMsg = response.data.toString().trim();
        }
        throw Exception("$errorMsg (HTTP ${response.statusCode})");
      }
    } on DioException catch (e) {
      String msg = "Network error";
      if (e.response != null) {
        msg = "${e.response?.statusCode}: ${e.response?.data ?? e.message}";
      }
      throw Exception(msg);
    } on SocketException {
      throw NoInternetException('No Internet Connection');
    } on TimeoutException {
      throw NoInternetException('Request timeout');
    }
  }
}
