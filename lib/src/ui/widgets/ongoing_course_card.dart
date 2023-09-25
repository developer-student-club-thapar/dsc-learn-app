import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/urls.dart';
import '../../utils/color_utils.dart';
import 'course_tags.dart';

class OngoingCourseCard extends StatelessWidget {
  const OngoingCourseCard({
    super.key,
    required double progValue,
  }) : _progValue = progValue;

  final double _progValue;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(15),
            border: Border.all(
                color: ColorUtils.generateMaterialColor(
                    Colors.black))),
        height: 140,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                CachedNetworkImage(
                  placeholder: (context, url) => const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  imageUrl: courseImageUrl,
                  imageBuilder:(context, imageProvider) => Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: imageProvider),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                const Padding(
                    padding:
                    EdgeInsets.symmetric(horizontal: 8)),
                Expanded(
                  child: SizedBox(
                    height: 125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        const CourseTag(
                          tagType: TagType.courseType,
                          title: "UI/UX",
                        ),
                        Text(
                          "Course Name #2",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        RichText(
                            text: TextSpan(
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14, color: ColorUtils.generateMaterialColor(Colors.black54)),
                                text: 'Status: ',
                                children: [
                                  TextSpan(
                                    text: 'Ongoing',
                                    style: GoogleFonts.poppins(
                                        color: const Color.fromARGB(
                                            255, 138, 180, 112)),
                                  )
                                ])),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: LinearProgressIndicator(
                                  borderRadius: BorderRadius.circular(20) ,
                                  minHeight: 10,
                                  value: _progValue,
                                  backgroundColor: ColorUtils
                                      .generateMaterialColor(
                                      Colors.black26),
                                  color: ColorUtils
                                      .generateMaterialColor(
                                      Colors.black45),
                                ),
                              ),
                            ),
                            Text(
                                "${(_progValue * 100).toInt()}/100",
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w300,
                                ))
                          ],
                        ),

                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}

