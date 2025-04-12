
import 'package:chat_app/Controller/otp_controller.dart';
import 'package:chat_app/View/consts/constbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class PhoneScreen extends StatelessWidget {

  const PhoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final otpController = Get.find<OtpController>();

    return Scaffold(

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back),
              ),
              SizedBox(height: 25),
              Center(
                child: Text(
                  "Enter your\nphone number",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),
              SizedBox(height: 35,),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFD9D0D0)),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone_android_outlined,
                      color: Color(0xFF3E2723),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '+91',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF3E2723),
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    Icon(Icons.arrow_drop_down, color: Colors.grey),
                    SizedBox(width: 10),
                    Container(width: 1, height: 24, color: Colors.grey[300]),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                       
                        onChanged: otpController.updatePhoneNumber,
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF3E2723),
                          fontFamily: 'Poppins',
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '974568 1203',
                          hintStyle: TextStyle(
                            color: Colors.grey[600],
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Fliq will send you a text with a verification code.",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF3E2723),
                  fontFamily: 'Poppins',
                ),
              ),
              Spacer(),
              GradientButton(
                text: 'Next',
                onTap: () {
                  otpController.requestOtp();
                  // Navigator.push(

                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => const OtpVerificationScreen(),
                  //   ),
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
