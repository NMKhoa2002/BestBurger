// ignore_for_file: unused_local_variable

import 'package:best_burger/constants.dart';
import 'package:best_burger/controller/sign_up_controller.dart';
import 'package:best_burger/screens/account/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final SignUpController signUpController = Get.put(SignUpController());
  TextEditingController userName = TextEditingController();
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  bool? isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarRes(),
      body: Container(
        padding: const EdgeInsets.only(right: 24, left: 24),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 250,
                height: 170,
              ),
              Container(
                alignment: Alignment.center,
                child: const Text(
                  'Chào mừng đến với Best Burger',
                  style: TextStyle(
                    color: AppConstant.appScendoryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
              ),
              const SizedBox(height: 20),
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
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: userName,
                  keyboardType: TextInputType.name,
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
                      hintText: 'Họ và tên'),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 390,
                height: 50,
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: userPhone,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone_outlined),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.blueAccent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: const BorderSide(color: Colors.blueAccent),
                      ),
                      hintText: 'Số điện thoại'),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                  width: 390,
                  height: 55,
                  child: Obx(
                    () => TextFormField(
                      controller: userPassword,
                      obscureText: signUpController.isPasswordVisible.value,
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
                          hintText: 'Nhập mật khẩu',
                          suffixIcon: GestureDetector(
                            onTap: () {
                              signUpController.isPasswordVisible.toggle();
                            },
                            child: signUpController.isPasswordVisible.value
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          )),
                    ),
                  )),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  String name = userName.text.trim();
                  String email = userEmail.text.trim();
                  String phone = userPhone.text.trim();
                  String password = userPassword.text.trim();

                  if (name.isEmpty ||
                      email.isEmpty ||
                      phone.isEmpty ||
                      password.isEmpty) {
                    Get.snackbar(
                      'Lỗi',
                      'Vui lòng nhập đầy đủ thông tin',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: AppConstant.appScendoryColor,
                      colorText: AppConstant.appTextColor,
                    );
                  } else {
                    UserCredential? userCredential =
                        await signUpController.signUpMethod(
                      name,
                      email,
                      phone,
                      password,
                    );

                    if (userCredential != null) {
                      Get.snackbar(
                        'Gửi email xác minh',
                        'Vui lòng kiểm tra email của bạn',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppConstant.appScendoryColor,
                        colorText: AppConstant.appTextColor,
                      );

                      FirebaseAuth.instance.signOut();
                      Get.offAll(() => const LoginPage());
                    }
                  }
                  // const snackBar = SnackBar(
                  //   content: Text('Đăng ký thành công'),
                  // );
                  // ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  // Navigator.pushAndRemoveUntil(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const LoginPage(),
                  //     ),
                  //     (route) => false);
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
                child: const Text('Đăng ký'),
              ),
              const SizedBox(height: 140),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Bạn đã có tài khoản?'),
                  SizedBox(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginPage(),
                            ),
                            (route) => false);
                      },
                      child: const Text(
                        'Đăng nhập',
                        style: TextStyle(
                          color: Color.fromARGB(255, 16, 142, 245),
                        ),
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

  AppBar buildAppBarRes() {
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
