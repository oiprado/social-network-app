import 'dart:convert';
import 'package:meta/meta.dart';

class EntryResponse {
  List<Content> content;
  Pageable pageable;
  bool last;
  int totalPages;
  int totalElements;
  int size;
  int number;
  Sort sort;
  bool first;
  int numberOfElements;
  bool empty;

  EntryResponse({
    required this.content,
    required this.pageable,
    required this.last,
    required this.totalPages,
    required this.totalElements,
    required this.size,
    required this.number,
    required this.sort,
    required this.first,
    required this.numberOfElements,
    required this.empty,
  });

  EntryResponse copyWith({
    List<Content>? content,
    Pageable? pageable,
    bool? last,
    int? totalPages,
    int? totalElements,
    int? size,
    int? number,
    Sort? sort,
    bool? first,
    int? numberOfElements,
    bool? empty,
  }) =>
      EntryResponse(
        content: content ?? this.content,
        pageable: pageable ?? this.pageable,
        last: last ?? this.last,
        totalPages: totalPages ?? this.totalPages,
        totalElements: totalElements ?? this.totalElements,
        size: size ?? this.size,
        number: number ?? this.number,
        sort: sort ?? this.sort,
        first: first ?? this.first,
        numberOfElements: numberOfElements ?? this.numberOfElements,
        empty: empty ?? this.empty,
      );

  factory EntryResponse.fromRawJson(String str) =>
      EntryResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EntryResponse.fromJson(Map<String, dynamic> json) => EntryResponse(
        content:
            List<Content>.from(json["content"].map((x) => Content.fromJson(x))),
        pageable: Pageable.fromJson(json["pageable"]),
        last: json["last"],
        totalPages: json["totalPages"],
        totalElements: json["totalElements"],
        size: json["size"],
        number: json["number"],
        sort: Sort.fromJson(json["sort"]),
        first: json["first"],
        numberOfElements: json["numberOfElements"],
        empty: json["empty"],
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x.toJson())),
        "pageable": pageable.toJson(),
        "last": last,
        "totalPages": totalPages,
        "totalElements": totalElements,
        "size": size,
        "number": number,
        "sort": sort.toJson(),
        "first": first,
        "numberOfElements": numberOfElements,
        "empty": empty,
      };
}

class Content {
  String id;
  String thumbnailUrl;
  String title;
  String text;
  List<String> keywords;
  Creator creator;
  int commentCount;
  List<dynamic> comment;
  DateTime dateCreated;
  DateTime dateModified;
  DateTime datePublished;

  Content({
    required this.id,
    required this.thumbnailUrl,
    required this.title,
    required this.text,
    required this.keywords,
    required this.creator,
    required this.commentCount,
    required this.comment,
    required this.dateCreated,
    required this.dateModified,
    required this.datePublished,
  });

  Content copyWith({
    String? id,
    String? thumbnailUrl,
    String? title,
    String? text,
    List<String>? keywords,
    Creator? creator,
    int? commentCount,
    List<dynamic>? comment,
    DateTime? dateCreated,
    DateTime? dateModified,
    DateTime? datePublished,
  }) =>
      Content(
        id: id ?? this.id,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
        title: title ?? this.title,
        text: text ?? this.text,
        keywords: keywords ?? this.keywords,
        creator: creator ?? this.creator,
        commentCount: commentCount ?? this.commentCount,
        comment: comment ?? this.comment,
        dateCreated: dateCreated ?? this.dateCreated,
        dateModified: dateModified ?? this.dateModified,
        datePublished: datePublished ?? this.datePublished,
      );

  factory Content.fromRawJson(String str) => Content.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        id: json["id"],
        thumbnailUrl: json["thumbnailUrl"],
        title: json["title"],
        text: json["text"],
        keywords: List<String>.from(json["keywords"].map((x) => x)),
        creator: Creator.fromJson(json["creator"]),
        commentCount: json["commentCount"],
        comment: List<dynamic>.from(json["comment"].map((x) => x)),
        dateCreated: DateTime.parse(json["dateCreated"]),
        dateModified: DateTime.parse(json["dateModified"]),
        datePublished: DateTime.parse(json["datePublished"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "thumbnailUrl": thumbnailUrl,
        "title": title,
        "text": text,
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
        "creator": creator.toJson(),
        "commentCount": commentCount,
        "comment": List<dynamic>.from(comment.map((x) => x)),
        "dateCreated": dateCreated.toIso8601String(),
        "dateModified": dateModified.toIso8601String(),
        "datePublished": datePublished.toIso8601String(),
      };
}

class Creator {
  String id;
  String name;
  String image;
  String about;
  Location location;

  Creator({
    required this.id,
    required this.name,
    required this.image,
    required this.about,
    required this.location,
  });

  Creator copyWith({
    String? id,
    String? name,
    String? image,
    String? about,
    Location? location,
  }) =>
      Creator(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        about: about ?? this.about,
        location: location ?? this.location,
      );

  factory Creator.fromRawJson(String str) => Creator.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Creator.fromJson(Map<String, dynamic> json) => Creator(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        about: json["about"],
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "about": about,
        "location": location.toJson(),
      };
}

class Location {
  double latitude;
  double longitude;

  Location({
    required this.latitude,
    required this.longitude,
  });

  Location copyWith({
    double? latitude,
    double? longitude,
  }) =>
      Location(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        latitude: json["latitude"]?.toDouble(),
        longitude: json["longitude"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "latitude": latitude,
        "longitude": longitude,
      };
}

class Pageable {
  Sort sort;
  int pageSize;
  int pageNumber;
  int offset;
  bool paged;
  bool unpaged;

  Pageable({
    required this.sort,
    required this.pageSize,
    required this.pageNumber,
    required this.offset,
    required this.paged,
    required this.unpaged,
  });

  Pageable copyWith({
    Sort? sort,
    int? pageSize,
    int? pageNumber,
    int? offset,
    bool? paged,
    bool? unpaged,
  }) =>
      Pageable(
        sort: sort ?? this.sort,
        pageSize: pageSize ?? this.pageSize,
        pageNumber: pageNumber ?? this.pageNumber,
        offset: offset ?? this.offset,
        paged: paged ?? this.paged,
        unpaged: unpaged ?? this.unpaged,
      );

  factory Pageable.fromRawJson(String str) =>
      Pageable.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Pageable.fromJson(Map<String, dynamic> json) => Pageable(
        sort: Sort.fromJson(json["sort"]),
        pageSize: json["pageSize"],
        pageNumber: json["pageNumber"],
        offset: json["offset"],
        paged: json["paged"],
        unpaged: json["unpaged"],
      );

  Map<String, dynamic> toJson() => {
        "sort": sort.toJson(),
        "pageSize": pageSize,
        "pageNumber": pageNumber,
        "offset": offset,
        "paged": paged,
        "unpaged": unpaged,
      };
}

class Sort {
  bool sorted;
  bool empty;
  bool unsorted;

  Sort({
    required this.sorted,
    required this.empty,
    required this.unsorted,
  });

  Sort copyWith({
    bool? sorted,
    bool? empty,
    bool? unsorted,
  }) =>
      Sort(
        sorted: sorted ?? this.sorted,
        empty: empty ?? this.empty,
        unsorted: unsorted ?? this.unsorted,
      );

  factory Sort.fromRawJson(String str) => Sort.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Sort.fromJson(Map<String, dynamic> json) => Sort(
        sorted: json["sorted"],
        empty: json["empty"],
        unsorted: json["unsorted"],
      );

  Map<String, dynamic> toJson() => {
        "sorted": sorted,
        "empty": empty,
        "unsorted": unsorted,
      };
}
