import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../routing/router.dart';

import '../widgets/bottom_bar.dart';

@RoutePage()
class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      animationCurve: Curves.bounceInOut,
      routes: const [
        HomeRoute(),
        MyCourseRoute(),
        BookmarkRoute(),
        ProfileRoute(),
      ],
      bottomNavigationBuilder: (context, tabsRouter) => BottomBar(
        key: ValueKey(tabsRouter.activeIndex),
      ),
    );
  }
}
