import 'package:tech_blog/component/api_link.dart';

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
    image = ApiLink.hostdlurl+ element["image"];
  }
}