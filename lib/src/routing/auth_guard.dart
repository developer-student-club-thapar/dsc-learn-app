import 'package:auto_route/auto_route.dart';

import '../utils/network_utils.dart';
import 'router.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if (await hasInternetAccess()) {
      // if user is authenticated we continue
      resolver.next(true);
    } else {
      // we redirect the user to our login page
      // tip: use resolver.redirect to have the redirected route
      // automatically removed from the stack when the resolver is completed
      resolver.redirect(NoInternetRoute(onChanged: (success) {
        // if success == true the navigation will be resumed
        // else it will be aborted
        if (success) {
          resolver.next(true);
        }
      }));
    }
  }
}
