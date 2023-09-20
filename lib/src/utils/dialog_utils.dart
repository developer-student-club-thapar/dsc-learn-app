import 'dart:io';

import 'package:flutter/material.dart';

import '../constants/colors.dart';

/// shows a bottom sheet
/// handles scenario of bottom sheet overlapping status bar
Future<T?> showDSCLearnBottomSheet<T>({
  required BuildContext context,
  required Widget Function(BuildContext context) builder,
  bool isScrollControlled = true,
  bool useRootNavigator = true,
  bool isDismissible = true,
  bool enableDrag = true,
  int topMargin = 0,
}) =>
    showModalBottomSheet<T>(
      isScrollControlled: isScrollControlled,
      useRootNavigator: useRootNavigator,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (_) => Container(
        margin: EdgeInsets.only(
          top: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                  .padding
                  .top +
              topMargin,
        ),
        padding: EdgeInsets.only(
          bottom: (Platform.isIOS ? 20 : 0),
        ),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          color: scaffoldColor,
        ),
        child: builder(_),
      ),
    );
