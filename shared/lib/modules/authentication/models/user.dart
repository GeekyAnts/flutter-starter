import 'package:meta/meta.dart';

class MyUser {
  final String name;
  final String email;

  MyUser({@required this.name, @required this.email});

  @override
  String toString() => 'User { name: $name, email: $email}';
}
