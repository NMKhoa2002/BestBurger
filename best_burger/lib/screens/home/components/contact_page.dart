import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarContact(),
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
              const SizedBox(height: 40),
              SizedBox(
                width: 390,
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Nhập Tên'),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 390,
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Nhập Email'),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 390,
                height: 100,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Nhập Văn Bản'),
                ),
              ),
              const SizedBox(height: 160),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 166, 209, 245),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 120,
                    vertical: 10,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  'Gửi',
                  style: TextStyle(color: AppConstant.kTextColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBarContact() {
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
        'Best Burger | Liên hệ',
        style: TextStyle(
          color: AppConstant.textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
