import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/MyComponent.dart';
import 'package:tech_blog/component/colors.dart';
import 'package:tech_blog/component/strings.dart';
import 'package:tech_blog/controller/Single_Article_Controller.dart';
import 'package:tech_blog/controller/home_screencontroller.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/view/article_list_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.size,
    required this.bodymargin,
  }) : super(key: key);

  final Size size;
  final double bodymargin;

  HomeScreenController homeScreenController = Get.put(HomeScreenController());
  SingleArticleController singleArticleController = Get.put(SingleArticleController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Obx(
          (() =>  Padding(
            padding: const EdgeInsets.only(top: 10),
            child: homeScreenController.loading.value==false?
             Column(
                children: [
                  //// Appbar barname
            
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: poster(),
                  ),
            
                  const SizedBox(
                    height: 16,
                  ),
              
                 tags(),
            
                  ///see more "moshahede daghtarin neveshte "
            
                  const SizedBox(
                    height: 15,
                  ),
            
                  GestureDetector(onTap: (() {
                   Get.to(ArticleListScreen());
                  }),
                    child: const SeeMoreDaghtarinNeveshte()),
            
                  ///listview 2
            
                  topvisited(),
                  const SizedBox(
                    height: 15,
                  ),
            
                  const SeeMorePodcast(),
                  topPodcast(),
                  const SizedBox(
                    height: 60,
                  )
                ],
              ):
              const Center(child:  Loading()),
          )
        ),
          
        ),
      ),
    );
  }

  Widget topvisited() {
    SingleArticleController singleArticleController = Get.put(SingleArticleController());
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topVisitedList.length,
          itemBuilder: ((context, index) {
            ///blogitem

            return GestureDetector(
              onTap: (() {
               singleArticleController.getArticleInfo(
                 homeScreenController.topVisitedList[index].id);
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
                            imageUrl:
                                homeScreenController.topVisitedList[index].image!,
                            imageBuilder: (context, imageprovider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                image: DecorationImage(
                                    image: imageprovider, fit: BoxFit.cover),
                              ),
                              foregroundDecoration:const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(16)
                                ),
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
                            placeholder: (context, url) => const Loading(),
                            errorWidget: (context, url, error) => const Icon(
                                Icons.image_not_supported_outlined,
                                size: 60,
                                color: Colors.grey),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  homeScreenController
                                      .topVisitedList[index].author!,
                                  style: const TextStyle(
                                      color: SolidColor.lightText,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12.0,
                                      fontFamily: 'iransans-regular'),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      homeScreenController
                                          .topVisitedList[index].view!,
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
                        homeScreenController.topVisitedList[index].title!,
                        style: const TextStyle(
                          fontFamily: 'iransans-medium',
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget topPodcast() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topPodcast.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  right:
                      index == 0 ? MediaQuery.of(context).size.width / 35 : 25),
              child: SizedBox(
                child: Column(
                  children: [
                    CachedNetworkImage(
                      imageUrl: homeScreenController.topPodcast[index].poster!,
                      imageBuilder: (context, imageprovider) => Container(
                        height: size.height / 5.3,
                        width: size.width / 2.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              image: imageprovider, fit: BoxFit.cover),
                        ),
                      ),
                      placeholder: (context, url) => const Loading(),
                      errorWidget: (context, url, error) => const Icon(
                          Icons.image_not_supported_outlined,
                          size: 60,
                          color: Colors.grey,
                     ),
                    ),
                    Text(
                      homeScreenController.topPodcast[index].title!,
                      style: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'iransans-medium',
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }

  Widget poster() {
    return Stack(
      children: [
        Container(
          width: size.width / 1.20,
          height: size.height / 4.2,
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: (context, imageprovider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(image: imageprovider, fit: BoxFit.cover),
              ),
              foregroundDecoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(16)),
                gradient: LinearGradient(
                  colors: GradientColors.homepostercovergradient,
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            placeholder: (context, url) => const Loading(),
            errorWidget: (context, url, error) => const Icon(
                Icons.image_not_supported_outlined,
                size: 60,
                color: Colors.grey),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    homepagepostermap["Writer"] +
                        "-" +
                        homepagepostermap["Date"],
                    style: const TextStyle(
                        color: SolidColor.lightText,
                        fontWeight: FontWeight.w300,
                        fontSize: 12.0,
                        fontFamily: 'iransans-regular'),
                  ),
                  Row(
                    children: [
                      Text(
                        homepagepostermap["View"],
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
              Text(
                homeScreenController.poster.value.title!, 
                style: const TextStyle(
                  fontSize: 13,
                  color: SolidColor.lightText,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'iransans-black',
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget tags(){
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagName.length,
          itemBuilder: ((context, index) {
            return GestureDetector(
              onTap:(){
             singleArticleController.getArticleInfo(
                 singleArticleController.releatedList[index].id);
              },
              child: Padding(
                padding: EdgeInsets.only(right: index == 0 ? bodymargin : 0),
                child: Padding(
                  padding:
                      EdgeInsets.fromLTRB(8, 8, index == 0 ? bodymargin : 11, 8),
                  child: Tag_List_Main(
                    bodymargin: bodymargin,
                    index: index,
                  ),
                ),
              ),
            );
          })),
    );
  }
  

}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width / 10, bottom: 8),
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        ImageIcon(
          AssetImage(
            Assets.images.mic.path,
          ),
          color: SolidColor.seemore,
        ),
        const SizedBox(width: 5),
        const Text(
          Strings.viewHotPodcast,
          style: TextStyle(
            color: SolidColor.seemore,
            fontFamily: 'iransans-black',
          ),
        ),
      ]),
    );
  }
}

class SeeMoreDaghtarinNeveshte extends StatelessWidget {
  const SeeMoreDaghtarinNeveshte({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          right: MediaQuery.of(context).size.width / 10, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ImageIcon(
            AssetImage(
              Assets.images.pen.path,
            ),
            color: SolidColor.seemore,
          ),
          const SizedBox(width: 5),
          const Text(
            Strings.viewMoreHotText,
            style: TextStyle(
              color: SolidColor.seemore,
              fontFamily: 'iransans-black',
            ),
          ),
        ],
      ),
    );
  }
}
