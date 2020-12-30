class Validations {
  //Validate email id
  static String isEmail(String value) {
    if (value.isEmpty) return 'Email cannot be Empty';
    final RegExp emailExp = new RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (!emailExp.hasMatch(value)) return 'Please check entered email';
    return null;
  }

  //Validate password
  static String checkPassword(String value) {
    if (value.isEmpty) return 'Password cannot be Empty';
    if (value.length < 6) return 'Password must be 6 or more characters';
    return null;
  }
}
