import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_learn_app/src/constants/colors.dart';
import 'package:dsc_learn_app/src/ui/widgets/course_tags.dart';
import 'package:dsc_learn_app/src/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/home_app_bar.dart';
import '../widgets/ongoing_course_card.dart';
import '../widgets/popular_course_card_list.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double _progValue = 0.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Categories",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container( // Category buttons, need to evenly space it (possible with Row() Widget and selection MainAxisAlignment.spaceBetween)
                  height: 120,
                  alignment: Alignment.center,
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        ColorUtils.generateMaterialColor(
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
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  "Popular Course",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 210,
                  child: PopularCourseCardList(), // Right padding issue
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Course Learning",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: OngoingCourseCard(progValue: _progValue),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}