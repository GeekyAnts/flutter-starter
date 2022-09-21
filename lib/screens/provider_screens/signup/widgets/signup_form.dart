import 'package:flutter/material.dart';
import 'package:flutter_starter/flutter_starter.dart';
import 'package:provider/provider.dart';

class ProviderSignUpForm extends StatefulWidget {
  const ProviderSignUpForm({Key? key}) : super(key: key);
  @override
  State<ProviderSignUpForm> createState() => _ProviderSignUpFormState();
}

class _ProviderSignUpFormState extends State<ProviderSignUpForm> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            cursorColor: Theme.of(context).textTheme.headline1!.color,
            decoration: InputDecoration(
              labelText: 'Name',
              isDense: true,
              prefixIcon: Icon(
                Icons.person,
                size: 28.toResponsiveFont,
              ),
            ),
            controller: _nameController,
            keyboardType: TextInputType.name,
            autocorrect: false,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Name is required.';
              }
              return null;
            },
          ),
          SizedBox(height: 15.toResponsiveHeight),
          TextFormField(
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
                    provider.status[provider.userSignupStatus] !=
                        Status.loading) {
                  context.read<AuthenticationProvider>().userSignup(
                      _emailController.text, _passwordController.text);
                } else {}
              },
              child:
                  provider.status[provider.userSignupStatus] == Status.loading
                      ? CircularProgressIndicator(
                          backgroundColor: Theme.of(context).backgroundColor,
                        )
                      : Text(
                          'Sign Up',
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
