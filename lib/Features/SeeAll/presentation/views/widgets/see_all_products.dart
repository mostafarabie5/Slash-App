import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Features/Home/Presentation/Views/Widgets/product_card.dart';
import 'package:slash/Features/SeeAll/presentation/manager/SeeAllCubit/see_all_cubit.dart';
import 'package:slash/constants.dart';
import 'package:slash/core/Cubits/ProductCubit/product_cubit.dart';
import 'package:slash/core/utils/product_model.dart';
import 'package:slash/core/utils/responsive.dart';

class SeeAllProducts extends StatelessWidget {
  const SeeAllProducts({super.key, required this.products});
  final Map<String, List<ProductModel>> products;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              BlocProvider.of<SeeAllCubit>(context).title ?? "",
              overflow: TextOverflow.clip,
              style: TextStyle(
                  color: primaryColor,
                  fontSize: Responsive.isMobile(context)
                      ? 30
                      : Responsive.isTablet(context)
                          ? 40
                          : 50,
                  fontWeight: FontWeight.bold,
                  fontFamily: primaryFont),
            ),
          ),
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: Responsive.isMobile(context)
                        ? 1 / 1.2
                        : Responsive.isTablet(context)
                            ? 1 / 1
                            : 1 / 0.9,
                    crossAxisCount: 2),
                itemCount:
                    products[BlocProvider.of<SeeAllCubit>(context).section]!
                        .length,
                itemBuilder: (context, index) {
                  ProductModel product = products[
                      BlocProvider.of<SeeAllCubit>(context).section]![index];
                  return ProductCard(
                      product: product,
                      favoriteOnPressed: () {
                        BlocProvider.of<ProductCubit>(context)
                            .addRemoveFavorite(product: product);
                      },
                      cartOnPressed: () {
                        BlocProvider.of<ProductCubit>(context)
                            .addRemoveProduct(product: product);
                      });
                  // return CustomProductCard(
                  //   product: product,
                  // onPressed1: () {
                  //   BlocProvider.of<ProductCubit>(context)
                  //       .addRemoveFavorite(product: product);
                  // },
                  // onPressed2: () {
                  //   BlocProvider.of<ProductCubit>(context)
                  //       .addRemoveProduct(product: product);
                  // },
                  // );
                }),
          )
        ],
      ),
    );
  }
}

class CustomProductCard extends StatelessWidget {
  const CustomProductCard(
      {super.key,
      required this.product,
      required this.onPressed1,
      required this.onPressed2});
  final ProductModel product;
  final Function() onPressed1;
  final Function() onPressed2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ProductCard(
                    product: product,
                    favoriteOnPressed: onPressed1,
                    cartOnPressed: onPressed2,
                  ),
                ),
                const VerticalDivider(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
        const Divider(height: 10),
      ],
    );
  }
}
