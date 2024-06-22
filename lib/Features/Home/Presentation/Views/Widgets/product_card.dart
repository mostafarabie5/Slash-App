import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/constants.dart';
import 'package:slash/core/Cubits/ProductCubit/product_cubit.dart';
import 'package:slash/core/Cubits/ProductCubit/product_state.dart';
import 'package:slash/core/utils/product_model.dart';
import 'package:slash/core/utils/responsive.dart';

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
          padding: const EdgeInsets.only(right: 12, left: 12),
          child: IntrinsicWidth(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        height: Responsive.isMobile(context)
                            ? MediaQuery.of(context).size.width * 0.38
                            : Responsive.isTablet(context)
                                ? MediaQuery.of(context).size.width * .4
                                : MediaQuery.of(context).size.width * .46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                            image: AssetImage(product.image),
                            fit: BoxFit.contain,
                          ),
                        ),
                        child: const AspectRatio(
                          aspectRatio: 1,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromRGBO(238, 238, 238, 1),
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
                ),
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: Responsive.isMobile(context)
                        ? 16
                        : Responsive.isTablet(context)
                            ? 20
                            : 24,
                    fontFamily: primaryFont,
                    fontWeight: FontWeight.w600,
                    color: primaryColor,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.38,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "EGP ${product.price}",
                        style: TextStyle(
                          color: primaryColor,
                          fontFamily: primaryFont,
                          fontWeight: FontWeight.w600,
                          fontSize: Responsive.isMobile(context)
                              ? 14
                              : Responsive.isTablet(context)
                                  ? 16
                                  : 18,
                        ),
                      ),
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
                        iconSize: Responsive.isMobile(context)
                            ? 32
                            : Responsive.isTablet(context)
                                ? 36
                                : 40,
                        onPressed: cartOnPressed,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
