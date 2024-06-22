import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Services/services.dart';
import 'package:slash/core/utils/assets_data.dart';
import 'package:slash/core/utils/product_model.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  int currentOffer = 0;
  ProductServices serviceModel = ProductServices();
  void refreshPage() {
    emit(Refresh());
  }

  void changeSelectedOffer(int offer) {
    currentOffer = offer;
    emit(HomeSuccess());
  }

  Future<Map<String, List<ProductModel>>> getProducts() async {
    emit(HomeLoading());
    Map<String, List<ProductModel>> products = {};

    try {
      products = await serviceModel.jsonLoadFromAssets(AssetsData.jsonPath);
      emit(HomeSuccess());
    } catch (ex) {
      emit(HomeFailure());
    }
    return products;
  }
}
