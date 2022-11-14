class CurrentUserData {
  Data? data;
  Support? support;

  CurrentUserData({this.data, this.support});

  CurrentUserData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : Data();
    support =
        json['support'] != null ? Support.fromJson(json['support']) : Support();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (support != null) {
      data['support'] = support!.toJson();
    }
    return data;
  }
}

class Data {
  late int? id;
  late String email;
  late String firstName;
  late String lastName;
  late String avatar;

  Data(
      {this.id,
      this.email = '',
      this.firstName = '',
      this.lastName = '',
      this.avatar = ''});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }
}

class Support {
  late String url;
  late String text;

  Support({this.url = '', this.text = ''});

  Support.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};

    data['url'] = url;
    data['text'] = text;
    return data;
  }
}
