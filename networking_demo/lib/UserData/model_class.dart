import 'dart:convert';

List<UserData1> userDataFromJson(String str) =>
    List<UserData1>.from(json.decode(str).map((x) => UserData1.fromJson(x)));

String userDataToJson(List<UserData1> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserData1 {
  int userId;
  int id;
  String title;

  UserData1({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory UserData1.fromJson(Map<String, dynamic> json) => UserData1(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
      };
}
