import 'package:chat_app/Api/chat_api_provider.dart';
import 'package:chat_app/Api/otp_api_provider.dart';
import 'package:chat_app/Core/storage_service.dart';
import 'package:chat_app/Model/chat_response_model.dart';
import 'package:chat_app/View/message_screnn.dart';
import 'package:chat_app/View/otp_screnn.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final ChatApiProvider _chatApiProvider;

  ChatController({required ChatApiProvider chatApiProvider})
    : _chatApiProvider = chatApiProvider;

  // Observable variables

  final isLoading = false.obs;
  final hasError = false.obs;
  final errorMessage = ''.obs;
  final chatData = Rxn<ChatResponse>();

  // Update phone number
  Future<void> getChat() async {

    try {
      isLoading.value = true;
      hasError.value = false;
      errorMessage.value = '';
   final response = await _chatApiProvider.getChats();

   if (response.success && response.data != null) {
    chatData.value = response.data!;
   } else {
    hasError.value = true;
    errorMessage.value = response.message ?? 'Failed to get chat';
    Get.snackbar(
      'Error',
      errorMessage.value,
      snackPosition: SnackPosition.BOTTOM,
    );
   }
  }
  catch (e) {
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

    isLoading.value = false;
    hasError.value = false;
    errorMessage.value = '';
    chatData.value = null;
  }
}
