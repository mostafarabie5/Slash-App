import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: "Search Here..",
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(150, 150, 150, 1),
                  ),
                  prefixIcon: Icon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 26,
                    color: Color.fromRGBO(95, 95, 95, 1),
                  ),
                  filled: true,
                  fillColor: Color.fromRGBO(228, 228, 228, 0.52),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromRGBO(228, 228, 228, 0.52),
              ),
              child: const Icon(
                Icons.menu,
                size: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}
