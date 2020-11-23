import 'package:meta/meta.dart';

class User {
  final String name;
  final String email;

  User({@required this.name, @required this.email});

  @override
  String toString() => 'User { name: $name, email: $email}';
}
