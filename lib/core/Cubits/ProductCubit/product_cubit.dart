import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/core/Cubits/ProductCubit/product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  List<dynamic> favorites = [];
  List<Map<String, dynamic>> selectedProduct = [];

  bool isFavorite({required dynamic product}) {
    return favorites.contains(product);
  }

  void addFavorite({required dynamic product}) {
    favorites.add(product);
    emit(AddFavorite());
  }

  void removeFavorite({required dynamic product}) {
    favorites.remove(product);
    emit(RemoveFavorite());
  }

  void addRemoveFavorite({required dynamic product}) {
    if (isFavorite(product: product)) {
      removeFavorite(product: product);
    } else {
      addFavorite(product: product);
    }
  }

  bool inMyCart({required dynamic product}) {
    return selectedProduct.contains(product);
  }

  void addToMyCart({required dynamic product}) {
    selectedProduct.add(product);
    emit(AddToCart());
  }

  void removeFromMyCart({required dynamic product}) {
    selectedProduct.remove(product);
    emit(RemoveFromCart());
  }

  void addRemoveProduct({required dynamic product}) {
    if (inMyCart(product: product)) {
      removeFromMyCart(product: product);
    } else {
      addToMyCart(product: product);
    }
  }
}
