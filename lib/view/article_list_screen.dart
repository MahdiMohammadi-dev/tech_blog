import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/MyComponent.dart';
import 'package:tech_blog/component/colors.dart';
import 'package:tech_blog/controller/article_controller.dart';
import 'package:tech_blog/controller/home_screencontroller.dart';

class ArticleListScreen extends StatelessWidget {
  ArticleListScreen({Key? key}) : super(key: key);
  ArticleController articleController = Get.put(ArticleController());
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
                    itemCount: articleController.articllist.length,
                    itemBuilder: ((context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: Get.width / 3,
                              height: Get.height / 6,
                              child: CachedNetworkImage(
                                imageUrl:
                                    articleController.articllist[index].image!,
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
                                    articleController.articllist[index].title!,
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
                                      articleController
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
                                      articleController
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
                      );
                    })),
              ),
            )),
      ),
    ));
  }
}
