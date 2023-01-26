import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/my_components.dart';
import 'package:flutter_application_1/view/register/register_screen.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_application_1/component/my_Colors.dart';
import 'package:flutter_application_1/component/my_string.dart';
import 'package:flutter_application_1/view/mainScreen/home_screen.dart';
import 'package:flutter_application_1/view/mainScreen/profile_screen.dart';
import 'package:get/get.dart';
import '../../gen/assets.gen.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  RxInt selectedIndex = 0.obs;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodymargin = size.width / 15;

    // ignore: todo
    // TODO: implement build
    return SafeArea(
      child: Scaffold(
          key: _key,
          drawer: Drawer(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(children: [
                DrawerHeader(
                    child: Center(
                  child: Image.asset(
                    Assets.images.logo.path,
                    scale: 3,
                  ),
                )),
                const ListTile(title: Text("پروفایل کاربری")),
                const Divider(),
                const ListTile(title: Text("درباره تک‌بلاگ")),
                const Divider(),
                ListTile(
                  title: const Text("اشتراک گذاری تک بلاگ"),
                  onTap: () async {
                    await Share.share(MyStrings.shareit);
                  },
                ),
                const Divider(),
                ListTile(
                  title: const Text("تک‌بلاگ در گیت هاب"),
                  onTap: () {
                    MyLouncherUrl(MyStrings.techBlogGitHuburl);
                  },
                ),
                const Divider(),
              ]),
            ),
          ),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: SolidColors.scafoldBg,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: (() {
                      _key.currentState!.openDrawer();
                    }),
                    child: const Icon(Icons.menu, color: Colors.black)),
                Image(
                  image: AssetImage(Assets.images.logo.path),
                  height: size.height / 13.6,
                ),
                const Icon(Icons.search, color: Colors.black),
              ],
            ),
          ),
          body: Stack(
            children: [
              Positioned.fill(
                child: Obx((() => IndexedStack(
                      index: selectedIndex.value,
                      children: [
                        HomeScreen(
                            size: size,
                            textTheme: textTheme,
                            bodymargin: bodymargin),
                        ProfileScreen(
                            size: size,
                            textTheme: textTheme,
                            bodymargin: bodymargin),
                      ],
                    ))),
              ),
              BottomNavigation(
                size: size,
                bodymargin: bodymargin,
                changeScreens: (int value) {
                  selectedIndex.value = value;
                },
              ),
            ],
          )),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
    required this.size,
    required this.bodymargin,
    required this.changeScreens,
  }) : super(key: key);

  final Size size;
  final double bodymargin;
  final Function(int) changeScreens;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: size.height / 10,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: GradiantColors.bottomnavbg,
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding:
              EdgeInsets.only(right: bodymargin, left: bodymargin, bottom: 5),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                gradient: LinearGradient(
                    colors: GradiantColors.bottonNav,
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft)),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: (() => changeScreens(0)),
                      icon: ImageIcon(AssetImage(Assets.icons.icon.path),
                          color: SolidColors.lightText)),
                  IconButton(
                      onPressed: () {
                        //TODO check validate email
                        Get.to(RegisterScreen());
                      },
                      icon: ImageIcon(AssetImage(Assets.icons.w.path),
                          color: SolidColors.lightText)),
                  IconButton(
                      onPressed: () => changeScreens(1),
                      icon: ImageIcon(AssetImage(Assets.icons.user.path),
                          color: SolidColors.lightText)),
                ]),
          ),
        ),
      ),
    );
  }
}
