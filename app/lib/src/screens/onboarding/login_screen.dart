import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class LoginForm extends StatefulWidget {
  final AuthenticationBloc authenticationBloc;
  final AuthenticationState state;
  LoginForm({required this.authenticationBloc, required this.state});
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            cursorColor: Theme.of(context).textTheme.headline1!.color,
            decoration: InputDecoration(
              labelText: 'Email address',
              filled: true,
              isDense: true,
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
          SizedBox(
            height: 12,
          ),
          TextFormField(
            cursorColor: Theme.of(context).textTheme.headline1!.color,
            decoration: InputDecoration(
              labelText: 'Password',
              filled: true,
              isDense: true,
            ),
            obscureText: true,
            controller: _passwordController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Password is required.';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
              child: widget.state is AuthenticationLoading
                  ? CircularProgressIndicator(
                      backgroundColor: Theme.of(context).backgroundColor,
                    )
                  : Text('Login', style: Theme.of(context).textTheme.bodyText1),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                if (_key.currentState!.validate()) {
                  widget.authenticationBloc.add(UserLogin(
                      email: _emailController.text,
                      password: _passwordController.text));
                } else {}
              })
        ],
      ),
    );
  }
}
