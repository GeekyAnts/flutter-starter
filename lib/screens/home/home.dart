// home screen contents
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../common_export.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final AuthenticationBloc authenticationBloc;
  bool switchValue = false;

  @override
  void initState() {
    super.initState();
    authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    authenticationBloc.add(const GetUserData());
    switchValue = BlocProvider.of<UpdateThemeBloc>(context).state.props.first ==
            AppTheme.light
        ? false
        : true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        bloc: authenticationBloc,
        listener: (context, state) {
          if (state is UserLogoutState) {
            context.go('/login');
          }
        },
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            bloc: authenticationBloc,
            builder: (BuildContext context, AuthenticationState state) {
              if (state is SetUserData) {
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
                            authenticationBloc.add(const UserLogOut());
                          }),
                    ],
                  ),
                  backgroundColor: Theme.of(context).backgroundColor,
                  body: Center(
                    child: Text(
                        AppLocalizations.of(context)?.homeText ?? 'Home',
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CachedNetworkImage(
                                    imageUrl:
                                        state.currentUserData.data!.avatar,
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      width: 65.toResponsiveWidth,
                                      height: 65.toResponsiveHeight,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.cover),
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
                                    key: const Key('themeSwitch'),
                                    activeColor:
                                        Theme.of(context).backgroundColor,
                                    value: switchValue,
                                    onChanged: (value) {
                                      setState(() {
                                        switchValue = value;
                                      });

                                      BlocProvider.of<UpdateThemeBloc>(context)
                                          .add(UpdateTheme(
                                              appTheme: value
                                                  ? AppTheme.dark
                                                  : AppTheme.light));
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
                              '${state.currentUserData.data!.firstName} ${state.currentUserData.data!.lastName}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 12.toResponsiveFont)),
                        ),
                        ListTile(
                          dense: true,
                          leading: Text("Email",
                              style: Theme.of(context).textTheme.headline6),
                          title: Text(state.currentUserData.data!.email,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(fontSize: 12.toResponsiveFont)),
                        ),
                        ListTile(
                          leading: Text("Text",
                              style: Theme.of(context).textTheme.headline6),
                          title: Text(state.currentUserData.support!.text,
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
      ),
    );
  }
}
