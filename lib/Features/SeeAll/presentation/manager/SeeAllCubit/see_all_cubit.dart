import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Features/SeeAll/presentation/manager/SeeAllCubit/see_all_state.dart';
import 'package:slash/Services/services.dart';
import 'package:slash/core/utils/assets_data.dart';
import 'package:slash/core/utils/product_model.dart';

class SeeAllCubit extends Cubit<SeeAllState> {
  SeeAllCubit() : super(SeeAllInitial());

  String? section;
  String? title;

  ProductServices serviceModel = ProductServices();
  Future<Map<String, List<ProductModel>>> getProducts() async {
    emit(SeeAllLoading());
    Map<String, List<ProductModel>> products = {};

    try {
      products = await serviceModel.jsonLoadFromAssets(AssetsData.jsonPath);
      emit(SeeAllSuccess());
    } catch (ex) {
      emit(SeeAllFailure());
    }
    return products;
  }
}
