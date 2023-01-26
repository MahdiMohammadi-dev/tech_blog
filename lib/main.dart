import 'package:flutter/material.dart';
import 'package:flutter_application_1/component/my_Colors.dart';
import 'package:flutter_application_1/view/mainScreen/main_screen.dart';
import 'package:get/get.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
  //   statusBarColor: solidColors.statusbarColor,
  //   statusBarIconBrightness: Brightness.dark,
  //   systemNavigationBarColor: solidColors.systemNavigationBarColor,
  //   systemNavigationBarIconBrightness: Brightness.dark,
  // ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return GetMaterialApp(
        locale: const Locale("fa"),
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(width: 2))),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return textTheme.headline1;
              }
              return textTheme.subtitle1;
            }), backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return SolidColors.colorTitle;
              }
              return SolidColors.primeryColor;
            })),
          ),
          fontFamily: "peyda",
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontFamily: "peyda",
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: SolidColors.posterTitle),
            subtitle1: TextStyle(
                fontFamily: "peyda",
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: SolidColors.posterTitle),
            headline2: TextStyle(
                fontFamily: "peyda",
                fontWeight: FontWeight.w300,
                fontSize: 14,
                color: SolidColors.scafoldBg),
            button: TextStyle(
                fontFamily: "peyda",
                fontWeight: FontWeight.w300,
                color: SolidColors.scafoldBg),
            headline3: TextStyle(
                fontFamily: "peyda",
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: SolidColors.colorTitle),
            headline4: TextStyle(
                fontFamily: "peyda",
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color.fromARGB(255, 70, 70, 70)),
            headline5: TextStyle(
                fontFamily: "peyda",
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: Color.fromARGB(255, 219, 219, 219)),
            bodyText1: TextStyle(
                fontFamily: "peyda",
                fontWeight: FontWeight.w300,
                fontSize: 15,
                color: SolidColors.textTile),
            bodyText2: TextStyle(
                fontFamily: "peyda",
                fontWeight: FontWeight.w300,
                fontSize: 20,
                color: SolidColors.textTile),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: MainScreen());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
          ],
        ),
      ),
    );
  }
}
