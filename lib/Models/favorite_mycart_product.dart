import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Features/Favorites/Presentation/Manager/FavoritesCubit/favorites_cubit.dart';
import 'package:slash/Features/MyCart/Presentation/Manager/MyCartCubit/my_cart_cubit.dart';

class FavoriteMyCartProduct extends StatelessWidget {
  const FavoriteMyCartProduct({
    super.key,
    required this.products,
    required this.icon,
    required this.type,
  });
  final List<dynamic> products;
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
                Image(
                  image: AssetImage(
                    products[index]["image"],
                  ),
                  width: 100,
                  height: 120,
                  fit: BoxFit.fitWidth,
                ),
                Column(
                  children: [
                    Text(products[index]["name"]),
                    Text(products[index]["price"].toString())
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
