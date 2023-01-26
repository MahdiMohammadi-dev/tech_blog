import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/my_components.dart';
import 'package:flutter_application_1/controller/list_article_controler.dart';
import 'package:flutter_application_1/controller/single_article_controler.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({super.key});
  ListArticleControler listArticleControler = Get.put(ListArticleControler());
  SingleArticleControler singleArticleControler =
      Get.put(SingleArticleControler());
  @override
  Widget build(BuildContext context) {
    var textThemes = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      appBar: appBar("لیست مقالات"),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.all(15),
          child: ListView.builder(
              itemCount: listArticleControler.articleList.length,
              itemBuilder: ((context, index) {
                return GestureDetector(
                  onTap: () {
                    singleArticleControler.getArticleInfo(
                        listArticleControler.articleList[index].id);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: Get.width / 3,
                          height: Get.height / 6,
                          child: CachedNetworkImage(
                            imageUrl:
                                listArticleControler.articleList[index].image!,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(16)),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                            ),
                            placeholder: (context, url) => const loading(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.image_not_supported_outlined),
                          ),
                        ),
                        Column(
                          children: [
                            SizedBox(
                              width: Get.width / 2,
                              child: Text(
                                listArticleControler.articleList[index].title!,
                                overflow: TextOverflow.clip,
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  listArticleControler
                                      .articleList[index].author!,
                                  style: textThemes.caption,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  "${listArticleControler.articleList[index].view!}بازدید",
                                  style: textThemes.caption,
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              })),
        ),
      ),
    ));
  }
}
