// ignore_for_file: unused_local_variable, unnecessary_null_comparison

import 'package:best_burger/controller/sign_in_controller.dart';
import 'package:best_burger/screens/account/res.dart';
import 'package:best_burger/constants.dart';
import 'package:best_burger/screens/admin-panel/admin_main_screen.dart';
import 'package:best_burger/screens/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/get_user_data_controller.dart';
import 'forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LoginPage> {
  final SignInController signInController = Get.put(SignInController());
  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();

  bool? isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 250,
                height: 170,
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 390,
                height: 70,
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: userEmail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
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
              const SizedBox(height: 20),
              SizedBox(
                  width: 390,
                  height: 50,
                  child: Obx(
                    () => TextFormField(
                      controller: userPassword,
                      obscureText: signInController.isPasswordVisible.value,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                const BorderSide(color: Colors.blueAccent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                const BorderSide(color: Colors.blueAccent),
                          ),
                          hintText: 'Mật khẩu',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              signInController.isPasswordVisible.toggle();
                            },
                            child: signInController.isPasswordVisible.value
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          )),
                    ),
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPasswordPage(),
                          ),
                          (route) => false);
                    },
                    child: const Text(
                      'Quên mật khẩu',
                      style: TextStyle(
                        color: Color.fromARGB(255, 16, 142, 245),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  String email = userEmail.text.trim();
                  String password = userPassword.text.trim();

                  if (email.isEmpty || password.isEmpty) {
                    Get.snackbar(
                      'Lỗi',
                      'Vui lòng nhập đầy đủ thông tin',
                      snackPosition: SnackPosition.TOP,
                      backgroundColor: AppConstant.appScendoryColor,
                      colorText: AppConstant.appTextColor,
                    );
                  } else {
                    UserCredential? userCredential =
                        await signInController.signInMethod(email, password);

                    var userData = await getUserDataController
                        .getUserData(userCredential!.user!.uid);

                    if (userCredential != null) {
                      if (userCredential.user!.emailVerified) {
                        if (userData[0]['isAdmin'] == true) {
                          Get.snackbar(
                            "Đăng nhập trang Admin",
                            "Đăng nhập trang Admin thành công!",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor:
                                const Color.fromARGB(255, 20, 198, 11),
                            colorText: AppConstant.kTextColor,
                          );
                          Get.offAll(() => const AdminMainScreen());
                        } else {
                          Get.offAll(() => const HomeScreen());
                          Get.snackbar(
                            "Đăng nhập trang User",
                            "Đăng nhập trang User thành công!",
                            snackPosition: SnackPosition.TOP,
                            backgroundColor:
                                const Color.fromARGB(255, 20, 198, 11),
                            colorText: AppConstant.kTextColor,
                          );
                        }
                      } else {
                        Get.snackbar(
                          'Lỗi',
                          'Vui lòng xác minh email của bạn trước khi đăng nhập',
                          snackPosition: SnackPosition.TOP,
                          backgroundColor: AppConstant.appScendoryColor,
                          colorText: AppConstant.appTextColor,
                        );
                      }
                    } else {
                      Get.snackbar(
                        'Lỗi',
                        'Vui lòng đăng nhập lại',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: AppConstant.appScendoryColor,
                        colorText: AppConstant.appTextColor,
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 166, 209, 245),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                child: const Text(
                  'Đăng nhập',
                  style: TextStyle(color: AppConstant.kTextColor),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Bạn chưa có tài khoản?'),
                  GestureDetector(
                    onTap: () => Get.offAll(() => const RegisterPage()),
                    child: const Text(
                      'Đăng ký',
                      style: TextStyle(
                        color: Color.fromARGB(255, 16, 142, 245),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
