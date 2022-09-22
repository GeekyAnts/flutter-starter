// home screen contents
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_starter/flutter_starter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeProviderScreen extends StatefulWidget {
  const HomeProviderScreen({Key? key}) : super(key: key);

  @override
  State<HomeProviderScreen> createState() => _HomeProviderScreenState();
}

class _HomeProviderScreenState extends State<HomeProviderScreen> {
  final AuthenticationBloc authenticationBloc =
      AuthenticationBlocController().authenticationBloc;
  bool switchValue = false;
  @override
  void initState() {
    super.initState();
    switchValue =
        context.read<ThemeProvider>().appTheme == AppTheme.light ? false : true;

    /// To fetch the user details.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AuthenticationProvider>().getUserData();
    });
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationProvider provider =
        Provider.of<AuthenticationProvider>(context);

    /// Here we are checking the user log out status and redirecting user to the intial screen.
    if (provider.status[provider.userLogoutStatus] == Status.done &&
        provider.currentUserData == null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/login');
      });
    }
    return WillPopScope(
      onWillPop: () async => false,
      child: Consumer<AuthenticationProvider>(builder:
          (BuildContext context, AuthenticationProvider provider, child) {
        if (provider.status[provider.fetchUserDataStatus] == Status.done &&
            provider.currentUserData != null) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              centerTitle: true,
              title: Text(
                AppLocalizations.of(context)!.flutterStarterText,
                style: Theme.of(context)
                    .textTheme
                    .headline3!
                    .copyWith(color: Theme.of(context).backgroundColor),
              ),
              actions: [
                IconButton(
                    icon: const Icon(Icons.logout),
                    onPressed: () {
                      context.read<AuthenticationProvider>().userLogout();
                    }),
              ],
            ),
            backgroundColor: Theme.of(context).backgroundColor,
            body: Center(
              child: Text(AppLocalizations.of(context)!.homeText,
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
                              imageUrl: provider.currentUserData!.data!.avatar,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
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
                              errorWidget: (context, url, error) =>
                                  Image.network(
                                AllImages().kDefaultImage,
                              ),
                            ),
                            Switch(
                              activeColor: Theme.of(context).backgroundColor,
                              value: switchValue,
                              onChanged: (value) {
                                /// Updates theme of the application.
                                setState(() {
                                  switchValue = value;
                                });
                                Provider.of<ThemeProvider>(context,
                                        listen: false)
                                    .setTheme(
                                        value ? AppTheme.dark : AppTheme.light);
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
                        '${provider.currentUserData!.data!.firstName} ${provider.currentUserData!.data!.lastName}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 12.toResponsiveFont)),
                  ),
                  ListTile(
                    dense: true,
                    leading: Text("Email",
                        style: Theme.of(context).textTheme.headline6),
                    title: Text(provider.currentUserData!.data!.email,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 12.toResponsiveFont)),
                  ),
                  ListTile(
                    leading: Text("Text",
                        style: Theme.of(context).textTheme.headline6),
                    title: Text(provider.currentUserData!.support!.text,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2!
                            .copyWith(fontSize: 12.toResponsiveFont)),
                  ),
                ],
              ),
            ),
          );
        }
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
