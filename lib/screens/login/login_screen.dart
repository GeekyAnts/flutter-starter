import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

import '../../common_export.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
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
    ref.listen<AuthMode>(authProvider, (previous, next) {
      if (next == AuthMode.authenticationFailure) {
        _showError('Failed to login');
      }
      if (next == AuthMode.appAutheticated) {
        context.go('/home');
      }
    });

    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: SafeArea(
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
              : SingleChildScrollView(
                  child: _authenticationForm(context),
                ),
        ),
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
              const LoginForm(),
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
