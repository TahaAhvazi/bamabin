// To parse this JSON data, do
//
//     final serial = serialFromJson(jsonString);

import 'dart:convert';

import 'package:http/http.dart';

List<Serial> serialFromJson(String str) =>
    List<Serial>.from(json.decode(str).map((x) => Serial.fromJson(x)));

String serialToJson(List<Serial> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Serial {
  Serial({
    required this.id,
    required this.fullName,
    required this.season,
    required this.ganer,
    required this.stars,
    required this.isDouble,
    required this.dateCreated,
    required this.lastupdate,
    required this.ageUsers,
    required this.country,
    required this.storyOfSeries,
    required this.aboutSeries,
    required this.parts,
    required this.banner,
    required this.actors,
    required this.reviews,
  });
  int id;
  String fullName;
  String season;
  String ganer;
  int stars;
  bool isDouble;
  DateTime dateCreated;
  DateTime lastupdate;
  String ageUsers;
  String country;
  String storyOfSeries;
  String aboutSeries;
  List<Part> parts;
  String banner;
  List<Actor> actors;
  List<Review> reviews;

  factory Serial.fromJson(Map<String, dynamic> json) => Serial(
        id: json["id"],
        fullName: json["fullName"],
        season: json["season"],
        ganer: json["ganer"],
        stars: json["stars"],
        isDouble: json["isDouble"],
        dateCreated: DateTime.parse(json["dateCreated"]),
        lastupdate: DateTime.parse(json["lastupdate"]),
        ageUsers: json["ageUsers"],
        country: json["Country"],
        storyOfSeries: json["StoryOfSeries"],
        aboutSeries: json["aboutSeries"],
        parts: List<Part>.from(json["parts"].map((x) => Part.fromJson(x))),
        banner: json["Banner"],
        actors: List<Actor>.from(json["actors"].map((x) => Actor.fromJson(x))),
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "season": season,
        "ganer": ganer,
        "stars": stars,
        "isDouble": isDouble,
        "dateCreated": dateCreated,
        "lastupdate": lastupdate.toIso8601String(),
        "ageUsers": ageUsers,
        "Country": country,
        "StoryOfSeries": storyOfSeries,
        "aboutSeries": aboutSeries,
        "parts": List<dynamic>.from(parts.map((x) => x.toJson())),
        "Banner": banner,
        "actors": List<dynamic>.from(actors.map((x) => x.toJson())),
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
      };
}

class Actor {
  Actor({
    required this.fullName,
    required this.profile,
  });

  String fullName;
  String profile;

  factory Actor.fromJson(Map<String, dynamic> json) => Actor(
        fullName: json["fullName"],
        profile: json["profile"],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "profile": profile,
      };
}

class Part {
  Part({
    required this.link,
    required this.name,
    required this.banner,
  });

  String link;
  String name;
  String banner;

  factory Part.fromJson(Map<String, dynamic> json) => Part(
        link: json["link"],
        name: json["name"],
        banner: json["banner"],
      );

  Map<String, dynamic> toJson() => {
        "link": link,
        "name": name,
        "banner": banner,
      };
}

class Review {
  Review({
    required this.content,
    required this.date,
  });

  String content;
  DateTime date;

  factory Review.fromJson(Map<String, dynamic> json) => Review(
        content: json["content"],
        date: DateTime.parse(json["date"]),
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "date":
            "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
      };
}

class GetSerialService {
  Future<List<Serial>> getSerialList([int startIndex = 0]) async {
    final response =
        await get(Uri.parse('https://bamabin.iran.liara.run/movie/series/'));
    var decode = utf8.decode(response.bodyBytes);
    final mySerials = serialFromJson(decode);
    return mySerials;
  }
}
