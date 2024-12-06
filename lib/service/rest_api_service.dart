import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sephora_flutter/service/rest_api_error_hadling/forbidden_error_handling.dart';
import 'package:sephora_flutter/service/rest_error.dart';
import '../constant/constant.dart';
import '../enum/endpoint.dart';
import '../enum/http_method.dart';
import '../enum/log_security.dart';
import '../utils/app_string.dart';
import '../widget/custom_loader.dart';
import '../widget/custom_view_snackbar.dart';
import '../widget/log_util.dart';
import 'connectivity_service.dart';

class RestApiService {
  static final RestApiService _instance = RestApiService();

  bool _isConnected = false;

  static Future<RestApiService> getInstance() async {
    return _instance;
  }

  // Create storage
  final _dio = Dio(BaseOptions(receiveDataWhenStatusError: true));

  Future initialise(ConnectivityService connectivity) async {
    // Add the following line
    if (kDebugMode) {
      _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        compact: false,
      ));

      _dio.interceptors.add(
        RetryInterceptor(
            dio: _dio,
            logPrint: debugPrint,
            // specify log function (optional)
            retries: 3,
            // retry count (optional)
            retryDelays: const [
              Duration(seconds: 1), // wait 1 sec before first retry
              Duration(seconds: 5), // wait 5 sec before second retry
              Duration(seconds: 10), // wait 10 sec before third retry
            ],
            retryEvaluator: (DioException error, int attempt) {
              return error.type == DioExceptionType.connectionTimeout;
            }),
      );
    }

    _isConnected = connectivity.isConnected();

    connectivity.listen((result) {
      _isConnected = result;
    });
  }

  Future<Response> makeRestCall(
      String baseUrl,
      Endpoint endpoint,
      HttpMethod method,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data,
      {CancelToken? cancelToken,
      Map<String, String>? headers}) async {
    return _performCall(baseUrl, endpoint.value(), method, queryParameters,
        data, headers, cancelToken);
  }

  Future<Response> customRestCall(
      String baseUrl,
      String endpoint,
      HttpMethod method,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data,
      {CancelToken? cancelToken,
      Map<String, String>? headers}) async {
    return _performCall(
        baseUrl, endpoint, method, queryParameters, data, headers, cancelToken);
  }

  Future<Response> formMapRestCall(
      String baseUrl, Endpoint endpoint, HttpMethod method, FormData data,
      {CancelToken? cancelToken, Map<String, String>? headers}) async {
    return _performCall(
        baseUrl, endpoint.value(), method, null, null, headers, cancelToken,
        formData: data);
  }

  Future<Response> downloadFileRestCall(String baseUrl, String endpoint,
      HttpMethod method, ResponseType responseType,
      {Map<String, String>? headers}) async {
    return _performCall(baseUrl, endpoint, method, null, null, headers, null,
        formData: null, responseType: responseType);
  }

  Future<Response> _performCall(
      String baseUrl,
      String endpoint,
      HttpMethod method,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? data,
      Map<String, String>? headers,
      CancelToken? cancelToken,
      {FormData? formData,
      ResponseType? responseType}) async {
    if (!_isConnected) throw RestError(message: AppString.noInternet);

    try {
      Response response;
      var url = baseUrl + endpoint;

      switch (method) {
        case HttpMethod.Post:
          if (formData == null) {
            response = await _dio.post(url,
                data: data,
                options: Options(headers: headers, responseType: responseType),
                queryParameters: queryParameters,
                cancelToken: cancelToken);
          } else {
            response = await _dio.post(url,
                data: formData, options: Options(headers: headers));
          }
          break;
        case HttpMethod.Put:
          response = await _dio.put(url,
              data: data,
              options: Options(headers: headers),
              queryParameters: queryParameters,
              cancelToken: cancelToken);
          break;
        case HttpMethod.Get:
          response = await _dio.get(url,
              options: Options(headers: headers),
              queryParameters: queryParameters,
              cancelToken: cancelToken);
          break;
        case HttpMethod.Delete:
          response = await _dio.delete(url,
              options: Options(headers: headers),
              queryParameters: queryParameters,
              cancelToken: cancelToken);
          break;
        case HttpMethod.Patch:
          response = await _dio.patch(url,
              data: jsonEncode(data),
              options: Options(headers: headers),
              queryParameters: queryParameters,
              cancelToken: cancelToken);
          break;
      }

      if (response.statusCode == HttpStatus.internalServerError) {
        RestError restError = RestError(
          message: AppString.somethingWentWrong,
          statusCode: response.statusCode,
        );
        ForbiddenErrorHandling.handle(restError);
        return response;
      } else {
        return response;
      }
    } on DioException catch (e) {
      var response = e.response;
      var errorString = e.message;

      if (response != null && response.data["error"] != null) {
        errorString = response.data["error"];
      } else if (response != null && response.data["message"] != null) {
        errorString = response.data["message"];
      }

      LogUtil.printLog(
          message: "Error Occurred: ${e.toString()} ",
          methodName: "_performCall",
          className: "RestApiService",
          logSeverity: LogSeverity.Error);

      // Create a RestError object
      RestError restError = RestError(
        message: errorString ?? AppString.somethingWentWrong,
        statusCode: response?.statusCode,
      );

      // Handle 500 errors specifically
      if (restError.statusCode == Constant.sessionExpired) {
        ForbiddenErrorHandling.handle(restError);
      } else {
        // Handle other errors as needed (optional)
        hideProgressDialog();
        errorView(restError.message);
      }

      // Rethrow the error if not handled
      throw restError;
    }
  }
}
