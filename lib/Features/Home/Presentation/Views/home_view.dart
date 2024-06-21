import 'package:flutter/material.dart';
import 'package:slash/core/widgets/navigation_bar.dart';
import 'package:slash/Features/Home/Presentation/Views/Widgets/search_box.dart';
import 'package:slash/core/widgets/slash_app_bar.dart';
import 'package:slash/Features/Home/Presentation/Views/Widgets/offers.dart';
import 'package:slash/Features/Home/Presentation/Views/Widgets/categories.dart';
import 'package:slash/Features/Home/Presentation/Views/Widgets/products_list.dart';
import 'package:slash/Features/Home/Presentation/Views/Widgets/section_type.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  static String id = "HomeView";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: CustomNavigationBar(index: 0),
      appBar: SlashAppBar(),
      body: Padding(
        padding: EdgeInsets.only(top: 30, right: 20, left: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchBox(),
              Offers(),
              SectionType(type: "Categories"),
              Categories(),
              SectionType(type: "Best Selling"),
              ProductsList(section: "bestSelling"),
              SectionType(type: "New Arrival"),
              ProductsList(section: "newArrival"),
              SectionType(type: "Recommended for you"),
              ProductsList(section: "recommendedForYou"),
            ],
          ),
        ),
      ),
    );
  }
}
