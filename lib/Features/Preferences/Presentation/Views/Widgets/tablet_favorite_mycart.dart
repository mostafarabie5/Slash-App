import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Features/Preferences/Presentation/Manager/PreferencesCubit/preferences_cubit.dart';
import 'package:slash/constants.dart';
import 'package:slash/core/utils/product_model.dart';

class TabletFavoriteMyCart extends StatelessWidget {
  const TabletFavoriteMyCart({
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
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
            products.length,
            (index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        height: MediaQuery.of(context).size.width * .20,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(products[index].image),
                              fit: BoxFit.fitHeight),
                        ),
                        child: const AspectRatio(
                          aspectRatio: 1,
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          products[index].name,
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 32,
                            fontWeight: FontWeight.w600,
                            fontFamily: primaryFont,
                          ),
                          overflow: TextOverflow.clip,
                        ),
                        Text(
                          products[index].price.toString(),
                          style: const TextStyle(
                            color: primaryColor,
                            fontSize: 18,
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
                              BlocProvider.of<PreferencesCubit>(context)
                                  .removeFavorite(
                                      context: context,
                                      product: products[index]);
                            case 2:
                              BlocProvider.of<PreferencesCubit>(context)
                                  .removeFromCart(
                                      context: context,
                                      product: products[index]);
                          }
                        },
                        icon: icon)
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
