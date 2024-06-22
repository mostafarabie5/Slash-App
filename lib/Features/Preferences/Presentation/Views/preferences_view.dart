import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/core/Cubits/ProductCubit/product_cubit.dart';
import 'package:slash/Features/Preferences/Presentation/Views/Widgets/mobile_favorite_mycart.dart';
import 'package:slash/core/utils/product_model.dart';
import 'package:slash/core/utils/responsive.dart';
import 'package:slash/Features/Preferences/Presentation/Views/Widgets/tablet_favorite_mycart.dart';
import 'package:slash/core/widgets/navigation_bar.dart';
import 'package:slash/core/widgets/slash_app_bar.dart';
import 'package:slash/Features/Preferences/Presentation/Manager/PreferencesCubit/preferences_cubit.dart';
import 'package:slash/Features/Preferences/Presentation/Manager/PreferencesCubit/preferences_state.dart';
import 'package:slash/Features/Preferences/Presentation/Views/Widgets/desktop_avorite_mycart.dart';
import 'package:slash/constants.dart';

class PreferencesScreen extends StatelessWidget {
  const PreferencesScreen({super.key});
  static String id = "MyCartScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SlashAppBar(),
      body: BlocBuilder<PreferencesCubit, PreferencesState>(
        builder: (context, state) {
          return LayoutBuilder(builder: (context, constraints) {
            Icon icon;
            int screenType = BlocProvider.of<PreferencesCubit>(context).type;
            List<ProductModel> products;
            if (screenType == 1) {
              icon = const Icon(Icons.favorite,
                  color: Color.fromARGB(255, 208, 19, 6));
              products = BlocProvider.of<ProductCubit>(context).favorites;
            } else {
              icon = const Icon(Icons.remove_circle, color: primaryColor);
              products = BlocProvider.of<ProductCubit>(context).selectedProduct;
            }
            return Responsive(
                desktop: DesktopFavoriteMyCart(
                    products: products, icon: icon, type: screenType),
                mobile: MobileFavoriteMyCart(
                    products: products, icon: icon, type: screenType),
                tablet: TabletFavoriteMyCart(
                    products: products, icon: icon, type: screenType));
          });
        },
      ),
      bottomNavigationBar: CustomNavigationBar(
          index: BlocProvider.of<PreferencesCubit>(context).type),
    );
  }
}
