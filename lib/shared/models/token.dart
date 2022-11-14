class Token {
  late String token;

  Token({required this.token});

  Token.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['token'] = token;
    return data;
  }
}
