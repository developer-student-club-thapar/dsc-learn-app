// 🐦 Flutter imports:
import 'package:flutter/widgets.dart';

class NoOverscrollScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) =>
      child;
}
