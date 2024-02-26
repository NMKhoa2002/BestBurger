import 'package:best_burger/constants.dart';
import 'package:flutter/material.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        ),
        Container(
          height: 180,
          width: 160,
          decoration: BoxDecoration(
            // color: Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
        ),
      ],
    );
  }
}
