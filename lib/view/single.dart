import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/my_components.dart';
import 'package:flutter_application_1/controller/list_article_controler.dart';
import 'package:flutter_application_1/controller/single_article_controler.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/view/article_list_screen.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import '../component/my_String.dart';
import '../component/my_colors.dart';
import '../controller/home_screen_controler.dart';

// ignore: must_be_immutable
class Single extends StatelessWidget {
  Single({Key? key}) : super(key: key);

  var singleArticleControler = Get.find<SingleArticleControler>();

  var homeScreenController = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    var textThemes = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodymargin = size.width / 15;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => singleArticleControler.articleInfoModel.value.content == null
              ? SizedBox(height: Get.height, child: const loading())
              : Column(
                  children: [
                    Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl: singleArticleControler
                              .articleInfoModel.value.image!,
                          imageBuilder: (context, imageProvider) =>
                              Image(image: imageProvider),
                          placeholder: (context, url) => const loading(),
                          errorWidget: (context, url, error) =>
                              Image.asset(Assets.images.singlePlaceHolder.path),
                        ),
                        Positioned(
                            top: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 60,
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                    Color.fromARGB(0, 0, 0, 0),
                                    Color.fromARGB(255, 68, 4, 87)
                                  ])),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: const Icon(
                                      Icons.arrow_back,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Expanded(
                                      child: SizedBox(
                                    width: 50,
                                  )),
                                  const Icon(
                                    Icons.bookmark_outline,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  GestureDetector(
                                    //TODO:نیاز به اصلاح داره
                                    onTap: () async {
                                      await Share.share(
                                          // singleArticleControler.getArticleInfo(
                                          //     Response().toString())
                                          // singleArticleControler.getArticleInfo(
                                          //     singleArticleControler
                                          //         .articleInfoModel
                                          //         .toJson())
                                          "salam");
                                    },
                                    child: const Icon(
                                      Icons.share,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                            ))
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        singleArticleControler.articleInfoModel.value.title!,
                        style: textThemes.bodyText2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: [
                        Image.asset(
                          Assets.icons.profileimg.path,
                          scale: 7,
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          singleArticleControler.articleInfoModel.value.author!,
                          style: textThemes.bodyText1,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          singleArticleControler
                              .articleInfoModel.value.createdAt!,
                          style: textThemes.caption,
                        ),
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: HtmlWidget(
                        singleArticleControler.articleInfoModel.value.content!,
                        textStyle: textThemes.caption,
                        enableCaching: true,
                        onLoadingBuilder: (context, element, loadingProgress) =>
                            const loading(),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: singleArticleControler.tagsList.length,
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () async {
                            var tagsId =
                                singleArticleControler.tagsList[index].id!;
                            await Get.find<ListArticleControler>()
                                .getListArticleWithTagId(tagsId.toString());
                            Get.to(ArticleListScreen());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: SolidColors.divideColor,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  singleArticleControler.tagsList[index].title!,
                                  textAlign: TextAlign.center,
                                  style: textThemes.headline2,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: bodymargin),
                      child: Row(
                        children: [
                          ImageIcon(
                            AssetImage(Assets.icons.write.path),
                            color: SolidColors.colorTitle,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(MyStrings.viewHottestBlog,
                              style: textThemes.headline3),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height / 3,
                      child: ListView.builder(
                        itemCount: singleArticleControler.relatedList.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              singleArticleControler.getArticleInfo(
                                  singleArticleControler
                                      .relatedList[index].id!);
                            },
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(
                                  0, 15, index == 0 ? bodymargin : 10, 10),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: size.height / 5.3,
                                    width: size.width / 2,
                                    child: Stack(children: [
                                      CachedNetworkImage(
                                        imageUrl: singleArticleControler
                                            .relatedList[index].image!,
                                        imageBuilder: (context, imageProvider) {
                                          return Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.all(
                                                  Radius.circular(16),
                                                ),
                                                image: DecorationImage(
                                                    image: imageProvider,
                                                    fit: BoxFit.cover)),
                                          );
                                        },
                                        placeholder: (context, url) =>
                                            const loading(),
                                        // ignore: prefer_const_constructors
                                        errorWidget: (context, url, error) =>
                                            const Center(
                                          child: Icon(Icons
                                              .image_not_supported_outlined),
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 8,
                                        left: 0,
                                        right: 0,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                  singleArticleControler
                                                      .relatedList[index]
                                                      .author!,
                                                  style: textThemes.subtitle1),
                                              Row(
                                                children: [
                                                  Text(
                                                    singleArticleControler
                                                        .relatedList[index]
                                                        .view!,
                                                    style: textThemes.subtitle1,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  const Icon(
                                                    Icons.remove_red_eye_sharp,
                                                    size: 14,
                                                    color: Colors.white,
                                                  )
                                                ],
                                              )
                                            ]),
                                      ),
                                    ]),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  SizedBox(
                                    width: size.width / 2,
                                    child: Text(
                                      singleArticleControler
                                          .relatedList[index].title!,
                                      style: textThemes.bodyText1,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
        ),
      )),
    );
  }
}
