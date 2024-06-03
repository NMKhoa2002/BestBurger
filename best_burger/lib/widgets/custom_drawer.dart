import 'package:best_burger/screens/auth-ui/welcome_screen.dart';
import 'package:best_burger/screens/home/components/about_us_page.dart';
import 'package:best_burger/screens/home/components/contact_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Get.height / 25),
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Wrap(
          runSpacing: 10,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: const Text("Best Burger"),
                subtitle: const Text('Phiên bản 1.0.1'),
                leading: CircleAvatar(
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
            ),
            const Divider(
              indent: 10.0,
              endIndent: 10.0,
              thickness: 1.5,
              color: Colors.grey,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: ListTile(
                titleAlignment: ListTileTitleAlignment.center,
                title: Text("Trang chủ"),
                leading: Icon(Icons.home),
                trailing: Icon(Icons.arrow_forward),
              ),
            ),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20.0),
            //   child: ExpansionTile(
            //     title: Text(
            //       'Menu',
            //       style: TextStyle(fontSize: 20),
            //     ),
            //     leading: Icon(Icons.production_quantity_limits),
            //     childrenPadding: EdgeInsets.only(left: 60),
            //     children: [
            //       ListTile(
            //         title: Text("Burger"),
            //         trailing: Icon(Icons.arrow_forward),
            //       ),
            //       ListTile(
            //         title: Text("Gà rán"),
            //         trailing: Icon(Icons.arrow_forward),
            //       ),
            //       ListTile(
            //         title: Text("Đồ uống"),
            //         trailing: Icon(Icons.arrow_forward),
            //       ),
            //       ListTile(
            //         title: Text("Món ăn khác"),
            //         trailing: Icon(Icons.arrow_forward),
            //       ),
            //       ListTile(
            //         title: Text("Pizza"),
            //         trailing: Icon(Icons.arrow_forward),
            //       ),
            //     ],
            //   ),
            // ),
            GestureDetector(
              onTap: () => Get.to(() => const ContactPage()),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text("Liên hệ"),
                  leading: Icon(Icons.help),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Get.to(() => const AboutUsPage()),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text("Giới thiệu"),
                  leading: Icon(Icons.info),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Get.to(() => const WelcomeScreen()),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text("Đăng xuất"),
                  leading: Icon(Icons.logout),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
