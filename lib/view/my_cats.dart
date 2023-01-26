import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/gen/assets.gen.dart';

import 'package:flutter_application_1/models/fake_data.dart';
import 'package:flutter_application_1/component/my_components.dart';
import 'package:flutter_application_1/component/my_string.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../component/my_Colors.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodymargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(bodymargin),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  Assets.images.techbot.path,
                  width: 100,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  MyStrings.succesFullEnterEmail,
                  style: textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextField(
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "نام و نام خانوادگی",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  MyStrings.selectedCats,
                  style: textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 80,
                    child: GridView.builder(
                        itemCount: tagList.length,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                childAspectRatio: 0.25),
                        itemBuilder: ((context, index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                if (!selectedTags.contains(tagList[index])) {
                                  selectedTags.add(tagList[index]);
                                } else {
                                  // ignore: avoid_print
                                  print(
                                      "${selectedTags[index].title} is exist");
                                }
                              });
                            },
                            child: MainTags(
                              textTheme: textTheme,
                              index: index,
                            ),
                          );
                        })),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  Assets.icons.arrow.path,
                  scale: 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: GridView.builder(
                        itemCount: selectedTags.length,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 2,
                                childAspectRatio: 0.25),
                        itemBuilder: ((context, index) {
                          return Container(
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: SolidColors.submitArticle,
                            ),
                            height: 20,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 5, 15, 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    selectedTags[index].title,
                                    textAlign: TextAlign.center,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                      onTap: (() {
                                        setState(() {
                                          selectedTags.removeAt(index);
                                        });
                                      }),
                                      child: const Icon(CupertinoIcons.delete)),
                                ],
                              ),
                            ),
                          );
                        })),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
