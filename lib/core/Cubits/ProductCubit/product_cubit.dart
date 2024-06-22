import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/core/Cubits/ProductCubit/product_state.dart';
import 'package:slash/core/utils/product_model.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  List<ProductModel> favorites = [];
  List<ProductModel> selectedProduct = [];

  bool isFavorite({required ProductModel product}) {
    return favorites.contains(product);
  }

  void addFavorite({required ProductModel product}) {
    favorites.add(product);
    emit(AddFavorite());
  }

  void removeFavorite({required ProductModel product}) {
    favorites.remove(product);
    emit(RemoveFavorite());
  }

  void addRemoveFavorite({required ProductModel product}) {
    if (isFavorite(product: product)) {
      removeFavorite(product: product);
    } else {
      addFavorite(product: product);
    }
  }

  bool inMyCart({required ProductModel product}) {
    return selectedProduct.contains(product);
  }

  void addToMyCart({required ProductModel product}) {
    selectedProduct.add(product);
    emit(AddToCart());
  }

  void removeFromMyCart({required ProductModel product}) {
    selectedProduct.remove(product);
    emit(RemoveFromCart());
  }

  void addRemoveProduct({required ProductModel product}) {
    if (inMyCart(product: product)) {
      removeFromMyCart(product: product);
    } else {
      addToMyCart(product: product);
    }
  }
}
