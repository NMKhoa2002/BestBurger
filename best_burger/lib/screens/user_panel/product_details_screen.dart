// ignore_for_file: must_be_immutable, prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'package:best_burger/models/cart_product_model.dart';
import 'package:best_burger/models/product_model.dart';
import 'package:best_burger/screens/user_panel/cart_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductModel productModel;
  ProductDetailsScreen({super.key, required this.productModel});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chi tiết sản phẩm'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => Get.to(() => const CartScreen()),
            icon: SvgPicture.asset(
              'assets/icons/cart.svg',
              colorFilter: const ColorFilter.mode(
                  AppConstant.kTextColor, BlendMode.srcIn),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: Get.height / 20),
          CarouselSlider(
            items: widget.productModel.productImages
                .map(
                  (imageUrl) => ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      width: Get.width - 10,
                      placeholder: (context, url) => const ColoredBox(
                        color: Colors.white,
                        child: Center(
                          child: CupertinoActivityIndicator(),
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                )
                .toList(),
            options: CarouselOptions(
              scrollDirection: Axis.horizontal,
              autoPlay: true,
              aspectRatio: 2.5,
              viewportFraction: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.productModel.productName),
                          const Icon(Icons.favorite_outline)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          widget.productModel.isSale == true &&
                                  widget.productModel.salePrice != ''
                              ? Text(widget.productModel.salePrice + " VND")
                              : Text(widget.productModel.fullPrice + " VND"),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text("Loại: " + widget.productModel.productName),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                          "Mô tả: " + widget.productModel.productDescription),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Material(
                          child: Container(
                            width: Get.width / 2.2,
                            height: Get.height / 16,
                            decoration: BoxDecoration(
                              color: AppConstant.appScendoryColor,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: TextButton(
                              child: const Text(
                                "Thêm vào giỏ hàng",
                                style:
                                    TextStyle(color: AppConstant.appTextColor),
                              ),
                              onPressed: () async {
                                // Get.to(() => const LoginPage());

                                await checkProductExistence(uId: user!.uid);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  } 

  //check product exits or not

  Future<void> checkProductExistence({
    required uId,
    int quantityIncrement = 1,
  }) async {
    final DocumentReference documentReference = FirebaseFirestore.instance
        .collection('cart')
        .doc(uId)
        .collection('cartOrders')
        .doc(widget.productModel.productId.toString());

    DocumentSnapshot snapshot = await documentReference.get();

    if (snapshot.exists) {
      int currentQuantity = snapshot['productQuantity'];
      int updatedQuantity = currentQuantity + quantityIncrement;
      double totalPrice = double.parse(widget.productModel.isSale
              ? widget.productModel.salePrice
              : widget.productModel.fullPrice) *
          updatedQuantity;

      await documentReference.update({
        'productQuantity': updatedQuantity,
        'productTotalPrice': totalPrice
      });

      print('product exists');
    } else {
      await FirebaseFirestore.instance.collection('cart').doc(uId).set(
        {
          'uId': uId,
          'createdAt': DateTime.now(),
        },
      );
      CartModel cartModel = CartModel(
          productId: widget.productModel.productId,
          typeId: widget.productModel.typeId,
          productName: widget.productModel.productName,
          typeName: widget.productModel.typeName,
          salePrice: widget.productModel.salePrice,
          fullPrice: widget.productModel.fullPrice,
          productImages: widget.productModel.productImages,
          isSale: widget.productModel.isSale,
          productDescription: widget.productModel.productDescription,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          productQuantity: 1,
          productTotalPrice: double.parse(widget.productModel.isSale
              ? widget.productModel.salePrice
              : widget.productModel.fullPrice));
      await documentReference.set(cartModel.toMap());

      print('product added');
    }
  }
}
