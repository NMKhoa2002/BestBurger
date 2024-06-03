// ignore_for_file: unused_local_variable, avoid_print

import 'package:best_burger/constants.dart';
import 'package:best_burger/models/order_model.dart';
import 'package:best_burger/screens/home/home_screen.dart';
import 'package:best_burger/services/genrare_order_id_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void placeOrder({
  required BuildContext context,
  required String customerName,
  required String customerPhone,
  required String customerAddress,
  required String customerDeviceToken,
}) async {
  final user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('cart')
          .doc(user.uid)
          .collection('cartOrders')
          .get();

      List<QueryDocumentSnapshot> documents = querySnapshot.docs;

      for (var doc in documents) {
        Map<String, dynamic>? data = doc.data() as Map<String, dynamic>;
        String orderId = genetateOrderId();

        OrderModel orderModel = OrderModel(
          productId: data['productId'],
          typeId: data['typeId'],
          productName: data['productName'],
          typeName: data['typeName'],
          fullPrice: data['fullPrice'],
          salePrice: data['salePrice'],
          isSale: data['isSale'],
          productImages: data['productImages'],
          productDescription: data['productDescription'],
          createdAt: DateTime.now(),
          updatedAt: data['updatedAt'],
          productQuantity: data['productQuantity'],
          productTotalPrice: double.parse(data['productTotalPrice'].toString()),
          customerId: user.uid,
          status: false,
          customerName: customerName,
          customerPhone: customerPhone,
          customerAddress: customerAddress,
          customerDeviceToken: customerDeviceToken,
        );

        for (var x = 0; x < documents.length; x++) {
          await FirebaseFirestore.instance
              .collection('orders')
              .doc(user.uid)
              .set(
            {
              'ui': user.uid,
              'customerName': customerName,
              'customerPhone': customerPhone,
              'customerAddress': customerAddress,
              'customerDeviceToken': customerDeviceToken,
              'orderStatus': false,
              'createAt': DateTime.now()
            },
          );
          await FirebaseFirestore.instance
              .collection('orders')
              .doc(user.uid)
              .collection('confirmOrders')
              .doc(orderId)
              .set(orderModel.toMap());

          await FirebaseFirestore.instance
              .collection('cart')
              .doc(user.uid)
              .collection('cartOrders')
              .doc(orderModel.productId.toString())
              .delete()
              .then((value) {
            print('Delete cart Products $orderModel.productId.toString()');
          });
        }
      }
      print('Order Confirmed');
      Get.snackbar(
        'Xác nhận đặt hàng',
        'Cảm ơn bạn đã đặt hàng',
        backgroundColor: AppConstant.appMainColor,
        colorText: Colors.white,
        duration: const Duration(seconds: 5),
      );
      EasyLoading.dismiss();
      Get.offAll(() => HomeScreen());
    } catch (e) {
      print('Lỗi $e');
    }
  }
}
