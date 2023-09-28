import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../utils/color_utils.dart';

AppBar buildAppBar() {
  return AppBar(
    toolbarHeight: 200,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30))),
    backgroundColor: primaryColor,
    flexibleSpace: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Hi, Lakshaya",
                      style: GoogleFonts.poppins(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: ColorUtils.generateMaterialColor(
                              Colors.white)),
                    ),
                    Text(
                      "Lets start learning!",
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                          color: ColorUtils.generateMaterialColor(
                              Colors.white)),
                    )
                  ],
                ),
                FloatingActionButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(20)),
                    foregroundColor:
                    ColorUtils.generateMaterialColor(Colors.white),
                    backgroundColor: ColorUtils.generateMaterialColor(
                        Colors.white.withAlpha(100)),
                    onPressed: () {},
                    child: const Icon(Icons.notifications))
              ],
            ),
            TextField(
              decoration: InputDecoration(
                  fillColor:
                  ColorUtils.generateMaterialColor(Colors.white),
                  filled: true,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius:
                      BorderRadius.circular(15)),
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30,
                  ),
                  prefixIconColor: primaryColor),
            )
          ],
        ),
      ),
    ),
  );
}