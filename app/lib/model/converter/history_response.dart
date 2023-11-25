import 'dart:convert';
import 'package:quipu/model/history.dart';

class HistoryResponse {
  List<History> data;

  HistoryResponse({
    required this.data,
  });

  HistoryResponse copyWith({
    List<History>? data,
  }) =>
      HistoryResponse(
        data: data ?? this.data,
      );

  factory HistoryResponse.fromRawJson(String str) =>
      HistoryResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HistoryResponse.fromJson(Map<String, dynamic> json) =>
      HistoryResponse(
        data: List<History>.from(json["data"].map((x) => History.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}
