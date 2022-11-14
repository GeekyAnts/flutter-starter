import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common_export.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    ref.read(authProvider.notifier).appLoadedup();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    UiSizeConfig().init(context);

    ref.listen<AuthMode>(authProvider, (previous, next) {
      if (next == AuthMode.appAutheticated) {
        context.go('/home');
      }
      if (next == AuthMode.authenticationStart) {
        context.go('/login');
      }
      if (next == AuthMode.userLogoutState) {
        context.go('/login');
      }
    });

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Image.asset(AllImages().logo),
      ),
    );
  }
}
