// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_string_interpolations

import 'package:best_burger/constants.dart';
import 'package:best_burger/screens/user_panel/product_details_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

import '../models/product_model.dart';

class ProductSaleWidget extends StatelessWidget {
  const ProductSaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('product_lists')
            .where('isSale', isEqualTo: true)
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Lỗi'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              height: Get.height / 5,
              child: const Center(
                child: CupertinoActivityIndicator(),
              ),
            );
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('Không tìm thấy sản phẩm nào!'),
            );
          }

          if (snapshot.data != null) {
            return Container(
              height: Get.height / 4.5,
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final productData = snapshot.data!.docs[index];
                    ProductModel productModel = ProductModel(
                      productId: productData['productId'],
                      typeId: productData['typeId'],
                      productName: productData['productName'],
                      typeName: productData['typeName'],
                      fullPrice: productData['fullPrice'],
                      salePrice: productData['salePrice'],
                      isSale: productData['isSale'],
                      productImages: productData['productImages'],
                      productDescription: productData['productDescription'],
                      createdAt: productData['createdAt'],
                      updatedAt: productData['updatedAt'],
                    );
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(() =>
                              ProductDetailsScreen(productModel: productModel)),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              child: FillImageCard(
                                borderRadius: 20.0,
                                width: Get.width / 3.5,
                                heightImage: Get.height / 15,
                                imageProvider: CachedNetworkImageProvider(
                                    productModel.productImages[0]),
                                title: Center(
                                  child: Text(
                                    productModel.productName,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 12.0),
                                  ),
                                ),
                                footer: Row(
                                  children: [
                                    Text(
                                      "Rs ${productModel.salePrice}",
                                      style: const TextStyle(fontSize: 10.0),
                                    ),
                                    const SizedBox(width: 2.0),
                                    Text(
                                      '${productModel.fullPrice}',
                                      style: const TextStyle(
                                        fontSize: 10.0,
                                        color: AppConstant.appScendoryColor,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            );
          }
          return Container();
        });
  }
}
