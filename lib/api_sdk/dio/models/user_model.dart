import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class DioResponseData {
  Data? data;
  Support? support;

  DioResponseData({this.data, this.support});

  factory DioResponseData.fromJson(Map<String, dynamic> json) =>
      _$DioResponseDataFromJson(json);
  Map<String, dynamic> toJson() => _$DioResponseDataToJson(this);
}

@JsonSerializable()
class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  factory Support.fromJson(Map<String, dynamic> json) =>
      _$SupportFromJson(json);
  Map<String, dynamic> toJson() => _$SupportToJson(this);
}
