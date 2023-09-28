import 'package:dsc_learn_app/src/utils/no_overscroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';
import '../../../utils/color_utils.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: NoOverscrollScrollBehavior(),
      child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          scrollDirection: Axis.horizontal,
          itemCount: 5,
          itemBuilder: (context, index) => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorUtils.generateMaterialColor(
                                categoryButtonColor),
                            shape: const CircleBorder(),
                            fixedSize: const Size.square(70)),
                        onPressed: () {},
                        child: const Icon(Icons.language)),
                  ),
                  Text("Web Dev",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                      ))
                ],
              )),
    );
  }
}
