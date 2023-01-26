import 'package:flutter_application_1/component/api_component.dart';

class PosterModel {
  String? id;
  String? title;
  String? image;

  PosterModel({
    this.id,
    this.title,
    this.image,
  });

  PosterModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = ApiConstant.hostDlUrl + element["image"];
  }
}
