import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/home_screencontroller.dart';
import '../component/MyComponent.dart';
import '../component/colors.dart';
import '../component/strings.dart';
import '../gen/assets.gen.dart';
import '../models/fake_data.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    Key? key,
    required this.size,
    required this.bodymargin,
  }) : super(key: key);

  final Size size;
  final double bodymargin;

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [
              //// Appbar barname

              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: HomePagePoster(size: size),
              ),

              const SizedBox(
                height: 16,
              ),

              TagList(bodymargin: bodymargin),

              ///see more "moshahede daghtarin neveshte "

              const SizedBox(
                height: 15,
              ),

              const SeeMoreDaghtarinNeveshte(),

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
          ),
        ),
      ),
    );
  }

  Widget topvisited() {
    return SizedBox(
      height: size.height / 3.5,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topVisitedList.length,
          itemBuilder: ((context, index) {
            ///blogitem

            return Column(
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
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16),
                            ),
                            image: DecorationImage(
                              image: NetworkImage(
                                homeScreenController
                                    .topVisitedList[index].image!,
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          foregroundDecoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            gradient: LinearGradient(
                              colors: GradientColors.blogPost,
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                            ),
                          ),
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
         () =>   ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topPodcast.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  right:
                      index == 0 ? MediaQuery.of(context).size.width / 10 : 25),
              child: SizedBox(
                child: Column(
                  children: [
                    Container(
                      height: size.height / 5.1,
                      width: size.width / 2.5,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(16),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(homeScreenController.topPodcast[index].poster!),
                          fit: BoxFit.cover,
                        ),
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

class TagList extends StatelessWidget {
  const TagList({
    Key? key,
    required this.bodymargin,
  }) : super(key: key);

  final double bodymargin;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagName.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodymargin : 0),
              child: Padding(
                padding:
                    EdgeInsets.fromLTRB(8, 8, index == 0 ? bodymargin : 11, 8),
                child: Tag_List_Main(
                  bodymargin: bodymargin,
                  index: index,
                ),
              ),
            );
          })),
    );
  }
}

class HomePagePoster extends StatelessWidget {
  const HomePagePoster({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size.width / 1.20,
          height: size.height / 4.2,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(16)),
            image: DecorationImage(
              image: AssetImage(homepagepostermap["ImageAssets"]),
              fit: BoxFit.cover,
            ),
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
                homepagepostermap["Title"],
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
}
