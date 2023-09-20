import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../logic/repositories/app_repository/app_repository.dart';
import '../../routing/router.dart';
import '../../utils/toast_utils.dart';
import 'auth_page_model.dart';

@RoutePage()
class AuthPage extends ConsumerWidget {
  const AuthPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(appRepositoryProvider, (previous, next) {
      if (next.status != previous?.status) {
        if (next.status == AppStatus.authenticated) {
          context.replaceRoute(const MainRoute());
        }
      }
    });
    ref.listen(authPageModelProvider, (previous, next) {
      if (next.status == AuthPageStatus.error) {}
    });
    final status = ref.watch(
      authPageModelProvider.select((_) => _.status),
    );

    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 160,
                ),
                Center(
                  child: Text(
                    'DSC Learn App',
                    style: GoogleFonts.michroma(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: InkWell(
                    onTap: () async {
                      if (status != AuthPageStatus.authenticating) {
                        final res = await ref
                            .read(authPageModelProvider.notifier)
                            .signin();
                        if (res == '') {
                          showSuccessMessage(
                              context, 'User Signed In Succesfully');
                        } else {
                          showErrorMessage(context, res);
                        }
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          width: 2,
                          color: Colors.white,
                        ),
                        color: Colors.transparent,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: status == AuthPageStatus.authenticating ||
                                status == AuthPageStatus.authenticated
                            ? const Center(
                                child: SizedBox(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 3,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      "Continue With Google",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.outfit(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
