import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/register_controller.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';
import 'package:flutter_application_1/component/my_string.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:validators/validators.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  RegisterController registerController = Get.put(RegisterController());
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.techbot.path,
              width: 100,
            ),
            const SizedBox(
              height: 30,
            ),
            RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                    text: MyStrings.welcometext, style: textTheme.bodyText2)),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                _showEmailBottomSheet(context, size, textTheme);
              },
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "‌بزن بریم",
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Future<dynamic> _showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 3,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(MyStrings.enterYourEmail),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: TextField(
                        controller:
                            registerController.emailtextEditingController,
                        onChanged: (value) {
                          debugPrint("$value is Email : ${isEmail(value)}");
                        },
                        style: textTheme.bodyText1,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "techblog@email.com",
                            hintStyle: textTheme.headline5),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          registerController.register();
                          Navigator.pop(context);
                          _activatedCodeBottomSheet(context, size, textTheme);
                        },
                        child: const Text("ادامه"))
                  ],
                ),
              ),
            ),
          );
        }));
  }

  Future<dynamic> _activatedCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: ((context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 3,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(MyStrings.enterActivatedCode),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: TextField(
                        controller: registerController
                            .activatecodetextEditingController,
                        style: textTheme.bodyText1,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: "******", hintStyle: textTheme.headline5),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () => print("object"),
                        child: const Text("ادامه"))
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
