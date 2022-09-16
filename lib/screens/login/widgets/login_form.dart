import 'package:flutter/material.dart';
import 'package:flutter_starter/flutter_starter.dart';

class LoginForm extends StatefulWidget {
  final AuthenticationBloc authenticationBloc;
  final AuthenticationState state;
  const LoginForm(
      {Key? key, required this.authenticationBloc, required this.state})
      : super(key: key);
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  //   _emailController.text = "eve.holt@reqres.in";
  //   _passwordController.text = "pistol";
  // }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            // initialValue: "eve.holt@reqres.in",
            cursorColor: Theme.of(context).textTheme.headline1!.color,
            decoration: InputDecoration(
              labelText: 'Email address',
              isDense: true,
              prefixIcon: Icon(
                Icons.email,
                size: 28.toResponsiveFont,
              ),
            ),
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Email is required.';
              }
              return null;
            },
          ),
          SizedBox(height: 15.toResponsiveHeight),
          TextFormField(
            // initialValue: R"pistol",
            cursorColor: Theme.of(context).textTheme.headline1!.color,
            decoration: InputDecoration(
                labelText: 'Password',
                isDense: true,
                prefixIcon: Icon(
                  Icons.lock,
                  size: 28.toResponsiveFont,
                )),
            obscureText: true,
            controller: _passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password is required.';
              }
              return null;
            },
          ),
          SizedBox(height: 18.toResponsiveHeight),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              if (_key.currentState!.validate()) {
                widget.authenticationBloc.add(UserLogin(
                    email: _emailController.text,
                    password: _passwordController.text));
              } else {}
            },
            child: widget.state is AuthenticationLoading
                ? CircularProgressIndicator(
                    backgroundColor: Theme.of(context).backgroundColor,
                  )
                : Text(
                    'Login',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 15.toResponsiveFont),
                  ),
          )
        ],
      ),
    );
  }
}
