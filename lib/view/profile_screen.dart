import 'package:flutter/material.dart';
import '../MyComponent.dart';
import '../gen/assets.gen.dart';
import 'package:tech_blog/colors.dart';
import 'package:tech_blog/strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    Key? key,
    required this.size,
    required this.bodymargin,
  }) : super(key: key);

  final Size size;
  final double bodymargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage(
              Assets.images.avatar.path,
            ),
            height: 100,
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ImageIcon(
                AssetImage(
                  Assets.images.pen.path,
                ),
                color: SolidColor.seemore,
              ),
              const SizedBox(
                width: 10,
              ),
              const Text(
                Strings.imageprofileedit,
                style: TextStyle(
                  fontFamily: 'iransans-medium',
                  fontSize: 12,
                  color: SolidColor.seemore,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "فاطمه امیری",
            style: TextStyle(
              fontFamily: 'iransans-regular',
            ),
          ),
          const Text(
            "jnsm90@yahoo.com",
            style: TextStyle(
              fontFamily: 'iransans-regular',
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          MyDivider(size: size),
          InkWell(
            onTap: () {},
            splashColor: const Color.fromARGB(255, 110, 0, 124),
            child: const Center(
              child: SizedBox(
                height: 45,
                child: Text(
                  Strings.myfavoriteblog,
                  style: TextStyle(
                      fontFamily: 'iransans-medium', color: Colors.black),
                ),
              ),
            ),
          ),
          MyDivider(size: size),
          InkWell(
            onTap: () {},
            splashColor: const Color.fromARGB(255, 110, 0, 124),
            child: const Center(
              child: SizedBox(
                height: 45,
                child: Text(
                  Strings.myfavoritepodcast,
                  style: TextStyle(
                      fontFamily: 'iransans-medium', color: Colors.black),
                ),
              ),
            ),
          ),
          MyDivider(size: size),
          InkWell(
            onTap: () {},
            splashColor: const Color.fromARGB(255, 110, 0, 124),
            child: const Center(
              child: SizedBox(
                height: 45,
                child: Text(
                  Strings.logout,
                  style: TextStyle(
                      fontFamily: 'iransans-medium', color: Colors.black),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 60,
          )
        ],
      )),
    );
  }
}
