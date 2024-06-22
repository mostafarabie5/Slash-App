import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Features/Favorites/Presentation/Manager/FavoritesCubit/favorites_cubit.dart';
import 'package:slash/Features/MyCart/Presentation/Manager/MyCartCubit/my_cart_cubit.dart';
import 'package:slash/constants.dart';
import 'package:slash/core/utils/product_model.dart';

class FavoriteMyCartProduct extends StatelessWidget {
  const FavoriteMyCartProduct({
    super.key,
    required this.products,
    required this.icon,
    required this.type,
  });
  final List<ProductModel> products;
  final Icon icon;
  final int type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 25, right: 20),
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    height: MediaQuery.of(context).size.height * .13,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(products[index].image),
                          fit: BoxFit.fitWidth),
                    ),
                    child: const AspectRatio(
                      aspectRatio: 1,
                    )),
                Column(
                  children: [
                    Text(
                      products[index].name,
                      style: const TextStyle(
                        color: primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        fontFamily: primaryFont,
                      ),
                      softWrap: false,
                      overflow: TextOverflow.clip,
                    ),
                    Text(
                      products[index].price.toString(),
                      style: const TextStyle(
                        color: primaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: primaryFont,
                      ),
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {
                      switch (type) {
                        case 1:
                          BlocProvider.of<FavoritesCubit>(context)
                              .removeFavorite(
                                  context: context, product: products[index]);
                        case 2:
                          BlocProvider.of<MyCartCubit>(context).removeFromCart(
                              context: context, product: products[index]);
                      }
                    },
                    icon: icon)
              ],
            ),
          );
        },
      ),
    );
  }
}
