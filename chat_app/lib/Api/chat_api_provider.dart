

import 'package:chat_app/Core/core.dart';
import 'package:chat_app/Core/storage_service.dart';
import 'package:chat_app/Model/chat_response_model.dart';
import 'package:chat_app/Model/otp_response_model.dart';
import 'package:dio/dio.dart';




class ChatApiProvider {
  final ApiService _apiService;

  ChatApiProvider({required ApiService apiService}) : _apiService = apiService;

  Future<ApiResponse<ChatResponse>> getChats() async {

    final options = Options(
      headers: {
        'Authorization': 'Bearer ${StorageService().getToken()}',
        'Content-Type': 'application/json',
      }
    );
    final response = await _apiService.get<Map<String, dynamic>>(
      '/chat/chat-messages/queries/chat-between-users/55/81', 
      options: options// Replace with your actual endpoint
      
    );

    if (response.success && response.data != null) {
      try {
        final chatResponse = ChatResponse.fromJson(response.data!);
        return ApiResponse<ChatResponse>(
          data: chatResponse,
          message: response.message,
          success: response.success,
          statusCode: response.statusCode,
        );
      } catch (e) {
        return ApiResponse<ChatResponse>(
          message: 'Failed to parse response',
          success: false,
        );
      }
    }
    
    return ApiResponse<ChatResponse>(
      message: response.message,
      success: false,
      statusCode: response.statusCode,
    );
  }



    
}