import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarAboutUs(),
      body: Container(
        padding: const EdgeInsets.only(right: 24, left: 24),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 250,
                height: 170,
              ),
              const SizedBox(height: 20),
              Title(
                color: Colors.black,
                child: const Text(
                  'BEST BURGER',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              const Text(
                'Thức ăn nhanh bắt đầu từ các cửa hàng cá và khoai tây chiên đầu tiên ở Anh vào những năm 1860. '
                'Và được phổ biến ở Hoa Kỳ năm 1950, đến năm 1951 thuận ngữ "Thức ăn nhanh - Fast Food" được Merriam - Webster công nhận. '
                'Khi "Thức ăn nhanh - Fast Food" cập bến đến Việt Nam thì cũng lúc đó Best Burger cũng được hình thành, tại đây bạn có thể thưởng thứ những món ăn ngon, '
                'nhanh, và an toàn vệ sinh.',
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBarAboutUs() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset(
          "assets/icons/back.svg",
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text(
        'Best Burger | Giới Thiệu',
        style: TextStyle(
          color: AppConstant.textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
