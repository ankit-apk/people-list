// To parse this JSON data, do
//
//     final people = peopleFromJson(jsonString);

import 'dart:convert';

List<People> peopleFromJson(String str) =>
    List<People>.from(json.decode(str).map((x) => People.fromJson(x)));

String peopleToJson(List<People> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class People {
  People({
    this.name,
    this.image,
    this.age,
    this.interests,
  });

  String? name;
  String? image;
  String? age;
  String? interests;

  factory People.fromJson(Map<String, dynamic> json) => People(
        name: json["name"],
        image: json["image"],
        age: json["age"],
        interests: json["interests"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "age": age,
        "interests": interests,
      };
}
