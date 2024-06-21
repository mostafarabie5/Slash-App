import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Features/Home/Presentation/ViewModel/HomeCubit/home_cubit.dart';
import 'package:slash/constants.dart';
import 'package:slash/core/widgets/navigation_bar.dart';
import 'package:slash/Features/SeeAll/presentation/views/widgets/see_all_categories.dart';
import 'package:slash/Features/SeeAll/presentation/views/widgets/see_all_products.dart';
import 'package:slash/core/widgets/slash_app_bar.dart';

class SeeAllView extends StatelessWidget {
  const SeeAllView({
    super.key,
  });
  static String id = "SeeAllScreen";
  @override
  Widget build(BuildContext context) {
    bool isCategories =
        BlocProvider.of<HomeCubit>(context).title == "Categories";

    return Scaffold(
      appBar: const SlashAppBar(),
      bottomNavigationBar: const CustomNavigationBar(index: 0),
      body: isCategories
          ? const SeeAllCategories()
          : FutureBuilder(
              future: json,
              builder: (context, snapShot) {
                if (snapShot.hasData) {
                  return SeeAllProducts(snapShot: snapShot);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              }),
    );
  }
}
