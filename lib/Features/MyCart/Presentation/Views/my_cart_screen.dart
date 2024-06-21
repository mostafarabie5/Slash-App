import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/core/Cubits/ProductCubit/product_cubit.dart';
import 'package:slash/core/widgets/navigation_bar.dart';
import 'package:slash/core/widgets/slash_app_bar.dart';
import 'package:slash/Features/MyCart/Presentation/Manager/MyCartCubit/my_cart_cubit.dart';
import 'package:slash/Features/MyCart/Presentation/Manager/MyCartCubit/my_cart_state.dart';
import 'package:slash/Models/favorite_mycart_product.dart';
import 'package:slash/constants.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});
  static String id = "MyCartScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SlashAppBar(),
        bottomNavigationBar: const CustomNavigationBar(index: 2),
        body: BlocBuilder<MyCartCubit, MyCartState>(
          builder: (context, state) {
            return FavoriteMyCartProduct(
                products:
                    BlocProvider.of<ProductCubit>(context).selectedProduct,
                icon: const Icon(
                  Icons.remove_circle,
                  color: primaryColor,
                ),
                type: 2);
          },
        ));
  }
}
