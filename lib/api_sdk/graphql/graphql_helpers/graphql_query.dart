class GraphqlQuery {
  static const String login = r'''
query Login($email: String!, $password: String!) {
  login(email: $email, password: $password) {
    token
  }
}
''';

  static const String register = r'''
query Register($email: String!, $password: String!) {
  register(email: $email, password: $password) {
    token
    id
  }
}
''';

  static const String users = r'''
query User($id: Int!) {
  user(id: $id) {
    data {
      id
      email
      first_name
      last_name
      avatar
    }
    support {
      url
      text
    }
  }
}
''';
}
