import 'dart:convert';


List<Images> imageFromJson(String str) => List<Images>.from(json.decode(str).map((x) => Images.fromJson(x)));

String imageToJson(List<Images> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Images {
  Images({
    this.id,
    this.urls,
    this.categories,
    this.likes,

  });

  String? id;
  Urls? urls;
  List<dynamic>? categories;
  int? likes;


  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"],
    urls: Urls.fromJson(json["urls"]),
    categories: List<dynamic>.from(json["categories"].map((x) => x)),
    likes: json["likes"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "urls": urls!.toJson(),
    "categories": List<dynamic>.from(categories!.map((x) => x)),
    "likes": likes,
   };
}
class Urls {
  Urls({
    this.raw,
    this.full,
    this.regular,
    this.small,
    this.thumb,
  });

  String? raw;
  String? full;
  String ?regular;
  String? small;
  String? thumb;

  factory Urls.fromJson(Map<String, dynamic> json) => Urls(
    raw: json["raw"],
    full: json["full"],
    regular: json["regular"],
    small: json["small"],
    thumb: json["thumb"],
  );

  Map<String, dynamic> toJson() => {
    "raw": raw,
    "full": full,
    "regular": regular,
    "small": small,
    "thumb": thumb,
  };
}