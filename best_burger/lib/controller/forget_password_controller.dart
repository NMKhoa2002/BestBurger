// ignore_for_file: file_names, unused_field, body_might_complete_normally_nullable, unused_local_variable, non_constant_identifier_names, prefer_const_constructors

import 'package:best_burger/screens/account/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../constants.dart';

class ForgerPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> ForgetPasswordMethod(
    String userEmail,
  ) async {
    try {
      await _auth.sendPasswordResetEmail(email: userEmail);
      Get.snackbar(
        "Yêu cầu được gửi thành công",
        "Liên kết đặt lại mật khẩu đã được gửi đến $userEmail",
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppConstant.appScendoryColor,
        colorText: AppConstant.appTextColor,
      );

      Get.offAll(() => LoginPage());
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        "Lỗi",
        "$e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppConstant.appScendoryColor,
        colorText: AppConstant.appTextColor,
      );
    }
  }
}
