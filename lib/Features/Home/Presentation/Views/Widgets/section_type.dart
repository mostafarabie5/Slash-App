import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slash/Features/SeeAll/presentation/manager/SeeAllCubit/see_all_cubit.dart';
import 'package:slash/Features/SeeAll/presentation/views/see_all_view.dart';
import 'package:slash/constants.dart';
import 'package:slash/core/utils/responsive.dart';

class SectionType extends StatelessWidget {
  const SectionType({super.key, required this.type});
  final String type;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Text(
            type,
            style: TextStyle(
              color: primaryColor,
              fontSize: Responsive.isMobile(context)
                  ? 24
                  : Responsive.isTablet(context)
                      ? 32
                      : 40,
              fontFamily: primaryFont,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              BlocProvider.of<SeeAllCubit>(context).title = type;

              BlocProvider.of<SeeAllCubit>(context).section =
                  (type != "Categories") ? sectionJson[type]! : "";
              Navigator.pushNamed(context, SeeAllView.id);
            },
            child: Row(
              children: [
                Text(
                  "See all",
                  style: TextStyle(
                      fontFamily: primaryFont,
                      fontSize: Responsive.isMobile(context)
                          ? 18
                          : Responsive.isTablet(context)
                              ? 22
                              : 28,
                      fontWeight: FontWeight.w500,
                      color: primaryColor),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12),
                  color: const Color.fromRGBO(230, 230, 230, 1),
                  child: const Icon(Icons.arrow_forward_ios),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
