import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Features/SeeAll/presentation/manager/SeeAllCubit/see_all_cubit.dart';
import 'package:slash/Features/SeeAll/presentation/manager/SeeAllCubit/see_all_state.dart';
import 'package:slash/core/utils/product_model.dart';
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
        BlocProvider.of<SeeAllCubit>(context).title == "Categories";

    return Scaffold(
      appBar: const SlashAppBar(),
      body: BlocBuilder<SeeAllCubit, SeeAllState>(builder: (context, state) {
        return isCategories
            ? const SeeAllCategories()
            : FutureBuilder<Map<String, List<ProductModel>>>(
                future: BlocProvider.of<SeeAllCubit>(context).getProducts(),
                builder: (context, snapShot) {
                  if (state is SeeAllLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is SeeAllSuccess) {
                    if (snapShot.hasData) {
                      return SeeAllProducts(products: snapShot.data!);
                    } else {
                      return const Center(child: Text("No Products..."));
                    }
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                });
      }),
      bottomNavigationBar: const CustomNavigationBar(index: 0),
    );
  }
}
