import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/auth/auth_page.dart';
import '../ui/bookmark/bookmark_page.dart';
import '../ui/home/home_page.dart';
import '../ui/main/main_page.dart';
import '../ui/my_course/my_course_page.dart';
import '../ui/no_internet/no_internet_page.dart';
import '../ui/profile/profile_page.dart';
import '../ui/splash/splash_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/',
      page: SplashRoute.page,
    ),
    AutoRoute(
      path: '/auth',
      page: AuthRoute.page,
    ),
    AutoRoute(
      path: '/main',
      page: MainRoute.page,
      children: [
        AutoRoute(
          path: 'home',
          page: HomeRoute.page,
        ),
        AutoRoute(
          path: 'my-course',
          page: MyCourseRoute.page,
        ),
        AutoRoute(
          path: 'bookmark',
          page: BookmarkRoute.page,
        ),
        AutoRoute(
          path: 'profile',
          page: ProfileRoute.page,
        ),
      ],
    ),
    AutoRoute(
      path: '/no-internet',
      page: NoInternetRoute.page,
    ),
  ];
}
