import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Features/Home/Presentation/ViewModel/HomeCubit/home_cubit.dart';
import 'package:slash/Features/Preferences/Presentation/Manager/PreferencesCubit/preferences_cubit.dart';
import 'package:slash/Features/Home/Presentation/Views/home_view.dart';
import 'package:slash/Features/Preferences/Presentation/Views/preferences_view.dart';
import 'package:slash/Features/SeeAll/presentation/manager/SeeAllCubit/see_all_cubit.dart';
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
          BlocProvider(create: (context) => PreferencesCubit()),
          BlocProvider(create: (context) => ProductCubit()),
          BlocProvider(create: (context) => SeeAllCubit()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: HomeView.id,
          routes: {
            HomeView.id: (context) => const HomeView(),
            PreferencesScreen.id: (context) => const PreferencesScreen(),
            SeeAllView.id: (context) => const SeeAllView(),
          },
        ));
  }
}
