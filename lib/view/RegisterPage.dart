import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/strings.dart';
import 'package:tech_blog/view/my_cats.dart';
import 'package:validators/validators.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.images.techbot,
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: Strings.registertxt,
                      style: TextStyle(
                        fontFamily: 'iransans-medium',
                        color: Colors.black,
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    _showBottomsheet(context, size);
                  },
                  child: const Text(
                    "بزن بریم",
                    style: TextStyle(
                      fontFamily: 'iransans-medium',
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showBottomsheet(BuildContext context, Size size) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      Strings.enteryourmail,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'iransans-medium',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: TextField(
                        onChanged: (value) {
                          isEmail(value);

                          print(
                              value + "IsEmail : " + isEmail(value).toString());
                        },
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: "example@yahoo.com",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 175, 175, 175),
                            fontFamily: 'iransans-regular',
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (() {
                          Navigator.pop(context);
                          _coderegister(context, size);
                        }),
                        child: const Text("ادامه")),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<dynamic> _coderegister(BuildContext context, Size size) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      Strings.coderegister,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'iransans-medium',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: TextField(
                        onChanged: (value) {
                          isEmail(value);

                          print(
                              value + "IsEmail : " + isEmail(value).toString());
                        },
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: "******",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 175, 175, 175),
                            fontFamily: 'iransans-regular',
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: (() {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) =>  MyCats()));
                        }),
                        child: const Text("ادامه")),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
