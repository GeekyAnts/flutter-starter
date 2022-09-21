import 'package:flutter/material.dart';
import 'package:flutter_starter/flutter_starter.dart';
import 'package:provider/provider.dart';

class ProviderLoginForm extends StatefulWidget {
  const ProviderLoginForm({Key? key}) : super(key: key);
  @override
  State<ProviderLoginForm> createState() => _ProviderLoginFormState();
}

class _ProviderLoginFormState extends State<ProviderLoginForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

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
          Consumer<AuthenticationProvider>(
            builder: (BuildContext context, AuthenticationProvider provider,
                    child) =>
                ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                if (_key.currentState!.validate() &&
                    provider.status[provider.userLoginStatus] !=
                        Status.loading) {
                  context.read<AuthenticationProvider>().userLogin(
                      _emailController.text, _passwordController.text);
                } else {}
              },
              child: provider.status[provider.userLoginStatus] == Status.loading
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
            ),
          )
        ],
      ),
    );
  }
}
