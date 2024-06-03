// import 'package:best_burger/screens/account/login_page.dart';
import 'package:best_burger/screens/home/components/cart_page.dart';
import 'package:best_burger/screens/user_panel/all_categories_screen.dart';
import 'package:best_burger/screens/user_panel/all_flast_sale_products.dart';
import 'package:best_burger/screens/user_panel/all_products_screen.dart';
import 'package:best_burger/screens/user_panel/cart_screen.dart';
import 'package:best_burger/widgets/all_products_widget.dart';
import 'package:best_burger/widgets/banner_widget.dart';
import 'package:best_burger/widgets/custom_drawer.dart';
import 'package:best_burger/widgets/heading_widget.dart';
import 'package:best_burger/widgets/product_sale_widget.dart';
import 'package:best_burger/widgets/product_type_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../constants.dart';
// import 'components/about_us_page.dart';
// import 'components/contact_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _PageHomeState();
}

class _PageHomeState extends State<HomeScreen> {
  // int selectedIndex = 0;
  // void onItemTapped(int index) {
  //   setState(() {
  //     selectedIndex = index;
  //   });
  // }

  // final Stream<QuerySnapshot> strHomeProducts =
  //     FirebaseFirestore.instance.collection('home_products').snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: Get.height / 90.0,
            ),
            const BannerWidget(),
            HeadingWidget(
              headingTitle: 'Loại',
              headingSubTitle: 'Theo ngân sách của bạn',
              onTap: () => Get.to(() => const AllCategoriesScreen()),
              buttonText: 'Xem Thêm >',
            ),
            const ProductTypeWidget(),
            HeadingWidget(
              headingTitle: 'Siêu giảm giá',
              headingSubTitle: 'Theo ngân sách của bạn',
              onTap: () => Get.to(() => const AllFlashSaleProductScreen()),
              buttonText: 'Xem Thêm >',
            ),
            const ProductSaleWidget(),
            HeadingWidget(
              headingTitle: 'Tất cả sản phẩm',
              headingSubTitle: 'Theo ngân sách của bạn',
              onTap: () => Get.to(() => const AllProductsScreen()),
              buttonText: 'Xem Thêm >',
            ),
            const AllProductsWidget(),
          ],
        ),
      ),
      // body: StreamBuilder<QuerySnapshot>(
      //   stream: strHomeProducts,
      //   builder: (
      //     BuildContext context,
      //     AsyncSnapshot<QuerySnapshot> snapshot,
      //   ) {
      //     if (snapshot.hasError) {
      //       return const Text('Đã xảy ra lỗi');
      //     }
      //     if (snapshot.connectionState == ConnectionState.waiting) {
      //       return const Text('Đang tải...');
      //     }
      //     final data = snapshot.requireData;
      //     // ignore: prefer_typing_uninitialized_variables
      //     var orientation;
      //     return GridView.builder(
      //       itemCount: data.size,
      //       itemBuilder: (context, index) {
      //         return GestureDetector(
      //           onTap: () {
      //             // Navigator.push(
      //             //   context,
      //             //   MaterialPageRoute(
      //             //     builder: (context) => const DetailsHomeScreen(),
      //             //   ),
      //             // );
      //           },
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Container(
      //                 padding: const EdgeInsets.all(20),
      //                 height: 100,
      //                 width: 100,
      //                 decoration: BoxDecoration(
      //                   color: const Color.fromARGB(255, 113, 113, 113),
      //                   borderRadius: BorderRadius.circular(16),
      //                 ),
      //                 child: Image.network('${data.docs[index]['image']}'),
      //               ),
      //               Padding(
      //                 padding: const EdgeInsets.symmetric(vertical: 5),
      //                 child: Text(
      //                   '${data.docs[index]['name']}',
      //                   style: const TextStyle(fontSize: 13),
      //                 ),
      //               ),
      //               Text(
      //                 '${data.docs[index]['price']}',
      //                 style: const TextStyle(fontSize: 14),
      //               ),
      //             ],
      //           ),
      //         );
      //       },
      //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //           crossAxisCount: (orientation == Orientation.portrait) ? 2 : 2),
      //     );
      //   },
      // ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'Best Burger | Trang chủ',
        style: TextStyle(
          color: AppConstant.textColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      actions: <Widget>[
        // IconButton(
        //   onPressed: () {},
        //   icon: SvgPicture.asset(
        //     'assets/icons/search.svg',
        //     colorFilter:
        //         const ColorFilter.mode(AppConstant.kTextColor, BlendMode.srcIn),
        //   ),
        // ),
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: SvgPicture.asset(
            'assets/icons/cart.svg',
            colorFilter:
                const ColorFilter.mode(AppConstant.kTextColor, BlendMode.srcIn),
          ),
        ),
        const SizedBox(width: AppConstant.kDefaultPadding / 2)
      ],
    );
  }
}
