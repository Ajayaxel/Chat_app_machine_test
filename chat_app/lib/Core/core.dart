import 'dart:io';
import 'package:dio/dio.dart';

class ApiResponse<T> {
  final T? data;
  final String? message;
  final bool success;
  final int? statusCode;

  ApiResponse({
    this.data,
    this.message,
    this.success = false,
    this.statusCode,
  });
}

class ApiService {
  final Dio _dio;
  final String _baseUrl;
  final String? _accessToken;

  ApiService({
    required String baseUrl,
    String? accessToken,
    Dio? dio,
  }) : _baseUrl = baseUrl,
       _accessToken = accessToken,
       _dio = dio ?? Dio() {
    _initializeDio();
  }

  void _initializeDio() {
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);
    _dio.options.responseType = ResponseType.json;
    
    if (_accessToken != null) {
      _dio.options.headers['Authorization'] = 'Bearer $_accessToken';
    }
    
    // Add interceptors for logging, etc.
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
  }

  Future<ApiResponse<T>> get<T>(
    String endpoint, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _processRequest(() => _dio.get(
      endpoint,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    ));
  }

  Future<ApiResponse<T>> post<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _processRequest(() => _dio.post(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    ));
  }

  Future<ApiResponse<T>> put<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _processRequest(() => _dio.put(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    ));
  }

  Future<ApiResponse<T>> delete<T>(
    String endpoint, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _processRequest(() => _dio.delete(
      endpoint,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    ));
  }

  Future<ApiResponse<T>> _processRequest<T>(
    Future<Response> Function() request,
  ) async {
    try {
      final response = await request();
      return ApiResponse<T>(
        data: response.data,
        message: 'Success',
        success: true,
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      return _handleDioError<T>(e);
    } on SocketException {
      return ApiResponse<T>(
        message: 'No internet connection',
        success: false,
      );
    } catch (e) {
      return ApiResponse<T>(
        message: 'Something went wrong: ${e.toString()}',
        success: false,
      );
    }
  }

  ApiResponse<T> _handleDioError<T>(DioException e) {
    String message = 'Something went wrong';
    int? statusCode = e.response?.statusCode;

    // Handle 400 series errors
    if (statusCode != null && statusCode >= 400 && statusCode < 500) {
      switch (statusCode) {
        case 400:
          message = 'Bad request';
          break;
        case 401:
          message = 'Unauthorized';
          break;
        case 403:
          message = 'Forbidden';
          break;
        case 404:
          message = 'Resource not found';
          break;
        case 422:
          message = 'Validation error';
          break;
        case 429:
          message = 'Too many requests';
          break;
        default:
          message = 'Client error: ${e.response?.statusMessage}';
      }

      // Try to get detailed error message from response
      if (e.response?.data != null && e.response?.data is Map) {
        final errorData = e.response?.data as Map;
        if (errorData.containsKey('message')) {
          message = errorData['message'] as String;
        } else if (errorData.containsKey('error')) {
          message = errorData['error'] as String;
        }
      }
    }
    // Handle 500 series errors
    else if (statusCode != null && statusCode >= 500) {
      switch (statusCode) {
        case 500:
          message = 'Internal server error';
          break;
        case 502:
          message = 'Bad gateway';
          break;
        case 503:
          message = 'Service unavailable';
          break;
        default:
          message = 'Server error: ${e.response?.statusMessage}';
      }
    }
    // Handle other Dio errors
    else {
      switch (e.type) {
        case DioExceptionType.connectionTimeout:
          message = 'Connection timeout';
          break;
        case DioExceptionType.receiveTimeout:
          message = 'Receive timeout';
          break;
        case DioExceptionType.sendTimeout:
          message = 'Send timeout';
          break;
        case DioExceptionType.cancel:
          message = 'Request canceled';
          break;
        default:
          message = 'Network error: ${e.message}';
      }
    }

    return ApiResponse<T>(
      message: message,
      success: false,
      statusCode: statusCode,
      data: e.response?.data,
    );
  }
}