import 'package:tech_blog/component/api_link.dart';

class ArticleInfoModel {
  String? id;
  String? title;
  String? content;
  String? image;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createdAt;
  bool? isFavarite;

// کانستراکتور کلی ساختیم ،و با این کار کانستراکتور همه شون ساخته شد
  ArticleInfoModel();

// کانستراکتور مربوطه به جیسون اونها
  ArticleInfoModel.fromJson(Map<String, dynamic> element) {

    var info = element['info'];

    id = info['id'];
    title = info ['title'];
    content = info ['content'];
    image = ApiLink.hostdlurl+ info ['image'];
    catId = info ['cat_id'];
    catName = info ['cat_name'];
    author = info ['author'];
    view = info ['view'];
    status = element['info']['status'];
    createdAt = info ['created_at'];
    isFavarite = info ['isFavorite'];
  }
}
