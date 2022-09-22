import 'package:flutter/material.dart';
import 'package:flutter_starter/flutter_starter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

/// This is the first screen where user will be redirected to.
class LoginProviderScreen extends StatefulWidget {
  const LoginProviderScreen({Key? key}) : super(key: key);

  @override
  State<LoginProviderScreen> createState() => _LoginProviderScreenState();
}

class _LoginProviderScreenState extends State<LoginProviderScreen> {
  AuthenticationBloc authenticationBloc = AuthenticationBloc();
  void _showError(String error) async {
    await Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Theme.of(context).errorColor,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  Widget build(BuildContext context) {
    AuthenticationProvider provider =
        Provider.of<AuthenticationProvider>(context);

    /// Here we are checking the user log in status and redirecting user to a specific screen.
    if (provider.status[provider.userLoginStatus] == Status.error) {
      _showError(
          provider.error[provider.userLoginStatus] ?? "Something went wrong");
    } else if (provider.status[provider.userLoginStatus] == Status.done) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go('/home');
      });
    }
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: Consumer<AuthenticationProvider>(builder:
            (BuildContext context, AuthenticationProvider provider, child) {
          return SafeArea(
            child: Responsive.isDesktop(context)
                ? Center(
                    child: Card(
                      elevation: 15,
                      child: SizedBox(
                          width: 500.toResponsiveWidth,
                          height: 650.toResponsiveHeight,
                          child: _authenticationForm(context)),
                    ),
                  )
                : _authenticationForm(context),
          );
        }),
      ),
    );
  }

  Widget _authenticationForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
            child: Image.asset(
          AllImages().login,
          width: 350.toResponsiveWidth,
          height: 300.toResponsiveHeight,
        )),
        SizedBox(height: 12.toResponsiveHeight),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 32.toResponsiveWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Login', style: Theme.of(context).textTheme.headline1),
              SizedBox(height: 15.toResponsiveHeight),
              const ProviderLoginForm(),
            ],
          ),
        ),
        SizedBox(height: 32.toResponsiveHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'New here?',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 12.toResponsiveFont),
            ),
            InkWell(
                child: Text(
                  ' Sign Up',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 13.toResponsiveFont,
                      color: Theme.of(context).primaryColor),
                ),
                onTap: () {
                  context.push('/signup');
                }),
          ],
        )
      ],
    );
  }
}
