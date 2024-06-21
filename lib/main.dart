import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Features/Favorites/Presentation/Manager/FavoritesCubit/favorites_cubit.dart';
import 'package:slash/Features/Home/Presentation/ViewModel/HomeCubit/home_cubit.dart';
import 'package:slash/Features/MyCart/Presentation/Manager/MyCartCubit/my_cart_cubit.dart';
import 'package:slash/Features/Favorites/Presentation/Views/favorites_screen.dart';
import 'package:slash/Features/Home/Presentation/Views/home_view.dart';
import 'package:slash/Features/MyCart/Presentation/Views/my_cart_screen.dart';
import 'package:slash/Features/SeeAll/presentation/views/see_all_view.dart';
import 'package:slash/core/Cubits/ProductCubit/product_cubit.dart';

void main() {
  runApp(const SlashApp());
}

class SlashApp extends StatelessWidget {
  const SlashApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => HomeCubit()),
          BlocProvider(create: (context) => FavoritesCubit()),
          BlocProvider(create: (context) => MyCartCubit()),
          BlocProvider(create: (context) => ProductCubit())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: HomeView.id,
          routes: {
            HomeView.id: (context) => HomeView(),
            FavoritesScreen.id: (context) => FavoritesScreen(),
            MyCartScreen.id: (context) => MyCartScreen(),
            SeeAllView.id: (context) => SeeAllView(),
          },
        ));
  }
}
