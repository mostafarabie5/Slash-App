import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Features/Home/Presentation/ViewModel/HomeCubit/home_cubit.dart';
import 'package:slash/Features/Home/Presentation/Views/Widgets/category_icon.dart';
import 'package:slash/constants.dart';
import 'package:slash/core/utils/assets_data.dart';

class SeeAllCategories extends StatelessWidget {
  const SeeAllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            BlocProvider.of<HomeCubit>(context).title ?? "",
            softWrap: true,
            style: const TextStyle(
                color: primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: primaryFont),
          ),
        ),
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: AssetsData.categoriesIcons.length,
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              itemBuilder: (context, index) {
                return CategoryIcon(
                    image: AssetsData.categoriesIcons[index],
                    category: categoriesType[index]);
              }),
        )
      ],
    );
  }
}
