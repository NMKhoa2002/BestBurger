// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:best_burger/models/product_type_model.dart';
import 'package:best_burger/screens/user_panel/single_caegory_products_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

class ProductTypeWidget extends StatelessWidget {
  const ProductTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: FirebaseFirestore.instance.collection('product_types').get(),
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
              child: Text('Không tìm thấy danh mục nào!'),
            );
          }

          if (snapshot.data != null) {
            return Container(
              height: Get.height / 5.5,
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    ProductTypeModel productTypeIsModel = ProductTypeModel(
                        typeId: snapshot.data!.docs[index]['typeId'],
                        typeName: snapshot.data!.docs[index]['typeName'],
                        typeImage: snapshot.data!.docs[index]['typeImage'],
                        createdAt: snapshot.data!.docs[index]['createdAt'],
                        updatedAt: snapshot.data!.docs[index]['updatedAt']);
                    return Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(() =>
                              AllSingleCategoryProductsScreen(
                                  typeId: productTypeIsModel.typeId)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: FillImageCard(
                                borderRadius: 20.0,
                                width: Get.width / 4.0,
                                heightImage: Get.height / 12.0,
                                imageProvider: CachedNetworkImageProvider(
                                    productTypeIsModel.typeImage),
                                title: Center(
                                  child: Text(
                                    productTypeIsModel.typeName,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 12.0),
                                  ),
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
