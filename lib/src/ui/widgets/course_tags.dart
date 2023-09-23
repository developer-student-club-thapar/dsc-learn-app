import 'package:dsc_learn_app/src/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

enum TagType { mostLiked, trending, courseType }

extension TagTypeExtension on TagType {
  Color? get color {
    switch (this) {
      case TagType.mostLiked:
        return ColorUtils.generateMaterialColor(
            const Color.fromARGB(255, 255, 251, 151));
      case TagType.trending:
        return ColorUtils.generateMaterialColor(
            const Color.fromARGB(255, 185, 233, 181));
      case TagType.courseType:
        return ColorUtils.generateMaterialColor(
            const Color.fromARGB(255, 181, 189, 233));
      default:
        return null;
    }
  }

  Color? get textColor {
    switch (this) {
      case TagType.mostLiked:
        return ColorUtils.generateMaterialColor(
            const Color.fromARGB(255, 147, 141, 4));
      case TagType.trending:
        return ColorUtils.generateMaterialColor(
            const Color.fromARGB(255, 49, 165, 8));
      case TagType.courseType:
        return ColorUtils.generateMaterialColor(
            const Color.fromARGB(255, 20, 8, 165));
      default:
        return null;
    }
  }
}

class CourseTag extends StatelessWidget {
  final TagType tagType;
  final String title;
  const CourseTag({super.key, required this.tagType, this.title = ""});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          color: tagType.color),
      child: Text(
        tagType == TagType.courseType
            ? title
            : tagType == TagType.mostLiked
                ? "Most Liked"
                : "Trending",
        style: GoogleFonts.poppins(
            color: tagType.textColor,
            fontSize: 12,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
