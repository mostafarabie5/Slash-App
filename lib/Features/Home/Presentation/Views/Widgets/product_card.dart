import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/constants.dart';
import 'package:slash/core/Cubits/ProductCubit/product_cubit.dart';
import 'package:slash/core/Cubits/ProductCubit/product_state.dart';
import 'package:slash/core/utils/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.product,
      required this.favoriteOnPressed,
      required this.cartOnPressed});
  final ProductModel product;
  final void Function()? favoriteOnPressed;
  final void Function()? cartOnPressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 20),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(product.image),
                        ),
                      ),
                      child: const AspectRatio(
                        aspectRatio: 1,
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: MediaQuery.of(context).size.height * 0.005,
                      child: CircleAvatar(
                        backgroundColor: const Color.fromRGBO(238, 238, 238, 1),
                        child: IconButton(
                          icon: BlocProvider.of<ProductCubit>(context)
                                  .isFavorite(product: product)
                              ? const Icon(
                                  Icons.favorite,
                                  color: Color.fromARGB(255, 208, 19, 6),
                                )
                              : const Icon(Icons.favorite_border),
                          onPressed: favoriteOnPressed,
                        ),
                      ),
                    ),
                  ],
                ),
                Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: primaryFont,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "EGP ${product.price}",
                      style: const TextStyle(
                        color: primaryColor,
                        fontFamily: primaryFont,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: BlocProvider.of<ProductCubit>(context)
                              .inMyCart(product: product)
                          ? const Icon(
                              Icons.check_circle,
                              color: primaryColor,
                            )
                          : const Icon(
                              Icons.add_circle,
                              color: primaryColor,
                            ),
                      onPressed: cartOnPressed,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
