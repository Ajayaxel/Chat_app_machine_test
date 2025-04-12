import 'package:chat_app/View/phone_screnn.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/onbording/image (1).png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.darken,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: screenWidth * 0.06,
            right: screenWidth * 0.06,
            top: screenHeight * 0.12,
            bottom: screenHeight * 0.03,
          ),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "images/onbording/Frame 496.png",
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.13,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Text(
                "Connect. Meet. Love.\nWith Fliq Dating",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: screenWidth * 0.07,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Poppins',
                ),
              ),
              const Spacer(),
              CustomButtons(
                image: "images/onbording/Google.png",
                text: "Sign in with Google",
                backgroundColor: Colors.white,
                textColor: Colors.black,
                onTap: () {},
              ),
              SizedBox(height: screenHeight * 0.015),
              CustomButtons(
                image: "images/onbording/fi_145802.png",
                text: "Sign in with Facebook",
                backgroundColor: Color(0xff3B5998),
                textColor: Colors.white,
                onTap: () {},
              ),
              SizedBox(height: screenHeight * 0.015),
              CustomButtons(
                image: "images/onbording/phone-circle.png",
                text: "Sign in with Phone number",
                backgroundColor: Color(0xffE6446E),
                textColor: Colors.white,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PhoneScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: screenHeight * 0.01),
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'By signing up, you agree to our ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextSpan(
                      text: 'Terms',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const TextSpan(
                      text: '. See how we use your data in our ',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    TextSpan(
                      text: 'Privacy Policy.',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CustomButtons extends StatelessWidget {
  final String image;
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onTap;
  const CustomButtons({
    super.key,
    required this.image,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 24, width: 24, fit: BoxFit.cover),
          SizedBox(width: 10),
          Center(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
              ),
            ),
          ),
        ],
      ),
    )
    );

  }
}
