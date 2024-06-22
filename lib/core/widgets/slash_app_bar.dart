import 'package:flutter/material.dart';
import 'package:slash/constants.dart';

class SlashAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SlashAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Slash.",
            style: TextStyle(
              color: primaryColor,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.location_on_rounded,
                size: 26,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Text("Nast City",
                        style: TextStyle(
                          fontSize: 15,
                        )),
                    Text(
                      "Cairo",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w600,
                        fontFamily: primaryFont,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: primaryColor,
                size: 36,
              ),
            ],
          ),
          Icon(
            Icons.notifications_none_outlined,
            size: 30,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => new Size.fromHeight(kToolbarHeight);
}
