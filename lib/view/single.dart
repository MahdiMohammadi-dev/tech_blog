import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/MyComponent.dart';
import 'package:tech_blog/component/colors.dart';
import 'package:tech_blog/controller/home_screencontroller.dart';
import 'package:tech_blog/controller/list_article_controller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/controller/Single_Article_Controller.dart';
import 'package:tech_blog/view/article_list_screen.dart';


class Single extends StatelessWidget {
  SingleArticleController singlearticlecontroller =
      Get.put(SingleArticleController());
  ListArticleController listArticleController =
      Get.put(ListArticleController());
  HomeScreenController homeScreenController = Get.put(HomeScreenController());


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Obx(
            () => singlearticlecontroller.articleinfomodel.value.title==null?SizedBox(
              height: Get.height,
              child: 
              const Loading()): Column(children: [
              // Image and AppBar
              Stack(children: [
                CachedNetworkImage(
                  imageUrl:
                      singlearticlecontroller.articleinfomodel.value.image!,
                  imageBuilder: (context, imageprovider) {
                    return Image(image: imageprovider);
                  },
                  placeholder: (context, url) {
                    return const Loading();
                  },
                  errorWidget: (context, url, error) {
                    return Image(
                        image:
                            AssetImage(Assets.images.singlePlaceHolder.path));
                  },
                ),
                Positioned(
                    child: Container(
                  height: 60,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: GradientColors.singleappbargradient,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 30,
                      ),
                      Expanded(child: SizedBox()),
                      Icon(
                        Icons.bookmark_border_outlined,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.share,
                        color: Colors.white,
                        size: 24,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                )),
              ]),
              //  Blog Title
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  singlearticlecontroller.articleinfomodel.value.title!,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontFamily: 'iransans-black',
                  ),
                ),
              ),

              //  Avatar - Author - Date
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Image(
                        height: 50,
                        image: AssetImage(
                          Assets.images.avatar.path,
                        )),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      singlearticlecontroller.articleinfomodel.value.author!,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontFamily: 'iransans-medium',
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      singlearticlecontroller.articleinfomodel.value.createdAt!,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color.fromARGB(255, 156, 156, 156),
                        fontFamily: 'iransans-regular',
                      ),
                    ),
                  ],
                ),
              ),
              //Long Text
              Padding(
                padding: const EdgeInsets.all(12),
                child: HtmlWidget(
                  singlearticlecontroller.articleinfomodel.value.content!,
                  textStyle: const TextStyle(
                    fontSize: 10,
                    color: Color.fromARGB(255, 156, 156, 156),
                    fontFamily: 'iransans-regular',
                  ),
                  enableCaching: true,
                  onLoadingBuilder: ((context, element, loadingProgress) =>
                      const Loading()),
                ),
              ),
              //Category Model
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: SizedBox(
                  width: 500,
                  height: 70,
                  child: ListView.builder(
                      itemCount: singlearticlecontroller.tagList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () async {
                            await Get.find<ListArticleController>()
                                .getArticleListWithTagsId(
                                    singlearticlecontroller.tagList[index].id!);

                            Get.to(ArticleListScreen());
                          },
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 242, 242, 242),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100)),
                                  ),
                                  child: Center(
                                      child: Text(
                                    singlearticlecontroller
                                        .tagList[index].title!,
                                    style: const TextStyle(
                                      fontFamily: 'iransans-regular',
                                      fontSize: 10,
                                    ),
                                  )),
                                ),
                              ),
                            ],
                          ),
                        );
                      })),
                ),
              ),
              // Neveshte Mortabet Titile
              Padding(
                padding: EdgeInsets.only(left: size.width / 2, bottom: 10),
                child: const Text(
                  "نوشته های مرتبط",
                  style: TextStyle(
                    fontFamily: 'iransans-black',
                    fontSize: 15,
                    color: SolidColor.colorTitle,
                  ),
                ),
              ),
              // Neveshte Mortabet List View
              similar(singlearticlecontroller: singlearticlecontroller, size: size),
            ]),
          ),
        ),
      ),
    );
  }
}

class similar extends StatelessWidget {
  SingleArticleController singleArticleController = Get.put(SingleArticleController());
   similar({
    Key? key,
    required this.singlearticlecontroller,
    required this.size,
  }) : super(key: key);

  final SingleArticleController singlearticlecontroller;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: singlearticlecontroller.releatedList.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap: (() {
                singleArticleController.getArticleInfo(
                 singleArticleController.releatedList[index].id);
              }),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        right: index == 0
                            ? MediaQuery.of(context).size.width / 10
                            : 25),
                    child: SizedBox(
                      height: size.height / 5.3,
                      width: size.width / 2.5,
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: singlearticlecontroller
                                .releatedList[index].image!,
                            imageBuilder: (context, imageprovider) =>
                                Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                    image: imageprovider,
                                    fit: BoxFit.cover),
                              ),
                              foregroundDecoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(16)),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black,
                                    Color.fromARGB(0, 0, 0, 0),
                                  ],
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                ),
                              ),
                            ),
                            placeholder: (context, url) =>
                                const Loading(),
                            errorWidget: (context, url, error) =>
                                const Icon(
                                    Icons.image_not_supported_outlined,
                                    size: 60,
                                    color: Colors.grey),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  singlearticlecontroller
                                      .releatedList[index].author!,
                                  style: const TextStyle(
                                      color: SolidColor.lightText,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10.0,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: 'iransans-regular'),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      singlearticlecontroller
                                          .releatedList[index].view!,
                                      style: const TextStyle(
                                        color: SolidColor.lightText,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.0,
                                        fontFamily: 'iransans-regular',
                                      ),
                                    ),
                                    const Icon(
                                      Icons.remove_red_eye_sharp,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        right: index == 0
                            ? MediaQuery.of(context).size.width / 10
                            : 25),
                    child: SizedBox(
                      width: size.width / 2.5,
                      child: Text(
                        singlearticlecontroller
                            .releatedList[index].title!,
                        style: const TextStyle(
                            fontFamily: 'iransans-medium',
                            fontSize: 10),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ),
            );
          })),
    );
  }
}
