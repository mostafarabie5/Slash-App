import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Features/Home/Presentation/ViewModel/HomeCubit/home_cubit.dart';
import 'package:slash/Features/Home/Presentation/ViewModel/HomeCubit/home_state.dart';
import 'package:slash/Features/Home/Presentation/Views/Widgets/offer_item.dart';
import 'package:slash/constants.dart';
import 'package:slash/core/utils/assets_data.dart';
import 'package:slash/core/utils/responsive.dart';

class Offers extends StatelessWidget {
  const Offers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(builder: (context, state) {
      return Column(
        children: [
          CarouselSlider.builder(
            itemCount: AssetsData.offers.length,
            itemBuilder: (context, index, pageView) {
              return OfferItem(offerImage: AssetsData.offers[index]);
            },
            options: CarouselOptions(
                aspectRatio: Responsive.isMobile(context)
                    ? 25 / 10
                    : Responsive.isTablet(context)
                        ? 3.5 / 1
                        : 4.4 / 1,
                autoPlay: false,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  BlocProvider.of<HomeCubit>(context)
                      .changeSelectedOffer(index);
                }),
          ),
          DotsIndicator(
            dotsCount: AssetsData.offers.length,
            position: BlocProvider.of<HomeCubit>(context).currentOffer,
            decorator: const DotsDecorator(
              activeColor: primaryColor,
              size: Size.square(5),
              activeSize: Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          )
        ],
      );
    });
  }
}
