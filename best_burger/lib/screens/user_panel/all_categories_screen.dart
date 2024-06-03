// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print

import 'package:best_burger/screens/user_panel/single_caegory_products_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_card/image_card.dart';

import '../../models/product_type_model.dart';

class AllCategoriesScreen extends StatefulWidget {
  const AllCategoriesScreen({super.key});

  @override
  State<AllCategoriesScreen> createState() => _AllCategoriesScreenState();
}

class _AllCategoriesScreenState extends State<AllCategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loại sản phẩm'),
        centerTitle: true,
      ),
      body: FutureBuilder(
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
            return GridView.builder(
              itemCount: snapshot.data!.docs.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 3,
                  crossAxisSpacing: 3,
                  childAspectRatio: 1.19),
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
                      onTap: () => Get.to(() => AllSingleCategoryProductsScreen(
                            typeId: productTypeIsModel.typeId,
                          )),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          child: FillImageCard(
                            borderRadius: 20.0,
                            width: Get.width / 2.3,
                            heightImage: Get.height / 10.0,
                            imageProvider: CachedNetworkImageProvider(
                                productTypeIsModel.typeImage),
                            title: Center(
                              child: Text(
                                productTypeIsModel.typeName,
                                style: const TextStyle(fontSize: 12.0),
                              ),
                            ),
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
        },
      ),
    );
  }
}
