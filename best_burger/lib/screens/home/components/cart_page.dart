import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantity = 1;
  void increaseQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decreaseQuantity() {
    if (quantity > 1) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarCart(),
      body: Container(
        padding: const EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 200,
                height: 150,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage("assets/burgers/bg-bo.png"),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Burger Bò",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: AppConstant.mainText),
                          ),
                          // Text(
                          //   "1 Hamburger, 1 miếng bò, rau, sốt",
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .bodySmall!
                          //       .copyWith(color: AppConstant.mainText,),
                          // ),
                          // const SizedBox(height: 5),
                          Row(
                            children: [
                              const Text(
                                '20.000 VND',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(width: 30),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('Xóa'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: increaseQuantity,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(Icons.add),
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                      ElevatedButton(
                        onPressed: decreaseQuantity,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(
                  color: Colors.red,
                  indent: 20,
                  endIndent: 20,
                  height: 4,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage("assets/burgers/bg-tom.png"),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Burger Tôm",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: AppConstant.mainText),
                          ),
                          // Text(
                          //   "1 Hamburger, 1 miếng tôm, rau, sốt",
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .bodySmall!
                          //       .copyWith(color: AppConstant.mainText),
                          // ),
                          // const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text(
                                '27.000 VND',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(width: 30),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('Xóa'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: increaseQuantity,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(Icons.add),
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                      ElevatedButton(
                        onPressed: decreaseQuantity,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(
                  color: Colors.red,
                  indent: 20,
                  endIndent: 20,
                  height: 4,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage("assets/chickens/ga-truyen-thong.png"),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Gà rán truyền thống",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: AppConstant.mainText),
                          ),
                          // Text(
                          //   "1 miếng gà truyền thống",
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .bodySmall!
                          //       .copyWith(color: AppConstant.mainText),
                          // ),
                          // const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text(
                                '25.000 VND',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(width: 30),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('Xóa'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: increaseQuantity,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(Icons.add),
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                      ElevatedButton(
                        onPressed: decreaseQuantity,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(
                  color: Colors.red,
                  indent: 20,
                  endIndent: 20,
                  height: 4,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const CircleAvatar(
                          radius: 50,
                          backgroundImage:
                              AssetImage("assets/pizzas/pizza-seafood.png"),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pizza Seafood",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: AppConstant.mainText),
                          ),
                          // Text(
                          //   "1 Chiếc pizza đến từ chicago,\n có rất nhiều hải sản và phô mai",
                          //   maxLines: 2,
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .bodySmall!
                          //       .copyWith(color: AppConstant.mainText),
                          // ),
                          // const SizedBox(height: 10),
                          Row(
                            children: [
                              const Text(
                                '139.000 VND',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                ),
                              ),
                              const SizedBox(width: 20),
                              ElevatedButton(
                                onPressed: () {},
                                child: const Text('Xóa'),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: increaseQuantity,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(Icons.add),
                      ),
                      Text(
                        quantity.toString(),
                        style: const TextStyle(fontSize: 15),
                      ),
                      ElevatedButton(
                        onPressed: decreaseQuantity,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(Icons.remove),
                      ),
                    ],
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Divider(
                  color: Colors.red,
                  indent: 0,
                  endIndent: 0,
                  height: 4,
                ),
              ),
              Container(
                padding: const EdgeInsets.only(right: 16, left: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tổng:',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        // const SizedBox(width: 50),
                        Text(
                          '211.000 VND',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: const Text(
                            'Mua hàng thành công',
                            style: TextStyle(
                                // color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          action: SnackBarAction(
                            textColor: AppConstant.textColor,
                            label: 'Hoàn tất',
                            onPressed: () {},
                          ),
                          backgroundColor: Color.fromARGB(255, 113, 113, 113),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Navigator.pop(context);
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red),
                      ),
                      child: const Text(
                        'Mua ngay',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBarCart() {
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
        'Best Burger | Giỏ Hàng',
        style: TextStyle(
          color: AppConstant.textColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
