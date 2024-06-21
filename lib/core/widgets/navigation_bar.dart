import 'package:flutter/material.dart';
import 'package:slash/Features/Favorites/Presentation/Views/favorites_screen.dart';
import 'package:slash/Features/Home/Presentation/Views/home_view.dart';
import 'package:slash/Features/MyCart/Presentation/Views/my_cart_screen.dart';

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
            case 1:
              Navigator.pushReplacementNamed(context, FavoritesScreen.id);
            case 2:
              Navigator.pushReplacementNamed(context, MyCartScreen.id);
          }
        });
  }
}
