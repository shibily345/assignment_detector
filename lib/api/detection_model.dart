// To parse this JSON data, do
//
//     final detector = detectorFromJson(jsonString);

import 'dart:convert';

Detector detectorFromJson(String str) => Detector.fromJson(json.decode(str));

String detectorToJson(Detector data) => json.encode(data.toJson());

class Detector {
  Detector({
    required this.description,
    required this.value,
  });

  String description;
  int value;

  factory Detector.fromJson(Map<String, dynamic> json) => Detector(
        description: json["description"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "value": value,
      };
}
