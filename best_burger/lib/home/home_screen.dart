import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _PageHomeState();
}

class _PageHomeState extends State<HomeScreen> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              accountName: Text(
                'Nguyễn Minh Khoa',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text(
                'khoanm20.cdsg@saigontech.edu.vn',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              currentAccountPicture: CircleAvatar(
                radius: 40,
                child: Text(
                  'KN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text(
                'Trang chủ',
                style: TextStyle(fontSize: 20),
              ),
              selected: selectedIndex == 0,
              onTap: () {
                onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ExpansionTile(
              title: const Text(
                'Menu',
                style: TextStyle(fontSize: 20),
              ),
              childrenPadding: const EdgeInsets.only(left: 60),
              children: [
                ListTile(
                  title: const Text(
                    "Burger",
                    style: TextStyle(fontSize: 20),
                  ),
                  selected: selectedIndex == 1,
                  onTap: () {
                    onItemTapped(1);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text(
                    "Gà rán",
                    style: TextStyle(fontSize: 20),
                  ),
                  selected: selectedIndex == 2,
                  onTap: () {
                    onItemTapped(2);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text(
                    "Nước",
                    style: TextStyle(fontSize: 20),
                  ),
                  selected: selectedIndex == 3,
                  onTap: () {
                    onItemTapped(3);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text(
                    "Pizza",
                    style: TextStyle(fontSize: 20),
                  ),
                  selected: selectedIndex == 4,
                  onTap: () {
                    onItemTapped(4);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text(
                    "Món ăn khác",
                    style: TextStyle(fontSize: 20),
                  ),
                  selected: selectedIndex == 5,
                  onTap: () {
                    onItemTapped(5);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            ListTile(
              title: const Text(
                'Giới thiệu',
                style: TextStyle(fontSize: 20),
              ),
              selected: selectedIndex == 6,
              onTap: () {
                onItemTapped(6);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text(
                'Liên hệ',
                style: TextStyle(fontSize: 20),
              ),
              selected: selectedIndex == 7,
              onTap: () {
                onItemTapped(7);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'Best Burger',
        style: TextStyle(
          color: textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/search.svg',
            colorFilter: const ColorFilter.mode(kTextColor, BlendMode.srcIn),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/cart.svg',
            colorFilter: const ColorFilter.mode(kTextColor, BlendMode.srcIn),
          ),
        ),
        const SizedBox(width: kDefaultPadding / 2)
      ],
    );
  }
}
