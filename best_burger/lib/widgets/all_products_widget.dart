// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace, unnecessary_string_interpolations, prefer_interpolation_to_compose_strings
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

import '../models/product_model.dart';
import '../screens/user_panel/product_details_screen.dart';

class AllProductsWidget extends StatelessWidget {
  const AllProductsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance
            .collection('product_lists')
            .where('isSale', isEqualTo: false)
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
            return GridView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.80),
              itemBuilder: (context, index) {
                final productsData = snapshot.data!.docs[index];
                ProductModel productModel = ProductModel(
                  productId: productsData['productId'],
                  typeId: productsData['typeId'],
                  productName: productsData['productName'],
                  typeName: productsData['typeName'],
                  fullPrice: productsData['fullPrice'],
                  salePrice: productsData['salePrice'],
                  isSale: productsData['isSale'],
                  productImages: productsData['productImages'],
                  productDescription: productsData['productDescription'],
                  createdAt: productsData['createdAt'],
                  updatedAt: productsData['updatedAt'],
                );
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(() =>
                          ProductDetailsScreen(productModel: productModel)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: FillImageCard(
                            borderRadius: 20.0,
                            width: Get.width / 2.3,
                            heightImage: Get.height / 6,
                            imageProvider: CachedNetworkImageProvider(
                                productModel.productImages[0]),
                            title: Center(
                              child: Text(
                                productModel.productName,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: const TextStyle(fontSize: 12.0),
                              ),
                            ),
                            footer: Center(
                                child: Text(productModel.fullPrice + " VND")),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            );
          }
          return Container();
        });
  }
}
