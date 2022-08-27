import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/MyComponent.dart';
import 'package:tech_blog/controller/Single_Article_Controller.dart';
import 'package:tech_blog/controller/list_article_controller.dart';
import 'package:tech_blog/view/single.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({Key? key}) : super(key: key);
  ListArticleController listArticleController =Get.put(ListArticleController());
  SingleArticleController singleArticleController =Get.put(SingleArticleController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appbar("مقالات جدید"),
      body: Obx(
        (() => Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: listArticleController.articllist.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          singleArticleController.id.value = int.parse(
                              listArticleController.articllist[index].id.toString());

                          Get.to( Single());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Get.width / 3,
                                height: Get.height / 6,
                                child: CachedNetworkImage(
                                  imageUrl: listArticleController
                                      .articllist[index].image!,
                                  imageBuilder: (context, imageprovider) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(16)),
                                        image: DecorationImage(
                                          image: imageprovider,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                  placeholder: (context, url) {
                                    return const Loading();
                                  },
                                  errorWidget: (context, url, error) {
                                    return const Icon(
                                        Icons.image_not_supported_outlined,
                                        size: 50,
                                        color: Colors.grey);
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: Get.width / 2,
                                    child: Text(
                                      listArticleController
                                          .articllist[index].title!,
                                      textDirection: TextDirection.rtl,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        fontFamily: 'iransans-medium',
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        listArticleController
                                            .articllist[index].author!,
                                        style: const TextStyle(
                                          fontFamily: 'iransans-medium',
                                          fontSize: 10,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        listArticleController
                                                .articllist[index].view! +
                                            "بازدید",
                                        style: const TextStyle(
                                          fontFamily: 'iransans-medium',
                                          color: Colors.grey,
                                          fontSize: 10,
                                        ),
                                      ),
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
            )),
      ),
    ));
  }
}
