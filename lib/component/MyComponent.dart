import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:tech_blog/controller/home_screencontroller.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'colors.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColor.dividercolor,
      indent: size.width / 6,
      endIndent: size.width / 6,
      thickness: 1,
    );
  }
}

class Tag_List_Main extends StatelessWidget {
  Tag_List_Main({
    Key? key,
    required this.bodymargin,
    required this.index,
  }) : super(key: key);

  final double bodymargin;
  var index;

   HomeScreenController homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          gradient: LinearGradient(
            colors: GradientColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 8, index == 0 ? bodymargin : 15, 8),
          child: Row(
            children: [
              const Icon(
                Icons.tag,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                // Get.find<HomeScreenController>().tagList[index].title!,
                homeScreenController.tagList[index].title!,
                style: const TextStyle(
                  fontSize: 11,
                  color: SolidColor.lightText,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'iransans-regular',
                ),
              ),
            ],
          ),
        ));
  }
}

class Tag_List_Like_Add extends StatelessWidget {
  Tag_List_Like_Add({
    Key? key,
    required this.bodymargin,
    required this.index,
  }) : super(key: key);

  final double bodymargin;
  var index;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 60,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          gradient: LinearGradient(
            colors: GradientColors.tags,
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 8, index == 0 ? bodymargin : 15, 8),
          child: Row(
            children: [
              const Icon(
                Icons.tag,
                color: Colors.white,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                likeCats[index].title,
                style: const TextStyle(
                  fontSize: 11,
                  color: SolidColor.lightText,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'iransans-regular',
                ),
              ),
              
            ],
          ),
        ));
  }
}

geturl(String url) async {
  var uri = Uri.parse(url);

  if (await launchUrl(uri)) {
    await geturl(url);
  } else {
    print("The Url Dosen't Launch!");
  }
}

class Loading extends StatelessWidget {
  const Loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitCircle(
       color: Colors.purple,
        size: 60,
         );
  }
}



  PreferredSize appbar(String title) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions:  [
             Padding(
               padding:  const EdgeInsets.only(left:16),
               child: Center(
                child: Text(title,style: const TextStyle(
                  color: Color.fromARGB(255, 110, 0, 129),
                  fontFamily: 'iransans-medium',
                  fontSize: 15,
                ),),
               
               ),
             ),
          ],
          leading: Container(
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 75, 0, 88),
              shape: BoxShape.circle,
            ),
            child:const Icon(Icons.keyboard_arrow_right,size: 30,)
          ),
        ),
      ),
    );
  }