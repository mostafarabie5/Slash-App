import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/core/Cubits/ProductCubit/product_cubit.dart';
import 'package:slash/core/widgets/navigation_bar.dart';
import 'package:slash/core/widgets/slash_app_bar.dart';
import 'package:slash/Features/Favorites/Presentation/Manager/FavoritesCubit/favorites_cubit.dart';
import 'package:slash/Features/Favorites/Presentation/Manager/FavoritesCubit/favorites_states.dart';
import 'package:slash/Features/SeeAll/presentation/views/widgets/favorite_mycart_product.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  static String id = "FavoritesScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SlashAppBar(),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          return FavoriteMyCartProduct(
            products: BlocProvider.of<ProductCubit>(context).favorites,
            icon: const Icon(
              Icons.favorite,
              color: Color.fromARGB(255, 208, 19, 6),
            ),
            type: 1,
          );
        },
      ),
      bottomNavigationBar: const CustomNavigationBar(index: 1),
    );
  }
}
