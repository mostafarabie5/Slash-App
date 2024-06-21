import 'package:flutter/material.dart';
import 'package:slash/Features/Home/Presentation/Views/Widgets/category_icon.dart';
import 'package:slash/constants.dart';
import 'package:slash/core/utils/assets_data.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: AssetsData.categoriesIcons.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.only(right: 14),
              child: CategoryIcon(
                  image: AssetsData.categoriesIcons[index],
                  category: categoriesType[index]));
        },
      ),
    );
  }
}
