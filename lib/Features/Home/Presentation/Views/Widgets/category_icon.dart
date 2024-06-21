import 'package:flutter/material.dart';
import 'package:slash/constants.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({super.key, required this.image, required this.category});
  final String image;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: primaryColor,
          child: Image(image: AssetImage(image)),
        ),
        const SizedBox(height: 6),
        Text(
          category,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            fontFamily: primaryFont,
          ),
        ),
      ],
    );
  }
}
