import 'package:flutter/material.dart';
import 'package:slash/Services/services.dart';
import 'package:slash/core/utils/assets_data.dart';

const Color primaryColor = Color.fromRGBO(41, 41, 41, 1);
const String primaryFont = "Urbanist";

double appBarHeight = AppBar().preferredSize.height;

List<String> categoriesType = [
  "Fashion",
  "Games",
  "Accessories",
  "Books",
];

Map<String, String> sectionJson = {
  "Best Selling": "bestSelling",
  "New Arrival": "newArrival",
  "Recommended for you": "recommendedForYou"
};

Future<Map<String, dynamic>> json =
    Services.jsonLoadFromAssets(AssetsData.jsonPath);
