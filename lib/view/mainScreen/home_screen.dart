import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/my_Colors.dart';
import 'package:flutter_application_1/component/my_String.dart';
import 'package:flutter_application_1/controller/single_article_controler.dart';
import 'package:flutter_application_1/view/article_list_screen.dart';
import 'package:get/get.dart';
import '../../controller/home_screen_controler.dart';
import '../../gen/assets.gen.dart';
import '../../component/my_components.dart';
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodymargin,
  }) : super(key: key);

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SingleArticleControler singleArticleControler =
      Get.put(SingleArticleControler());

  final Size size;
  final TextTheme textTheme;
  final double bodymargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
            child: homeScreenController.loading.value == false
                ? Column(
                    children: [
                      homePoster(),
                      homeTags(),
                      const SizedBox(
                        height: 40,
                      ),
                      GestureDetector(
                          onTap: () {
                            Get.to(ArticleListScreen());
                          },
                          child: SeeMoreBlog(
                              bodymargin: bodymargin, textTheme: textTheme)),
                      topVisited(),
                      const SizedBox(
                        height: 40,
                      ),
                      SeeMorePodcast(
                          bodymargin: bodymargin, textTheme: textTheme),
                      podcastList(),
                      const SizedBox(
                        height: 60,
                      )
                    ],
                  )
                : SizedBox(height: Get.height / 1.5, child: const loading()),
          ),
        ));
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topVisitedList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                singleArticleControler.getArticleInfo(
                    homeScreenController.topVisitedList[index].id);
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
                          imageUrl:
                              homeScreenController.topVisitedList[index].image!,
                          imageBuilder: (context, imageProvider) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                  image: DecorationImage(
                                      image: imageProvider, fit: BoxFit.cover)),
                            );
                          },
                          placeholder: (context, url) => const loading(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.image_not_supported_outlined),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 0,
                          right: 0,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                    homeScreenController
                                        .topVisitedList[index].author!,
                                    style: textTheme.subtitle1),
                                Row(
                                  children: [
                                    Text(
                                      homeScreenController
                                          .topVisitedList[index].view!,
                                      style: textTheme.subtitle1,
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
                        homeScreenController.topVisitedList[index].title!,
                        style: textTheme.bodyText1,
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
      ),
    );
  }

  Widget podcastList() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          itemCount: homeScreenController.topPodcasts.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(0, 15, index == 0 ? bodymargin : 10, 10),
              child: Column(
                children: [
                  SizedBox(
                      height: size.height / 5.3,
                      width: size.width / 2,
                      child: CachedNetworkImage(
                        imageUrl:
                            homeScreenController.topPodcasts[index].poster!,
                        imageBuilder: (context, imageProvider) {
                          return Container(
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(16)),
                                image: DecorationImage(
                                    image: imageProvider, fit: BoxFit.cover)),
                          );
                        },
                        placeholder: ((context, url) => const loading()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.image_not_supported_outlined),
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: size.width / 2,
                    child: Text(
                      homeScreenController.topPodcasts[index].title!,
                      style: textTheme.bodyText1,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

//اصلاح بشود
  Widget homeTags() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Get.find<HomeScreenController>().tags.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
                EdgeInsets.fromLTRB(0, 15, index == 0 ? bodymargin : 10, 0),
            child: MainTags(
              textTheme: textTheme,
              index: index,
            ),
          );
        },
      ),
    );
  }

  Widget homePoster() {
    return Stack(
      children: [
        Container(
          width: size.width / 1.14,
          height: size.height / 4.2,
          foregroundDecoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              gradient: LinearGradient(
                  colors: GradiantColors.gradiantColorPoster,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
            ),
            placeholder: (context, url) => const loading(),
            errorWidget: (context, url, error) =>
                const Icon(Icons.image_not_supported_outlined),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 0,
          left: 0,
          child: Column(
            children: [
              Text(
                homeScreenController.poster.value.title!,
                style: textTheme.headline1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    Key? key,
    required this.bodymargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodymargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodymargin),
      child: Row(
        children: [
          ImageIcon(
            AssetImage(Assets.icons.song.path),
            color: SolidColors.colorTitle,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(MyStrings.viewHottestPodcast, style: textTheme.headline3),
        ],
      ),
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    Key? key,
    required this.bodymargin,
    required this.textTheme,
  }) : super(key: key);

  final double bodymargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          Text(MyStrings.viewHottestBlog, style: textTheme.headline3),
        ],
      ),
    );
  }
}
