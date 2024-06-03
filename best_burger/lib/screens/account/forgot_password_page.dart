import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants.dart';
import '../../controller/forget_password_controller.dart';
import 'login_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final ForgerPasswordController forgerPasswordController =
      Get.put(ForgerPasswordController());
  TextEditingController userEmail = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarForgotPassword(),
      body: Container(
        padding: const EdgeInsets.only(right: 24, left: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/logo.png',
                width: 250,
                height: 170,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 390,
                height: 70,
                child: TextFormField(
                  controller: userEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle_outlined),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.blueAccent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.blueAccent),
                      ),
                      hintText: 'Nhập Email'),
                ),
              ),
              const SizedBox(height: 350),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 166, 209, 245),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 120,
                    vertical: 10,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () async {
                  String email = userEmail.text.trim();

                  if (email.isEmpty) {
                    Get.snackbar(
                      "Lỗi",
                      "Vui lòng nhập đầy đủ thông tin",
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: AppConstant.appScendoryColor,
                      colorText: AppConstant.appTextColor,
                    );
                  } else {
                    String email = userEmail.text.trim();
                    forgerPasswordController.ForgetPasswordMethod(email);
                  }
                },
                child: const Text(
                  'Gửi mã',
                  style: TextStyle(color: AppConstant.kTextColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBarForgotPassword() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
        ),
        onPressed: () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
              (route) => false);
        },
      ),
    );
  }
}
