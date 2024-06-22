import 'package:flutter/material.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({super.key, required this.offerImage});
  final String offerImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(offerImage),
          filterQuality: FilterQuality.high,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
