// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AuthRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AuthPage(),
      );
    },
    BookmarkRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BookmarkPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    MyCourseRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyCoursePage(),
      );
    },
    NoInternetRoute.name: (routeData) {
      final args = routeData.argsAs<NoInternetRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NoInternetPage(
          key: args.key,
          onChanged: args.onChanged,
          isAuth: args.isAuth,
        ),
      );
    },
    ProfileRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProfilePage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SplashPage(),
      );
    },
  };
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
      : super(
          AuthRoute.name,
          initialChildren: children,
        );

  static const String name = 'AuthRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BookmarkPage]
class BookmarkRoute extends PageRouteInfo<void> {
  const BookmarkRoute({List<PageRouteInfo>? children})
      : super(
          BookmarkRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookmarkRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MyCoursePage]
class MyCourseRoute extends PageRouteInfo<void> {
  const MyCourseRoute({List<PageRouteInfo>? children})
      : super(
          MyCourseRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyCourseRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NoInternetPage]
class NoInternetRoute extends PageRouteInfo<NoInternetRouteArgs> {
  NoInternetRoute({
    Key? key,
    required dynamic Function(bool) onChanged,
    bool isAuth = true,
    List<PageRouteInfo>? children,
  }) : super(
          NoInternetRoute.name,
          args: NoInternetRouteArgs(
            key: key,
            onChanged: onChanged,
            isAuth: isAuth,
          ),
          initialChildren: children,
        );

  static const String name = 'NoInternetRoute';

  static const PageInfo<NoInternetRouteArgs> page =
      PageInfo<NoInternetRouteArgs>(name);
}

class NoInternetRouteArgs {
  const NoInternetRouteArgs({
    this.key,
    required this.onChanged,
    this.isAuth = true,
  });

  final Key? key;

  final dynamic Function(bool) onChanged;

  final bool isAuth;

  @override
  String toString() {
    return 'NoInternetRouteArgs{key: $key, onChanged: $onChanged, isAuth: $isAuth}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
