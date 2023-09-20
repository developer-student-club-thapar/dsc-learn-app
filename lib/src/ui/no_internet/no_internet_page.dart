import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routing/router.dart';
import '../../utils/network_utils.dart';

@RoutePage()
class NoInternetPage extends ConsumerStatefulWidget {
  final Function(bool hasInternet) onChanged;
  final bool isAuth;
  const NoInternetPage({
    Key? key,
    required this.onChanged,
    this.isAuth = true,
  }) : super(key: key);

  @override
  ConsumerState createState() => _NoInternetPageState();
}

class _NoInternetPageState extends ConsumerState<NoInternetPage> {
  bool isProcessing = false;

  retry() async {
    setState(() => isProcessing = true);

    Future.delayed(
      const Duration(seconds: 1),
      () async {
        if (await hasInternetAccess()) {
          if (widget.isAuth) {
            context.replaceRoute(MainRoute(children: [HomeRoute()]));
          }
          widget.onChanged(true);
        } else {
          widget.onChanged(false);
        }
        setState(() => isProcessing = false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'No internet connection!\nPlease Try Again',
              textAlign: TextAlign.center,
              style: GoogleFonts.outfit(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            if (isProcessing)
              const CircularProgressIndicator.adaptive()
            else
              ElevatedButton(
                onPressed: retry,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Retry',
                    style: GoogleFonts.outfit(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
