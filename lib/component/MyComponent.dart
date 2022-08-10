import 'package:flutter/material.dart';
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
                tagName[index].title,
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
