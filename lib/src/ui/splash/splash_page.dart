import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dsc_learn_app/src/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../routing/router.dart';

@RoutePage()
class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  bool isChanged = true;
  late final Timer timer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _navigateAfterDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 170,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'GDSC',
              style: GoogleFonts.poppins(
                fontSize: 34,
                height: -1,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Text(
              'Learn',
              style: GoogleFonts.poppins(
                fontSize: 26,
                height: -1,
                color: primaryColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _navigateAfterDelay() async {
    await Future.delayed(const Duration(seconds: 2));
    context.replaceRoute(const MainRoute());
  }
}
