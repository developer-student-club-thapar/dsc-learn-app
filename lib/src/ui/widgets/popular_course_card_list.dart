import 'package:cached_network_image/cached_network_image.dart';
import 'package:dsc_learn_app/src/constants/urls.dart';
import 'package:dsc_learn_app/src/utils/no_overscroll_behavior.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../utils/color_utils.dart';
import 'course_tags.dart';

class PopularCourseCardList extends StatelessWidget {
  const PopularCourseCardList({
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
          itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CachedNetworkImage(
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      imageUrl: courseImageUrl,
                      imageBuilder: (context, imageProvider) => Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover, image: imageProvider),
                              borderRadius: BorderRadius.circular(20)),
                          height: 120,
                          // width: 200,
                          width: MediaQuery.of(context).size.width / 2,
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6)),
                                    minimumSize: Size.zero,
                                    padding: const EdgeInsets.all(2),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        size: 20,
                                        color: ColorUtils.generateMaterialColor(
                                            Colors.amber),
                                      ),
                                      Text(
                                        "4.8",
                                        style:
                                            GoogleFonts.poppins(fontSize: 16),
                                      ),
                                    ],
                                  ),
                                  onPressed: () {},
                                ),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      minimumSize: Size.zero,
                                      padding: const EdgeInsets.all(2),
                                    ),
                                    onPressed: () {},
                                    child: const Icon(
                                      Icons.bookmark,
                                      color: primaryColor,
                                    ))
                              ],
                            ),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Course Name",
                            style: GoogleFonts.poppins(fontSize: 16),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CourseTag(
                            tagType: index.isEven
                                ? TagType.trending
                                : TagType.mostLiked,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
    );
  }
}
