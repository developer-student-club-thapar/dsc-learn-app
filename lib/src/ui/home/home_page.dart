import 'package:auto_route/auto_route.dart';
import 'package:dsc_learn_app/src/constants/colors.dart';
import 'package:dsc_learn_app/src/ui/widgets/course_tags.dart';
import 'package:dsc_learn_app/src/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        appBar: AppBar(
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
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
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
                        border: const OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
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
        ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      ColorUtils.generateMaterialColor(
                                          const Color.fromARGB(
                                              255, 217, 217, 217)),
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
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      ColorUtils.generateMaterialColor(
                                          const Color.fromARGB(
                                              255, 217, 217, 217)),
                                  shape: const CircleBorder(),
                                  fixedSize: const Size.square(70)),
                              onPressed: () {},
                              child: const Icon(Icons.android)),
                        ),
                        Text("App Dev",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    ColorUtils.generateMaterialColor(
                                        const Color.fromARGB(
                                            255, 217, 217, 217)),
                                shape: const CircleBorder(),
                                fixedSize: const Size.square(70),
                              ),
                              onPressed: () {},
                              child: const Icon(Icons.draw)),
                        ),
                        Text("Designing",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      ColorUtils.generateMaterialColor(
                                          const Color.fromARGB(
                                              255, 217, 217, 217)),
                                  shape: const CircleBorder(),
                                  fixedSize: const Size.square(70)),
                              onPressed: () {},
                              child: const Icon(Icons.code)),
                        ),
                        Text("Dev Ops",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                            ))
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Popular Course",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                        5,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                  "https://media.istockphoto.com/id/1322277517/photo/wild-grass-in-the-mountains-at-sunset.jpg?s=612x612&w=0&k=20&c=6mItwwFFGqKNKEAzv0mv6TaxhLN3zSE43bWmFN--J5w=")),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      height: 120,
                                      // width: 200,
                                      width:
                                          MediaQuery.of(context).size.width / 2,
                                      alignment: Alignment.topCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ElevatedButton(
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    size: 15,
                                                    color: ColorUtils
                                                        .generateMaterialColor(
                                                            Colors.amber),
                                                  ),
                                                  const Text("4.8"),
                                                ],
                                              ),
                                              onPressed: () {},
                                            ),
                                            ElevatedButton(
                                                onPressed: () {},
                                                child: const Icon(
                                                  Icons.bookmark,
                                                  color: primaryColor,
                                                ))
                                          ],
                                        ),
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Course Name",
                                          style:
                                              GoogleFonts.poppins(fontSize: 16),
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
                  ),
                ),
                const SizedBox(
                  height: 40,
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
                    child: Container(
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            border: Border.all(
                                color: ColorUtils.generateMaterialColor(
                                    Colors.black))),
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.center,
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 125,
                                  width: 125,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "https://media.istockphoto.com/id/1322277517/photo/wild-grass-in-the-mountains-at-sunset.jpg?s=612x612&w=0&k=20&c=6mItwwFFGqKNKEAzv0mv6TaxhLN3zSE43bWmFN--J5w=")),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                ),
                                const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8)),
                                Expanded(
                                  child: SizedBox(
                                    height: 125,
                                    child: Column(
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
                                          height: 20,
                                        ),
                                        RichText(
                                            text: TextSpan(
                                                style: GoogleFonts.poppins(
                                                    fontSize: 13),
                                                text: 'Status: ',
                                                children: [
                                              TextSpan(
                                                text: 'Ongoing',
                                                style: GoogleFonts.poppins(
                                                    fontSize: 13,
                                                    color: const Color.fromARGB(
                                                        255, 138, 180, 112)),
                                              )
                                            ])),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 8.0),
                                          child: LinearProgressIndicator(
                                            value: _progValue,
                                            backgroundColor: ColorUtils
                                                .generateMaterialColor(
                                                    Colors.black26),
                                            color: ColorUtils
                                                .generateMaterialColor(
                                                    Colors.black45),
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
                                  ),
                                )
                              ],
                            ))),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
