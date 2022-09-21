import 'package:flutter/material.dart';
import 'package:flutter_starter/flutter_starter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SplashProviderScreen extends StatefulWidget {
  const SplashProviderScreen({Key? key}) : super(key: key);

  @override
  State<SplashProviderScreen> createState() => _SplashProviderScreenState();
}

class _SplashProviderScreenState extends State<SplashProviderScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthenticationProvider>().getUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    UiSizeConfig().init(context);
    AuthenticationProvider provider =
        Provider.of<AuthenticationProvider>(context);
    if (provider.status[provider.fetchUserDataStatus] == Status.done &&
        provider.currentUserData != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/home');
      });
    } else if (provider.status[provider.fetchUserDataStatus] == Status.done &&
        provider.currentUserData == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/login');
      });
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Consumer<AuthenticationProvider>(
        builder:
            (BuildContext context, AuthenticationProvider provider, child) {
          if (provider.status[provider.fetchUserDataStatus] == Status.loading) {
            return Center(child: Image.asset(AllImages().logo));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
