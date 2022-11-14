class UserData {
  late int id;
  late String token;

  UserData({required this.id, required this.token});

  UserData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['token'] = token;
    return data;
  }
}
