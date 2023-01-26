import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/mainScreen/main_screen.dart';
import 'package:flutter_application_1/component/my_Colors.dart';
import '../gen/assets.gen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (context) => const MainScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image(
            image: AssetImage(
              Assets.images.logo.path,
            ),
            height: 60,
          ),
          const SizedBox(
            height: 20,
          ),
          const SpinKitFadingCube(
            color: SolidColors.primeryColor,
            size: 30.0,
          ),
        ]),
      )),
    );
  }
}
