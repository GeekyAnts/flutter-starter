import 'package:app/src/screens/onboarding/login_screen.dart';
import 'package:app/src/screens/onboarding/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared/shared.dart';

class AuthenticationScreen extends StatefulWidget {
  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  bool showLoginForm = false;
  // ignore: close_sinks
  late AuthenticationBloc authenticationBloc;
  @override
  Widget build(BuildContext context) {
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

    return Scaffold(
        body: WillPopScope(
      onWillPop: () async => false,
      child: BlocListener<AuthenticationBloc, AuthenticationState>(
        bloc: authenticationBloc,
        listener: (context, state) {
          if (state is AuthenticationFailure) {
            _showError(state.message);
          }
        },
        child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
            bloc: authenticationBloc,
            builder: (BuildContext context, AuthenticationState state) {
              return SafeArea(
                child: Stack(
                  children: [
                    Center(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          Center(
                              child: Text(
                            showLoginForm ? 'LOGIN' : 'SIGN UP',
                            style: Theme.of(context).textTheme.headline2,
                          )),
                          Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: showLoginForm
                                ? LoginForm(
                                    authenticationBloc: authenticationBloc,
                                    state: state,
                                  )
                                : SignUpForm(
                                    authenticationBloc: authenticationBloc,
                                    state: state,
                                  ),
                          ),
                          showLoginForm
                              ? SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      SizedBox(
                                        height: 38,
                                      ),
                                      Text('Already have an account?'),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                Theme.of(context).primaryColor,
                                          ),
                                          child: Text(
                                            'Login',
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              showLoginForm = true;
                                            });
                                          })
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ),
                    !showLoginForm
                        ? SizedBox()
                        : Positioned(
                            left: 6,
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                size: 32,
                                color: Theme.of(context).backgroundColor,
                              ),
                              onPressed: () {
                                setState(() {
                                  showLoginForm = false;
                                });
                              },
                            ),
                          )
                  ],
                ),
              );
            }),
      ),
    ));
  }

  @override
  void initState() {
    authenticationBloc = AuthenticationBlocController().authenticationBloc;
    super.initState();
  }
}
