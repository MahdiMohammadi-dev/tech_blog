class HashTags {
  String title;

  HashTags({required this.title});
}

class BlogList {
  String id;
  String imageUrl;
  String title;
  String writer;
  String writerImageUrl;
  String date;
  String content;
  String views;

  BlogList(
      {required this.content,
      required this.date,
      required this.id,
      required this.imageUrl,
      required this.title,
      required this.views,
      required this.writer,
      required this.writerImageUrl});
}

class PodcastList {
  String title;
  String imageUrl;

  PodcastList({required this.title, required this.imageUrl});
}
