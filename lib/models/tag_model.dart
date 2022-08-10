class TagModel {
  String? id;
  String? title;


  TagModel({
    required this.id,
    required this.title,

  });

  TagModel.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
  }
}