import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tech_blog/MyComponent.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/data_model.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/strings.dart';
import 'package:tech_blog/view/home_screen.dart';

import '../colors.dart';

class MyCats extends StatefulWidget {
  var bodymargin;
  MyCats({Key? key, bodymargin}) : super(key: key);

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 35,
                ),
                SvgPicture.asset(
                  Assets.images.techbot,
                  height: 100,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(Strings.congragulation,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'iransans-medium',
                    )),
                const Padding(
                  padding: EdgeInsets.all(40),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      alignLabelWithHint: true,
                      hintText: "نام و نام خانوادگی",
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 10, 10, 10),
                        fontFamily: 'iransans-regular',
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 1,
                ),
                const Text(
                  Strings.choosecats,
                  style: TextStyle(
                    fontFamily: 'iransans-medium',
                  ),
                ),

                //////Tag List
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 21),
                  child: SizedBox(
                    width: double.infinity,
                    height: 90,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 2,
                        childAspectRatio: 0.3,
                      ),
                      itemCount: tagName.length,
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          child: Tag_List_Main(bodymargin: 10, index: index),
                          onTap: () {
                            setState(() {
                              likeCats.add(tagName[index]);
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Image.asset(
                  Assets.images.arrowDown.path,
                  scale: 3,
                ),

                ///////Like Cats////////
                Padding(
                  padding: const EdgeInsets.only(top: 15, right: 21),
                  child: SizedBox(
                    width: double.infinity,
                    height: 90,
                    child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        crossAxisCount: 2,
                        childAspectRatio: 0.2,
                      ),
                      itemCount: likeCats.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                            height: 60,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 242, 242, 242),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(24)),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    likeCats[index].title,
                                    style: const TextStyle(
                                      fontSize: 11,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'iransans-regular',
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (!likeCats
                                            .contains(tagName[index])) {
                                          likeCats.remove(tagName[index]);
                                        }
                                      });
                                    },
                                    child: const Icon(
                                      Icons.delete,
                                      color: Colors.grey,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      },
                    ),
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
