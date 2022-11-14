import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_export.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
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
            key: const Key('nameField'),
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
            key: const Key('emailField'),
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
            key: const Key('passwordField'),
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
            key: const Key('signupButton'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              if (_key.currentState!.validate()) {
                ref.read(authProvider.notifier).userSignup(
                    _emailController.text, _passwordController.text);
              }
            },
            child: ref.watch(authProvider) == AuthMode.authenticationLoading
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
          )
        ],
      ),
    );
  }
}
