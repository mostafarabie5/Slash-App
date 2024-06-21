import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Features/Favorites/Presentation/Manager/FavoritesCubit/favorites_states.dart';
import 'package:slash/core/Cubits/ProductCubit/product_cubit.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  FavoritesCubit() : super(FavoritesInitial());
  void removeFavorite(
      {required BuildContext context, required dynamic product}) {
    BlocProvider.of<ProductCubit>(context).removeFavorite(product: product);
    emit(FavoriteRemoval());
  }
}
