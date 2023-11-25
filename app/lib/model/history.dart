import 'dart:convert';
import 'package:meta/meta.dart';

class History {
  String url;

  History({
    required this.url,
  });

  History copyWith({
    String? url,
  }) =>
      History(
        url: url ?? this.url,
      );

  factory History.fromRawJson(String str) => History.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory History.fromJson(Map<String, dynamic> json) => History(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}
