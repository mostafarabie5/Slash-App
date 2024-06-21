import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/core/Cubits/ProductCubit/product_cubit.dart';

import 'my_cart_state.dart';

class MyCartCubit extends Cubit<MyCartState> {
  MyCartCubit() : super(MyCartInitial());

  void removeFromCart(
      {required dynamic product, required BuildContext context}) {
    BlocProvider.of<ProductCubit>(context).removeFromMyCart(product: product);
    emit(RemoveFromCart());
  }
}
