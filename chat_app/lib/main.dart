import 'package:chat_app/Api/chat_api_provider.dart';
import 'package:chat_app/Api/otp_api_provider.dart';
import 'package:chat_app/Controller/chat_controller.dart';
import 'package:chat_app/Controller/otp_controller.dart';
import 'package:chat_app/Core/core.dart';
import 'package:chat_app/Core/storage_service.dart';
import 'package:chat_app/View/message_screnn.dart';
import 'package:chat_app/View/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/instance_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final StorageService storageService = StorageService();
  await storageService.init();
    // Set up dependencies
  final apiService = ApiService(
    baseUrl: 'https://test.myfliqapp.com/api/v1', 
    accessToken: storageService.getToken() , 
  );
  
  final otpApiProvider = OtpApiProvider(apiService: apiService);
  
  // Register dependencies
  Get.put(OtpController(otpApiProvider: otpApiProvider));

  Get.put(ChatController(chatApiProvider: ChatApiProvider(apiService: apiService)));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool isLoggedIn = StorageService().getToken() != null;
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: isLoggedIn ? MessagesScreen() : SplashScreen(),
    );
  }
}

