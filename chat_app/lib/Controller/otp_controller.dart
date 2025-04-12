import 'package:chat_app/Api/otp_api_provider.dart';
import 'package:chat_app/Core/storage_service.dart';
import 'package:chat_app/View/message_screnn.dart';
import 'package:chat_app/View/otp_screnn.dart';
import 'package:get/get.dart';

class OtpController extends GetxController {
  final OtpApiProvider _otpApiProvider;

  OtpController({required OtpApiProvider otpApiProvider})
    : _otpApiProvider = otpApiProvider;

  // Observable variables
  final phoneNumber = ''.obs;
  final isLoading = false.obs;
  final hasError = false.obs;
  final errorMessage = ''.obs;
  final isOtpSent = false.obs;
  final otpValue = Rxn<String>();

  // Update phone number
  void updatePhoneNumber(String number) {
    phoneNumber.value = number;
  }

  // Update OTP
  void updateOtp(String otp) {
    otpValue.value = otp;
  }

  // Request OTP
  Future<void> requestOtp() async {
    if (phoneNumber.value.isEmpty) {
      hasError.value = true;
      errorMessage.value = 'Phone number cannot be empty';
      return;
    }

    try {
      isLoading.value = true;
      hasError.value = false;
      errorMessage.value = '';

      final response = await _otpApiProvider.requestOtp("+91 ${phoneNumber.value}");

      if (response.success && response.data != null) {
        isOtpSent.value = true;
        otpValue.value = response.data!.data.toString();
        Get.snackbar(
          'Success',
          response.data!.message,
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.to(() =>  OtpVerificationScreen(phoneNumber: phoneNumber.value));
      } else {
        hasError.value = true;
        errorMessage.value = response.message ?? 'Failed to send OTP';
        Get.snackbar(
          'Error',
          errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      hasError.value = true;
      errorMessage.value = 'An unexpected error occurred: ${e.toString()}';
      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Verify OTP
  Future<void> verifyOtp() async {
    if (otpValue.value?.isEmpty ?? true) {
      hasError.value = true;
      errorMessage.value = 'OTP cannot be empty';
      return;
    }

    try {
      isLoading.value = true;
      hasError.value = false;
      errorMessage.value = '';

      final response = await _otpApiProvider.verifyOtp("+91 ${phoneNumber.value}", otpValue.value!);

      if (response.success && response.data != null && response.data!.data?.attributes?.authStatus?.accessToken != null) {
        StorageService().saveToken(response.data!.data!.attributes!.authStatus!.accessToken!);
        Get.snackbar(
          'Success',
         'OTP Verification Success',
          snackPosition: SnackPosition.BOTTOM,
        );
        Get.to(() => MessagesScreen());
      } else {
        hasError.value = true;
        errorMessage.value = response.message ?? 'Failed to verify OTP';
        Get.snackbar(
          'Error',
          errorMessage.value,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      hasError.value = true;
      errorMessage.value = 'An unexpected error occurred: ${e.toString()}';
      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Reset state
  void reset() {
    phoneNumber.value = '';
    isLoading.value = false;
    hasError.value = false;
    errorMessage.value = '';
    isOtpSent.value = false;
    otpValue.value = null;
  }
}
