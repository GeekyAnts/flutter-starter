import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../common_export.dart';
import '../../shared/provider/user_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(userProvider);

    ref.listen<AuthMode>(authProvider, (previous, next) {
      if (next == AuthMode.userLogoutState) {
        context.go('/login');
      }
    });

    return WillPopScope(
      onWillPop: () async => false,
      child: data.when(data: (currentUserData) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColor,
            centerTitle: true,
            title: Text(
              AppLocalizations.of(context)?.flutterStarterText ??
                  'Flutter Starter',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Theme.of(context).backgroundColor),
            ),
            actions: [
              IconButton(
                  key: const Key('logoutButton'),
                  icon: const Icon(Icons.logout),
                  onPressed: () {
                    ref.read(authProvider.notifier).userLogout();
                  }),
            ],
          ),
          backgroundColor: Theme.of(context).backgroundColor,
          body: Center(
            child: Text(AppLocalizations.of(context)?.homeText ?? 'Home',
                style: Theme.of(context).textTheme.headline6),
          ),
          drawer: Drawer(
            backgroundColor: Theme.of(context).backgroundColor,
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CachedNetworkImage(
                            imageUrl: currentUserData.data!.avatar,
                            imageBuilder: (context, imageProvider) => Container(
                              width: 65.toResponsiveWidth,
                              height: 65.toResponsiveHeight,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover),
                              ),
                            ),
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) => Image.network(
                              AllImages().kDefaultImage,
                            ),
                          ),
                          Switch(
                            key: const Key('themeSwitch'),
                            activeColor: Theme.of(context).backgroundColor,
                            value: switchValue,
                            onChanged: (value) {
                              switchValue = value;
                              ref.read(themeProvider.notifier).changeTheme();
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
                ListTile(
                  dense: true,
                  leading: Text("Name",
                      style: Theme.of(context).textTheme.headline6),
                  title: Text(
                      '${currentUserData.data!.firstName} ${currentUserData.data!.lastName}',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 12.toResponsiveFont)),
                ),
                ListTile(
                  dense: true,
                  leading: Text("Email",
                      style: Theme.of(context).textTheme.headline6),
                  title: Text(currentUserData.data!.email,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 12.toResponsiveFont)),
                ),
                ListTile(
                  leading: Text("Text",
                      style: Theme.of(context).textTheme.headline6),
                  title: Text(currentUserData.support!.text,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontSize: 12.toResponsiveFont)),
                ),
              ],
            ),
          ),
        );
      }, error: (e, s) {
        return Scaffold(
          body: Center(
            child: Text(e.toString()),
          ),
        );
      }, loading: () {
        return Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          ),
        );
      }),
    );
  }
}
