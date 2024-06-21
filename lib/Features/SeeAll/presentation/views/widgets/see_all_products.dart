import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Features/Home/Presentation/ViewModel/HomeCubit/home_cubit.dart';
import 'package:slash/Features/Home/Presentation/Views/Widgets/product_card.dart';
import 'package:slash/constants.dart';
import 'package:slash/core/Cubits/ProductCubit/product_cubit.dart';

class SeeAllProducts extends StatelessWidget {
  const SeeAllProducts({super.key, required this.snapShot});
  final AsyncSnapshot<dynamic> snapShot;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            BlocProvider.of<HomeCubit>(context).title ?? "",
            softWrap: true,
            style: const TextStyle(
                color: primaryColor,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: primaryFont),
          ),
        ),
        Expanded(
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 10 / 11,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 2,
              ),
              itemCount: snapShot
                  .data![BlocProvider.of<HomeCubit>(context).section].length,
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
              itemBuilder: (context, index) {
                dynamic product = snapShot
                    .data![BlocProvider.of<HomeCubit>(context).section][index];

                return ProductCard(
                  product: product,
                  favoriteOnPressed: () {
                    BlocProvider.of<ProductCubit>(context)
                        .addRemoveFavorite(product: product);
                  },
                  cartOnPressed: () {
                    BlocProvider.of<ProductCubit>(context)
                        .addRemoveProduct(product: product);
                  },
                );
              }),
        )
      ],
    );
  }
}




// class SeeAllProducts extends StatelessWidget {
//   const SeeAllProducts({super.key, required this.snapShot});
//   final AsyncSnapshot<dynamic> snapShot;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.only(left: 10),
//           child: Align(
//             alignment: Alignment.centerLeft,
//             child: Text(
//               BlocProvider.of<SeeAllCubit>(context).title,
//               softWrap: true,
//               style: const TextStyle(
//                   color: primaryColor,
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                   fontFamily: primaryFont),
//             ),
//           ),
//         ),
//         Expanded(
//           child: GridView.builder(
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2),
//               itemCount: snapShot
//                   .data![BlocProvider.of<SeeAllCubit>(context).section].length,
//               padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
//               itemBuilder: (context, index) {
//                 dynamic product = snapShot
//                         .data![BlocProvider.of<SeeAllCubit>(context).section]
//                     [index];

//                 return ProductCard(
//                   product: product,
//                   favoriteOnPressed: () {
//                     BlocProvider.of<SeeAllCubit>(context)
//                         .addRemoveFavorite(context: context, product: product);
//                   },
//                   cartOnPressed: () {
//                     BlocProvider.of<SeeAllCubit>(context)
//                         .addRemoveProduct(context: context, product: product);
//                   },
//                 );
//               }),
//         )
//       ],
//     );
//   }
// }
