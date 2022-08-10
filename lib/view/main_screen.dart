import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tech_blog/component/MyComponent.dart';
import 'package:tech_blog/component/strings.dart';

import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/view/profile_screen.dart';
import '../component/colors.dart';
import 'home_screen.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatelessWidget {
  RxInt selectedPageIndex = 0.obs;

  MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    double bodymargin = size.width / 20;

    return Scaffold(
      key: _key,
      drawer: Padding(
        padding: EdgeInsets.only(right: bodymargin, left: bodymargin),
        child: Drawer(
          backgroundColor: SolidColor.scafoldBg,
          child: ListView(
            children: [
              Center(
                child: DrawerHeader(
                    child: Image.asset(
                  Assets.images.techblog.path,
                  scale: 3,
                )),
              ),
              const ListTile(
                title: Text("پروفایل کاربری",
                    style: TextStyle(
                      fontFamily: 'iransans-regular',
                      color: Colors.black,
                    )),
              ),
              const Divider(
                color: SolidColor.dividercolor,
              ),
              const ListTile(
                title: Text("درباره تک بلاگ",
                    style: TextStyle(
                      fontFamily: 'iransans-regular',
                      color: Colors.black,
                    )),
              ),
              const Divider(
                color: SolidColor.dividercolor,
              ),
              ListTile(
                title: const Text("اشتراک گذاری تک بلاگ",
                    style: TextStyle(
                      fontFamily: 'iransans-regular',
                      color: Colors.black,
                    )),
                onTap: () async {
                  await Share.share(Strings.sharetechblog);
                },
              ),
              const Divider(
                color: SolidColor.dividercolor,
              ),
               ListTile(
                title: const Text("تک بلاگ در گیت هاب",
                    style: TextStyle(
                      fontFamily: 'iransans-regular',
                      color: Colors.black,
                    )),
                onTap: () {
                  geturl(Strings.techbloggiturl);
                },
              ),
              const Divider(
                color: SolidColor.dividercolor,
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: SolidColor.scafoldBg,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: (() {
                _key.currentState!.openDrawer();
              }),
              child: const Icon(
                Icons.menu,
                color: Color.fromARGB(255, 5, 5, 5),
              ),
            ),
            Image.asset(
              Assets.images.techblog.path,
              height: size.height / 13.6,
            ),
            const Icon(Icons.search, color: Colors.black),
          ],
        ),
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Obx(
              () => IndexedStack(
                index: selectedPageIndex.value,
                children: [
                  HomeScreen(size: size, bodymargin: bodymargin), //0  Screen 1
                  ProfileScreen(
                      size: size, bodymargin: bodymargin), //1 Screen 2
                ],
              ),
            ),
          ),
          BottonNav(
            size: size,
            bodymargin: bodymargin,
            changeScreen: (int value) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                selectedPageIndex.value = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

class BottonNav extends StatelessWidget {
  const BottonNav({
    Key? key,
    required this.size,
    required this.bodymargin,
    required this.changeScreen,
  }) : super(key: key);

  final Size size;
  final double bodymargin;
  final Function(int) changeScreen;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 9,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: GradientColors.bottomNavbackground,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: bodymargin, right: bodymargin),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(18)),
              gradient: LinearGradient(
                colors: GradientColors.bottomNav,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: (() => changeScreen(0)),
                  icon: ImageIcon(
                    AssetImage(
                      Assets.images.home.path,
                    ),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: ImageIcon(
                    AssetImage(
                      Assets.images.par.path,
                    ),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: (() => changeScreen(1)),
                  icon: ImageIcon(
                    AssetImage(
                      Assets.images.user.path,
                    ),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
