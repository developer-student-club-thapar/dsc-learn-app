import 'dart:io';

/// returns true, if internet is connected
/// returns false, if internet is not connected
/// returns null, if internet connectivity cannot be determined
Future<bool> hasInternetAccess() async {
  try {
    final result = await InternetAddress.lookup('example.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    return false;
  }
  return false;
}
