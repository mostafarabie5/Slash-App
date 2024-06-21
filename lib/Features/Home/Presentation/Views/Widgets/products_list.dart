import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Features/Home/Presentation/Views/Widgets/product_card.dart';
import 'package:slash/constants.dart';
import 'package:slash/core/Cubits/ProductCubit/product_cubit.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key, required this.section});

  final String section;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: json,
      builder: (context, snapShot) {
        if (snapShot.hasData) {
          Map<String, dynamic> jsonData = snapShot.data!;
          return SizedBox(
            height: MediaQuery.of(context).size.height * .23,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: jsonData[section].length,
              itemBuilder: (context, index) {
                return ProductCard(
                  product: jsonData[section][index],
                  favoriteOnPressed: () {
                    BlocProvider.of<ProductCubit>(context)
                        .addRemoveFavorite(product: jsonData[section][index]);
                  },
                  cartOnPressed: () {
                    BlocProvider.of<ProductCubit>(context)
                        .addRemoveProduct(product: jsonData[section][index]);
                  },
                );
              },
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
