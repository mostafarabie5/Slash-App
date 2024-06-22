import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/core/Cubits/ProductCubit/product_cubit.dart';

import 'preferences_state.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  PreferencesCubit() : super(PreferencesInitial());

  int type = 1;

  void removeFromCart(
      {required dynamic product, required BuildContext context}) {
    BlocProvider.of<ProductCubit>(context).removeFromMyCart(product: product);
    emit(RemoveFromCart());
  }

  void removeFavorite(
      {required BuildContext context, required dynamic product}) {
    BlocProvider.of<ProductCubit>(context).removeFavorite(product: product);
    emit(RemoveFavorite());
  }
}
