import 'dart:convert';

import 'package:http/http.dart';

List<Movies> animationFromJson(String str) =>
    List<Movies>.from(json.decode(str).map((x) => Movies.fromJson(x)));

String animationToJson(List<Movies> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Movies {
  Movies({
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
    required this.storyOfAnimation,
    required this.aboutAnimation,
    required this.banner,
    required this.actors,
    required this.link,
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
  String storyOfAnimation;
  String aboutAnimation;
  String banner;
  List<Actor> actors;
  String link;
  List<Review> reviews;

  factory Movies.fromJson(Map<String, dynamic> json) => Movies(
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
        storyOfAnimation: json["storyOfAnimation"],
        aboutAnimation: json["aboutAnimation"],
        banner: json["Banner"],
        actors: List<Actor>.from(json["actors"].map((x) => Actor.fromJson(x))),
        link: json["link"],
        reviews:
            List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "season": season,
        "ganer": ganer,
        "stars": stars,
        "isDouble": isDouble,
        "dateCreated":
            "${dateCreated.year.toString().padLeft(4, '0')}-${dateCreated.month.toString().padLeft(2, '0')}-${dateCreated.day.toString().padLeft(2, '0')}",
        "lastupdate": lastupdate.toIso8601String(),
        "ageUsers": ageUsers,
        "Country": country,
        "storyOfAnimation": storyOfAnimation,
        "aboutAnimation": aboutAnimation,
        "Banner": banner,
        "actors": List<dynamic>.from(actors.map((x) => x.toJson())),
        "link": link,
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

class GetMovieservice {
  Future<List<Movies>> getAnimationList([int startIndex = 0]) async {
    final response =
        await get(Uri.parse('https://kidtv-kidtv.fandogh.cloud/kidtv/Movies/'));
    var decode = utf8.decode(response.bodyBytes);
    final myMovies = animationFromJson(decode);
    return myMovies;
  }
}

class GetMostNewMoviesService {
  Future<List<Movies>> getAnimationList([int startIndex = 0]) async {
    final response = await get(Uri.parse(
        'https://kidtv-kidtv.fandogh.cloud/kidtv/Movies/?ordering=-dateCreated'));
    var decode = utf8.decode(response.bodyBytes);
    final myMovies = animationFromJson(decode);
    return myMovies;
  }
}

class GetMostLikedMoviesService {
  Future<List<Movies>> getAnimationList([int startIndex = 0]) async {
    final response = await get(Uri.parse(
        'https://kidtv-kidtv.fandogh.cloud/kidtv/Movies/?ordering=-Country'));
    var decode = utf8.decode(response.bodyBytes);
    final myMovies = animationFromJson(decode);
    return myMovies;
  }
}

class GetMostRatedMoviesService {
  Future<List<Movies>> getAnimationList([int startIndex = 0]) async {
    final response = await get(Uri.parse(
        'https://kidtv-kidtv.fandogh.cloud/kidtv/Movies/?ordering=-stars'));
    var decode = utf8.decode(response.bodyBytes);
    final myMovies = animationFromJson(decode);
    return myMovies;
  }
}


//http://10.0.2.2:8000/kidtv/Movies/?ordering=dateCreated'