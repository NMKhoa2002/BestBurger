// ignore_for_file: unused_local_variable, body_might_complete_normally_nullable

import 'package:best_burger/constants.dart';
import 'package:best_burger/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //for password visibilty
  var isPasswordVisible = true.obs;

  Future<UserCredential?> signUpMethod(
    String userName,
    String userEmail,
    String userPhone,
    String userPassword,
  ) async {
    try {
      // EasyLoading.show(status: "Vui lòng chờ");
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: userEmail,
        password: userPassword,
      );

      await userCredential.user!.sendEmailVerification();

      UserModel userModel = UserModel(
        uId: userCredential.user!.uid,
        userName: userName,
        email: userEmail,
        phone: userPhone,
        userImg: '',
        isAdmin: false,
        isActive: true,
        createdOn: DateTime.now(),
      );

      //add data into database
      _firestore
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userModel.toMap());
      // EasyLoading.dismiss();
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // EasyLoading.dismiss();
      Get.snackbar(
        "Lỗi",
        '$e',
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppConstant.appScendoryColor,
        colorText: AppConstant.appTextColor,
      );
    }
  }
}
