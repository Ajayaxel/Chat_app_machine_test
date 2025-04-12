import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:chat_app/Core/core.dart';
import 'package:chat_app/Model/otp_response_model.dart';
import 'package:chat_app/Model/otp_verify_response_model.dart';



class OtpApiProvider {
  final ApiService _apiService;

  OtpApiProvider({required ApiService apiService}) : _apiService = apiService;

  Future<ApiResponse<OtpResponseModel>> requestOtp(String phoneNumber) async {
    final request = OtpRequestModel(phone: phoneNumber);
    
    final response = await _apiService.post<Map<String, dynamic>>(
      '/auth/registration-otp-codes/actions/phone/send-otp', // Replace with your actual endpoint
      data: request.toJson(),
    );

    if (response.success && response.data != null) {
      try {
        final otpResponse = OtpResponseModel.fromJson(response.data!);
        return ApiResponse<OtpResponseModel>(
          data: otpResponse,
          message: response.message,
          success: response.success,
          statusCode: response.statusCode,
        );
      } catch (e) {
        return ApiResponse<OtpResponseModel>(
          message: 'Failed to parse response: ${e.toString()}',
          success: false,
        );
      }
    }
    
    return ApiResponse<OtpResponseModel>(
      message: response.message,
      success: false,
      statusCode: response.statusCode,
    );
  }


   Future<ApiResponse<OtpVerifyModel>> verifyOtp(String phoneNumber, String otpCode) async {
    Map<String, dynamic> request = {
    "data": {
        "type": "registration_otp_codes",
        "attributes": {
            "phone": phoneNumber,
            "otp":int.tryParse(otpCode),
            "device_meta": {
                "type": "web",
                "name": "HP Pavilion 14-EP0068TU",
                "os": "Linux x86_64",
                "browser": "Mozilla Firefox Snap for Ubuntu (64-bit)",
                "browser_version": "112.0.2",
                "user_agent": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/112.0",
                "screen_resolution": "1600x900",
                "language": "en-GB"
            }
        }
    }
};


    
    final response = await _apiService.post<Map<String, dynamic>>(
      '/auth/registration-otp-codes/actions/phone/verify-otp', // Replace with your actual endpoint
      data:request,
    );
  

    if (response.success && response.data != null) {
      try {
        final otpResponse = OtpVerifyModel.fromJson(response.data!);
        return ApiResponse<OtpVerifyModel>(
          data: otpResponse,
          message: response.message,
          success: response.success,
          statusCode: response.statusCode,
        );
      } catch (e) {
        return ApiResponse<OtpVerifyModel>(
          message: 'Failed to parse response: ${e.toString()}',
          success: false,
        );
      }
    }
    
    return ApiResponse<OtpVerifyModel>(
      message: response.message,
      success: false,
      statusCode: response.statusCode,
    );
  }
}