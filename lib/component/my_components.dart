import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:flutter_application_1/component/my_Colors.dart';
import 'package:flutter_application_1/component/text_theme.dart';
import 'package:flutter_application_1/controller/home_screen_controler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../gen/assets.gen.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.divideColor,
      indent: size.width / 6,
      endIndent: size.width / 6,
      thickness: 1,
    );
  }
}

// ignore: must_be_immutable
class MainTags extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var index;

  MainTags({
    Key? key,
    required this.textTheme,
    required this.index,
  }) : super(key: key);

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          gradient: LinearGradient(
              colors: GradiantColors.tags,
              begin: Alignment.bottomRight,
              end: Alignment.bottomLeft)),
      height: 20,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 5, 15, 5),
        child: Row(
          children: [
            ImageIcon(
              AssetImage((Assets.icons.hashtag.path)),
              color: Colors.white,
              size: 15,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              Get.find<HomeScreenController>().tags[index].title!,
              style: textTheme.headline2,
            )
          ],
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
MyLouncherUrl(String url) async {
  var uri = Uri.parse(url);

  if (!await canLaunchUrl(uri)) {
    await launchUrl(uri);
  } else {
    log("not lounch");
  }
}

// ignore: camel_case_types
class loading extends StatelessWidget {
  const loading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SpinKitFadingCube(
      size: 30,
      color: SolidColors.primeryColor,
    );
  }
}

PreferredSize appBar(String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60),
    child: AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Center(
              child: Text(
            title,
            style: ArticleListScreenTheme,
          )),
        )
      ],
      leading: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Container(
          width: 70,
          height: 70,
          decoration: const BoxDecoration(
            color: SolidColors.primeryColor,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.keyboard_arrow_right_rounded),
        ),
      ),
    ),
  );
}
