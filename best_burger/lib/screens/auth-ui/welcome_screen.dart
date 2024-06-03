import 'package:best_burger/constants.dart';
import 'package:best_burger/screens/account/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final Uri gmailUrl = Uri.parse(
      'https://accounts.google.com/v3/signin/identifier?continue=https%3A%2F%2Fmail.google.com%2Fmail%2F&ifkv=ATuJsjznzkn9S9qapZIx0afnEt4IbRyE_BonK6JJ5frUbORA99tkJAkUNYzWjX3q_YqmoOp2MuafHw&rip=1&sacu=1&service=mail&flowName=GlifWebSignIn&flowEntry=ServiceLogin&dsh=S1140988317%3A1709002886507145&theme=glif');

  Future<void> launchGmailUrl() async {
    try {
      await launchUrl(gmailUrl);
    } catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appScendoryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Chào mừng đến với Best Burger',
          style: TextStyle(color: AppConstant.appTextColor),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Lottie.asset('assets/images/splash-icon.json'),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20.0),
                child: const Text(
                  'Mua sắm vui vẻ',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: Get.height / 12),
              // Material(
              //   child: Container(
              //     width: Get.width / 1.2,
              //     height: Get.height / 12,
              //     decoration: BoxDecoration(
              //       color: AppConstant.appScendoryColor,
              //       borderRadius: BorderRadius.circular(20.0),
              //     ),
              //     child: TextButton.icon(
              //       onPressed: () {
              //         launchGmailUrl();
              //       },
              //       icon: Image.asset(
              //         'assets/icons/final-google-logo.png',
              //         width: Get.width / 12,
              //         height: Get.height / 12,
              //       ),
              //       label: const Text(
              //         'Đăng nhập với Google',
              //         style: TextStyle(color: AppConstant.appTextColor),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: Get.height / 50),
              Material(
                child: Container(
                  width: Get.width / 1.2,
                  height: Get.height / 12,
                  decoration: BoxDecoration(
                    color: AppConstant.appScendoryColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: TextButton.icon(
                    icon: const Icon(
                      Icons.email,
                      color: AppConstant.appTextColor,
                    ),
                    label: const Text(
                      "Đăng nhập bằng tài khoản email",
                      style: TextStyle(color: AppConstant.appTextColor),
                    ),
                    onPressed: () {
                      Get.to(() => const LoginPage());
                    },
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
