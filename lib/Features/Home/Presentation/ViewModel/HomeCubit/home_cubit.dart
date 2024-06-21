import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  String? section;
  String? title;
  int currentOffer = 0;

  void refreshPage() {
    emit(Refresh());
  }

  void changeSelectedOffer(int offer) {
    currentOffer = offer;
    emit(HomeSuccess());
  }
}
