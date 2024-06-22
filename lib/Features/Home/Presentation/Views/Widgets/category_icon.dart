import 'package:flutter/material.dart';
import 'package:slash/constants.dart';
import 'package:slash/core/utils/responsive.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({super.key, required this.image, required this.category});
  final String image;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: Responsive.isMobile(context)
              ? MediaQuery.of(context).size.width * .1
              : Responsive.isTablet(context)
                  ? 60
                  : 70,
          backgroundColor: primaryColor,
          child: Image(
            image: AssetImage(image),
            width: Responsive.isMobile(context)
                ? 50
                : Responsive.isTablet(context)
                    ? 60
                    : 90,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          category,
          style: TextStyle(
            fontSize: Responsive.isMobile(context)
                ? 18
                : Responsive.isTablet(context)
                    ? 22
                    : 26,
            fontWeight: FontWeight.w500,
            fontFamily: primaryFont,
          ),
        ),
      ],
    );
  }
}
