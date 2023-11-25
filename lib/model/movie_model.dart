import 'dart:convert';

class Movie {
  final double score;
  final Show show;

  Movie({
    required this.score,
    required this.show,
  });

  factory Movie.fromJson(String str) => Movie.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Movie.fromMap(Map<String, dynamic> json) => Movie(
        score: json["score"]?.toDouble(),
        show: Show.fromMap(json["show"]),
      );

  Map<String, dynamic> toMap() => {
        "score": score,
        "show": show.toMap(),
      };
}

class Show {
  final int id;
  final String url;
  final String name;
  final String type;
  final String language;
  final List<String> genres;
  final String status;
  final int? runtime;
  final int? averageRuntime;
  final DateTime? premiered;
  final DateTime? ended;
  final String? officialSite;
  final Schedule schedule;
  final Rating rating;
  final int weight;
  final Network? network;
  final Network? webChannel;
  final dynamic dvdCountry;
  final Externals externals;
  final Image? image;
  final String summary;
  final int updated;
  final Links links;

  Show({
    required this.id,
    required this.url,
    required this.name,
    required this.type,
    required this.language,
    required this.genres,
    required this.status,
    required this.runtime,
    required this.averageRuntime,
    required this.premiered,
    required this.ended,
    required this.officialSite,
    required this.schedule,
    required this.rating,
    required this.weight,
    required this.network,
    required this.webChannel,
    required this.dvdCountry,
    required this.externals,
    required this.image,
    required this.summary,
    required this.updated,
    required this.links,
  });

  factory Show.fromJson(String str) => Show.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Show.fromMap(Map<String, dynamic> json) => Show(
        id: json["id"],
        url: json["url"],
        name: json["name"],
        type: json["type"],
        language: json["language"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        status: json["status"],
        runtime: json["runtime"],
        averageRuntime: json["averageRuntime"],
        premiered: json["premiered"] == null
            ? null
            : DateTime.parse(json["premiered"]),
        ended: json["ended"] == null ? null : DateTime.parse(json["ended"]),
        officialSite: json["officialSite"],
        schedule: Schedule.fromMap(json["schedule"]),
        rating: Rating.fromMap(json["rating"]),
        weight: json["weight"],
        network:
            json["network"] == null ? null : Network.fromMap(json["network"]),
        webChannel: json["webChannel"] == null
            ? null
            : Network.fromMap(json["webChannel"]),
        dvdCountry: json["dvdCountry"],
        externals: Externals.fromMap(json["externals"]),
        image: json["image"] == null ? null : Image.fromMap(json["image"]),
        summary: json["summary"] ?? '',
        updated: json["updated"] ?? '',
        links: Links.fromMap(json["_links"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "url": url,
        "name": name,
        "type": type,
        "language": language,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "status": status,
        "runtime": runtime,
        "averageRuntime": averageRuntime,
        "premiered":
            "${premiered!.year.toString().padLeft(4, '0')}-${premiered!.month.toString().padLeft(2, '0')}-${premiered!.day.toString().padLeft(2, '0')}",
        "ended":
            "${ended!.year.toString().padLeft(4, '0')}-${ended!.month.toString().padLeft(2, '0')}-${ended!.day.toString().padLeft(2, '0')}",
        "officialSite": officialSite,
        "schedule": schedule.toMap(),
        "rating": rating.toMap(),
        "weight": weight,
        "network": network?.toMap(),
        "webChannel": webChannel?.toMap(),
        "dvdCountry": dvdCountry,
        "externals": externals.toMap(),
        "image": image?.toMap(),
        "summary": summary,
        "updated": updated,
        "_links": links.toMap(),
      };
}

class Externals {
  final dynamic tvrage;
  final int thetvdb;
  final String? imdb;

  Externals({
    required this.tvrage,
    required this.thetvdb,
    required this.imdb,
  });

  factory Externals.fromJson(String str) => Externals.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Externals.fromMap(Map<String, dynamic> json) => Externals(
        tvrage: json["tvrage"] ?? 0,
        thetvdb: json["thetvdb"] ?? 0,
        imdb: json["imdb"] ?? '',
      );

  Map<String, dynamic> toMap() => {
        "tvrage": tvrage,
        "thetvdb": thetvdb,
        "imdb": imdb,
      };
}

class Image {
  final String medium;
  final String original;

  Image({
    required this.medium,
    required this.original,
  });

  factory Image.fromJson(String str) => Image.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Image.fromMap(Map<String, dynamic> json) => Image(
        medium: json["medium"],
        original: json["original"],
      );

  Map<String, dynamic> toMap() => {
        "medium": medium,
        "original": original,
      };
}

class Links {
  final Self self;
  final Self? previousepisode;

  Links({
    required this.self,
    this.previousepisode,
  });

  factory Links.fromJson(String str) => Links.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Links.fromMap(Map<String, dynamic> json) => Links(
        self: Self.fromMap(json["self"]),
        previousepisode: json["previousepisode"] == null
            ? null
            : Self.fromMap(json["previousepisode"]),
      );

  Map<String, dynamic> toMap() => {
        "self": self.toMap(),
        "previousepisode": previousepisode?.toMap(),
      };
}

class Self {
  final String href;

  Self({
    required this.href,
  });

  factory Self.fromJson(String str) => Self.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Self.fromMap(Map<String, dynamic> json) => Self(
        href: json["href"],
      );

  Map<String, dynamic> toMap() => {
        "href": href,
      };
}

class Network {
  final int id;
  final String name;
  final Country? country;
  final String? officialSite;

  Network({
    required this.id,
    required this.name,
    required this.country,
    required this.officialSite,
  });

  factory Network.fromJson(String str) => Network.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Network.fromMap(Map<String, dynamic> json) => Network(
        id: json["id"],
        name: json["name"],
        country:
            json["country"] == null ? null : Country.fromMap(json["country"]),
        officialSite: json["officialSite"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "country": country?.toMap(),
        "officialSite": officialSite,
      };
}

class Country {
  final String name;
  final String code;
  final String timezone;

  Country({
    required this.name,
    required this.code,
    required this.timezone,
  });

  factory Country.fromJson(String str) => Country.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Country.fromMap(Map<String, dynamic> json) => Country(
        name: json["name"],
        code: json["code"],
        timezone: json["timezone"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "code": code,
        "timezone": timezone,
      };
}

class Rating {
  final double? average;

  Rating({
    required this.average,
  });

  factory Rating.fromJson(String str) => Rating.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
        average: json["average"]?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "average": average,
      };
}

class Schedule {
  final String time;
  final List<String> days;

  Schedule({
    required this.time,
    required this.days,
  });

  factory Schedule.fromJson(String str) => Schedule.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Schedule.fromMap(Map<String, dynamic> json) => Schedule(
        time: json["time"],
        days: List<String>.from(json["days"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "time": time,
        "days": List<dynamic>.from(days.map((x) => x)),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
