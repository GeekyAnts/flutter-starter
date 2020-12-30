import 'package:app/src/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:shared/main.dart';

class LoginForm extends StatefulWidget {
  final AuthenticationBloc authenticationBloc;
  final AuthenticationState state;
  LoginForm({this.authenticationBloc, this.state});
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
            decoration: InputDecoration(
              labelText: 'Email address',
              filled: true,
              isDense: true,
            ),
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            autocorrect: false,
            validator: (value) => Validations.isEmail(value),
          ),
          SizedBox(
            height: 12,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
              filled: true,
              isDense: true,
            ),
            obscureText: true,
            controller: _passwordController,
            validator: (value) => Validations.checkPassword(value),
          ),
          const SizedBox(
            height: 16,
          ),
          RaisedButton(
              color: Theme.of(context).primaryColor,
              textColor: Colors.white,
              padding: const EdgeInsets.all(16),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(8.0)),
              child: widget.state is AuthenticationLoading
                  ? CircularProgressIndicator(
                      backgroundColor:
                          Theme.of(context).textTheme.bodyText1.color,
                    )
                  : Text('Login', style: Theme.of(context).textTheme.bodyText1),
              onPressed: () {
                if (_key.currentState.validate()) {
                  widget.authenticationBloc.add(UserLogin(
                      email: _emailController.text,
                      password: _passwordController.text));
                }
              })
        ],
      ),
    );
  }
}
