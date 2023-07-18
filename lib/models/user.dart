// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

MyUser userFromJson(String str) => MyUser.fromJson(json.decode(str));

String userToJson(MyUser data) => json.encode(data.toJson());

///////////////////// user list ///////////////////////////////////////////
///
List<MyUser> userListFromJson(String str) =>
    List<MyUser>.from(json.decode(str).map((x) => MyUser.fromJson(x)));

String userListToJson(List<MyUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyUser {
  MyUser({
    this.id,
    required this.fullName,
    required this.email,
    this.password,
    this.gender,
    this.birthDate,
    this.uid,
    required this.isActive,
  });

  int? id;
  String fullName;
  String email;
  String? password;
  String? gender;
  DateTime? birthDate;
  String? uid;
  int isActive;

  factory MyUser.fromJson(Map<String, dynamic> json) => MyUser(
        id: json["id"],
        fullName: json["name"],
        email: json["email"],
        password: json["password"],
        gender: json["gender"],
        isActive: json["active"],
        // birthDate: DateTime.parse(json["birthDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": fullName,
        "email": email,
        "password": password,
        "gender": gender,
        "birthDate": birthDate?.toIso8601String(),
        "uid": uid,
        "active": isActive,
      };
}

List<MyUser> creatorList = [];

List<MyUser> groupMembres = [
  /* MyUser(fullName: 'Johon Doe', email: 'johondoe@gmail.com'),
  MyUser(fullName: 'Johon Doe', email: 'johondoe@gmail.com'),
  MyUser(fullName: 'Johon Doe', email: 'johondoe@gmail.com'),
  MyUser(fullName: 'Johon Doe', email: 'johondoe@gmail.com'),
  MyUser(fullName: 'Johon Doe', email: 'johondoe@gmail.com'), */
];




/* j'ai une liste class MyUser {
  MyUser({
    this.id,
    required this.fullName,
    required this.email,
    this.password,
    this.gender,
    this.birthDate,
    this.uid,
  });

  int? id;
  String fullName;
  String email;
  String? password;
  String? gender;
  DateTime? birthDate;
  String? uid;

  factory MyUser.fromJson(Map<String, dynamic> json) => MyUser(
        id: json["id"],
        fullName: json["name"],
        email: json["email"],
        password: json["password"],
        gender: json["gender"],
        // birthDate: DateTime.parse(json["birthDate"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": fullName,
        "email": email,
        "password": password,
        "gender": gender,
        "birthDate": birthDate?.toIso8601String(),
        "uid": uid,
      };
}

que j'affiche dans un Column() , je vous voudrais également faire un TextField comme premier enfant du column() qui permettra de de filtrer sur MyUser par le fullName. Comment faire ? */
