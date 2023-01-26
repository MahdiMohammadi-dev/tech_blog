import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/my_Colors.dart';
import 'package:flutter_application_1/component/my_String.dart';
import '../../gen/assets.gen.dart';
import '../../component/my_components.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.bodymargin,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final double bodymargin;

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          ImageIcon(
            AssetImage(Assets.icons.profileimg.path),
            size: 100,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage(Assets.icons.write.path),
                color: SolidColors.colorTitle,
              ),
              Text(
                MyStrings.profileImgEdit,
                style: textTheme.headline3,
              )
            ],
          ),
          const SizedBox(height: 60),
          Text(
            MyStrings.profilename,
            style: textTheme.headline6,
          ),
          Text(
            MyStrings.profilemail,
            style: textTheme.headline6,
          ),
          TechDivider(size: size),
          InkWell(
            onTap: () {
              //function
            },
            splashColor: SolidColors.primeryColor,
            child: SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  MyStrings.myFavBlog,
                  style: textTheme.bodyText1,
                ),
              ),
            ),
          ),
          TechDivider(size: size),
          InkWell(
            onTap: () {
              //function
            },
            splashColor: SolidColors.primeryColor,
            child: SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  MyStrings.myFavPodcast,
                  style: textTheme.bodyText1,
                ),
              ),
            ),
          ),
          TechDivider(size: size),
          InkWell(
            onTap: () {
              //function
            },
            splashColor: SolidColors.primeryColor,
            child: SizedBox(
              height: 50,
              child: Center(
                child: Text(
                  MyStrings.logout,
                  style: textTheme.bodyText1,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }
}
