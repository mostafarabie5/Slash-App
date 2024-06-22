import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Features/Home/Presentation/ViewModel/HomeCubit/home_cubit.dart';
import 'package:slash/Features/Home/Presentation/ViewModel/HomeCubit/home_state.dart';
import 'package:slash/Features/Home/Presentation/Views/Widgets/product_card.dart';
import 'package:slash/core/Cubits/ProductCubit/product_cubit.dart';
import 'package:slash/core/utils/product_model.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, required this.section});

  final String section;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return FutureBuilder<Map<String, List<ProductModel>>>(
          future: BlocProvider.of<HomeCubit>(context).getProducts(),
          builder: (context, snapShot) {
            if (state is HomeLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is HomeSuccess) {
              if (snapShot.hasData) {
                Map<String, List<ProductModel>> products = snapShot.data!;
                return SizedBox(
                  height: MediaQuery.of(context).size.height * .23,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: products[section]?.length ?? 0,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        product: products[section]![index],
                        favoriteOnPressed: () {
                          BlocProvider.of<ProductCubit>(context)
                              .addRemoveFavorite(
                                  product: products[section]![index]);
                        },
                        cartOnPressed: () {
                          BlocProvider.of<ProductCubit>(context)
                              .addRemoveProduct(
                                  product: products[section]![index]);
                        },
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: Text("No Products..."),
                );
              }
            } else {
              return const Center(
                child: Text("Loading Error..."),
              );
            }
          });
    });
  }
}
