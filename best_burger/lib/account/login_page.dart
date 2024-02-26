import 'package:best_burger/account/res.dart';
import 'package:best_burger/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<LoginPage> {
  //website url
  final Uri myWebsiteUrl = Uri.parse('https://www.facebook.com');
  //website url launch function
  Future<void> launchWebsiteUrl() async {
    try {
      await launchUrl(myWebsiteUrl);
    } catch (err) {}
  }

  bool? isChecked = true;
  bool _hidePassword = true;
  IconData icon = Icons.visibility_off;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24),
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
              SizedBox(
                width: 390,
                height: 50,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.account_circle_outlined),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Nhập Email'),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                width: 390,
                height: 55,
                child: TextField(
                  obscureText: _hidePassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.lock_outline,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Mật khẩu',
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _hidePassword = !_hidePassword;
                            icon = _hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility;
                          });
                        },
                        icon: Icon(
                          icon,
                          color: Color.fromARGB(255, 103, 104, 106),
                        )),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: Color.fromARGB(255, 6, 134, 239),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                  ),
                  const Text('Nhớ mật khẩu'),
                  const SizedBox(width: 100),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Quên mật khẩu',
                      style: TextStyle(
                        color: Color.fromARGB(255, 16, 142, 245),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                      (route) => false);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 166, 209, 245),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 10,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                child: const Text('Đăng nhập'),
              ),
              const SizedBox(height: 30),
              const Text(
                'Hoặc đăng nhập bằng',
                style: TextStyle(
                  color: Color.fromARGB(255, 16, 142, 245),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 50,
                    onPressed: () {
                      launchWebsiteUrl();
                    },
                    icon: const Icon(
                      Icons.facebook,
                      color: Color.fromARGB(255, 16, 142, 245),
                    ),
                  ),
                  const SizedBox(width: 40),
                  IconButton(
                    iconSize: 50,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.email,
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(width: 40),
                  IconButton(
                    iconSize: 50,
                    onPressed: () {},
                    icon: const Icon(
                      Icons.telegram_outlined,
                      color: Color.fromARGB(255, 16, 142, 245),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Bạn chưa có tài khoản?'),
                  SizedBox(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterPage(),
                            ),
                            (route) => false);
                      },
                      child: const Text(
                        'Đăng ký',
                        style: TextStyle(
                          color: Color.fromARGB(255, 16, 142, 245),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
