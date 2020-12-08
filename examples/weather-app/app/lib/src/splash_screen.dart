import 'package:app/src/config/color_constants.dart';
import 'package:app/src/config/image_constants.dart';
import 'package:app/src/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared/main.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthenticationBloc authenticationBloc;
  @override
  void initState() {
    authenticationBloc = AuthenticationBlocController().authenticationBloc;
    authenticationBloc.add(AppLoadedup());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        backgroundColor: ColorConstants.secondaryAppColor,
        body: BlocListener<AuthenticationBloc, AuthenticationState>(
          cubit: authenticationBloc,
          listener: (BuildContext context, AuthenticationState state) {
            if (state is AppAutheticated) {
              Navigator.pushNamed(context, '/home');
            }
            if (state is AuthenticationStart) {
              Navigator.pushNamed(context, '/auth');
            }
            if (state is UserLogoutState) {
              Navigator.pushNamed(context, '/auth');
            }
          },
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              cubit: authenticationBloc,
              builder: (BuildContext context, AuthenticationState state) {
                return Center(child: Image.asset(AllImages().logo));
              }),
        ));
  }
}
