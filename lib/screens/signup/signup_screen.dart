import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/flutter_starter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async => false,
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          bloc: authenticationBloc,
          listener: (context, state) {
            if (state is AuthenticationFailure) {
              _showError(state.message);
            }
            if (state is AppAutheticated) {
              context.go('/home');
            }
          },
          child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            bloc: authenticationBloc,
            builder: (BuildContext context, AuthenticationState state) {
              return SafeArea(
                  child: Stack(
                children: [
                  Responsive.isDesktop(context)
                      ? Center(
                          child: Card(
                            elevation: 15,
                            child: SizedBox(
                                width: 500.toResponsiveWidth,
                                height: 650.toResponsiveHeight,
                                child: _authenticationForm(context, state)),
                          ),
                        )
                      : _authenticationForm(context, state),
                  Positioned(
                    left: 6,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 28,
                        color: Theme.of(context).textTheme.headline1!.color,
                      ),
                      onPressed: () {
                        context.pop();
                      },
                    ),
                  ),
                ],
              ));
            },
          ),
        ),
      ),
    );
  }

  Widget _authenticationForm(BuildContext context, AuthenticationState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Image.asset(
            AllImages().signup,
            width: 260.toResponsiveWidth,
            height: 250.toResponsiveHeight,
          ),
        ),
        SizedBox(height: 12.toResponsiveHeight),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 32.toResponsiveWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sign Up', style: Theme.of(context).textTheme.headline1),
              SizedBox(height: 15.toResponsiveHeight),
              SignUpForm(
                authenticationBloc: authenticationBloc,
                state: state,
              ),
            ],
          ),
        ),
        SizedBox(height: 32.toResponsiveHeight),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(fontSize: 12.toResponsiveFont),
            ),
            InkWell(
                child: Text(
                  ' Login',
                  style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontSize: 13.toResponsiveFont,
                      color: Theme.of(context).primaryColor),
                ),
                onTap: () {
                  context.pop();
                }),
          ],
        ),
      ],
    );
  }
}
