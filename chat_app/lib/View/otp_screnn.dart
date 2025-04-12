import 'package:chat_app/Controller/otp_controller.dart';
import 'package:chat_app/View/consts/constbutton.dart';
import 'package:chat_app/View/message_screnn.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatelessWidget {
  final String phoneNumber;

  OtpVerificationScreen({super.key, required this.phoneNumber});

  final OtpController otpController = Get.find();

  @override
  Widget build(BuildContext context) {// Set the phone number

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Back Arrow
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back, size: 24, color: Colors.black),
              ),

              const SizedBox(height: 25),

              // Title
              const Center(
                child: Text(
                  "Enter your verification\ncode",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Phone number & Edit
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "+91 $phoneNumber. ",
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  const Text(
                    "Edit",
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // OTP Fields
              PinCodeTextField(
                appContext: context,
                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(10),
                  fieldHeight: 55,
                  fieldWidth: 45,
                  inactiveColor: Colors.grey.shade300,
                  selectedColor: Colors.black,
                  activeColor: Colors.black,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: false,
                onChanged:otpController.updateOtp,
              ),

              const SizedBox(height: 16),

              // Resend Text
              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Didn’t get anything? No worries, let’s try again.",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      "Resent",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

        Obx(() {
  return GradientButton(
    text: otpController.isLoading.value ? 'Verifying...' : 'Verify',
    onTap: () {
      if (otpController.otpValue.value?.length == 6 && !otpController.isLoading.value) {
        otpController.verifyOtp();
      } else {
        Get.snackbar("Invalid", "Please enter a valid 6-digit OTP");
      }
    },
  );
}),

            ],
          ),
        ),
      ),
    );
  }
}



