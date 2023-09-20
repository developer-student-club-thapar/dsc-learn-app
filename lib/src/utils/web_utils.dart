import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

openUrl(String url) async {
  if (url.isEmpty) return;
  final uri = Uri.parse(url);
  try {
    final isSuccess = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
    if (!isSuccess) {
      debugPrint('cannot launch url');
      Fluttertoast.showToast(
          msg: 'Something went wrong. Unable to open the link!');
    }
  } catch (e) {
    debugPrint(e.toString());
    Fluttertoast.showToast(
        msg: 'Something went wrong. Unable to open the link!');
  }
}
