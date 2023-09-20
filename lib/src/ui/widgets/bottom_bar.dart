import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class BottomBar extends ConsumerStatefulWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends ConsumerState<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 10,
            color: Color.fromRGBO(0, 0, 0, 25),
          )
        ],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SafeArea(
            child: Container(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 7,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _NavigationBarItem(
                    icon: CupertinoIcons.home,
                    isActive: context.tabsRouter.activeIndex == 0,
                    title: 'Home',
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      context.tabsRouter.setActiveIndex(0);
                    },
                  ),
                  _NavigationBarItem(
                    icon: CupertinoIcons.book,
                    title: 'My Course',
                    isActive: context.tabsRouter.activeIndex == 1,
                    onTap: () async {
                      FocusScope.of(context).unfocus();

                      context.tabsRouter.setActiveIndex(1);
                    },
                  ),
                  _NavigationBarItem(
                    icon: CupertinoIcons.bookmark_fill,
                    title: 'Bookmark',
                    isActive: context.tabsRouter.activeIndex == 2,
                    onTap: () async {
                      FocusScope.of(context).unfocus();

                      context.tabsRouter.setActiveIndex(2);
                    },
                  ),
                  _NavigationBarItem(
                    icon: Icons.person,
                    title: 'Profile',
                    isActive: context.tabsRouter.activeIndex == 3,
                    onTap: () async {
                      FocusScope.of(context).unfocus();

                      context.tabsRouter.setActiveIndex(3);
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavigationBarItem extends StatelessWidget {
  final bool isActive;

  final VoidCallback onTap;
  final IconData icon;
  final String title;

  const _NavigationBarItem({
    required this.isActive,
    required this.onTap,
    required this.title,
    required this.icon,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = isActive ? primaryColor : Colors.black.withOpacity(0.5);

    return SizedBox(
      width: 80,
      height: 48,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: color,
            ),
            Text(
              title,
              style: GoogleFonts.outfit(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
