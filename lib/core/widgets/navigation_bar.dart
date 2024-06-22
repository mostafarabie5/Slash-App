import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Features/Home/Presentation/Views/home_view.dart';
import 'package:slash/Features/Preferences/Presentation/Manager/PreferencesCubit/preferences_cubit.dart';
import 'package:slash/Features/Preferences/Presentation/Views/preferences_view.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: index,
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: (index == 1)
                ? const Icon(Icons.favorite)
                : const Icon(Icons.favorite_border),
            label: "Favorites",
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "My Cart",
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2,
            ),
            label: "Profile",
          ),
        ],
        onTap: (actionIndex) {
          if (actionIndex == index) {
            return;
          }
          switch (actionIndex) {
            case 0:
              Navigator.pushReplacementNamed(context, HomeView.id);
              break;
            case 1:
              BlocProvider.of<PreferencesCubit>(context).type = 1;
              Navigator.pushReplacementNamed(context, PreferencesScreen.id);
              break;
            case 2:
              BlocProvider.of<PreferencesCubit>(context).type = 2;
              Navigator.pushReplacementNamed(context, PreferencesScreen.id);
              break;
          }
        });
  }
}
