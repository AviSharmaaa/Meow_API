import 'dart:convert';

List<MeowwModel> meowwModelFromJson(String str) =>
    List<MeowwModel>.from(json.decode(str).map((x) => MeowwModel.fromJson(x)));

String meowwModelToJson(List<MeowwModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MeowwModel {
  MeowwModel({
    required this.id,
    required this.url,
    required this.width,
    required this.height,
  });

  String id;
  String url;
  int width;
  int height;

  factory MeowwModel.fromJson(Map<String, dynamic> json) => MeowwModel(
        id: json["id"],
        url: json["url"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "width": width,
        "height": height,
      };
}
