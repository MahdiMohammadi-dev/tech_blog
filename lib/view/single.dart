import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tech_blog/component/MyComponent.dart';
import 'package:tech_blog/component/colors.dart';
import 'package:tech_blog/gen/assets.gen.dart';
import 'package:tech_blog/models/fake_data.dart';
import 'package:tech_blog/controller/Single_Article_Controller.dart';

class Single extends StatelessWidget {
  Single({Key? key}) : super(key: key);

  SingleArticleController singlearticlecontroller =
      Get.put(SingleArticleController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(children: [
            // Image and AppBar
            Stack(children: [
              CachedNetworkImage(
                imageUrl: "",
                imageBuilder: (context, imageprovider) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      image: DecorationImage(
                        image: imageprovider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
                placeholder: (context, url) {
                  return const Loading();
                },
                errorWidget: (context, url, error) {
                  return Image(
                      image: AssetImage(Assets.images.singlePlaceHolder.path));
                },
              ),
              Positioned(
                  child: Container(
                height: 60,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: GradientColors.singleappbargradient,
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    Expanded(child: SizedBox()),
                    Icon(
                      Icons.bookmark_border_outlined,
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
              )),
            ]),
            //  Blog Title
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                "راز های اساسین کرید والهالا؛ از هری پاتر و ارباب حلقه ها  تا دارک سولز",
                maxLines: 2,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontFamily: 'iransans-black',
                ),
              ),
            ),

            //  Avatar - Author - Date
            Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  Image(
                      height: 50,
                      image: AssetImage(
                        Assets.images.avatar.path,
                      )),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    "مهدی محمدی",
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.black,
                      fontFamily: 'iransans-medium',
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  const Text(
                    "تاریخ",
                    style: TextStyle(
                      fontSize: 10,
                      color: Color.fromARGB(255, 156, 156, 156),
                      fontFamily: 'iransans-regular',
                    ),
                  ),
                ],
              ),
            ),
            //Long Text
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                "لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.",
                textAlign: TextAlign.right,
                maxLines: 13,
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'iransans-regular',
                  fontSize: 10,
                ),
              ),
              // HtmlWidget(
              //   '''
              //     <p>
              //     لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ، و با استفاده از طراحان گرافیک است، چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است، و برای شرایط فعلی تکنولوژی مورد نیاز، و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد، کتابهای زیادی در شصت و سه درصد گذشته حال و آینده، شناخت فراوان جامعه و متخصصان را می طلبد، تا با نرم افزارها شناخت بیشتری را برای طراحان رایانه ای علی الخصوص طراحان خلاقی، و فرهنگ پیشرو در زبان فارسی ایجاد کرد، در این صورت می توان امید داشت که تمام و دشواری موجود در ارائه راهکارها، و شرایط سخت تایپ به پایان رسد و زمان مورد نیاز شامل حروفچینی دستاوردهای اصلی، و جوابگوی سوالات پیوسته اهل دنیای موجود طراحی اساسا مورد استفاده قرار گیرد.
              //     </p>
              //   ''',
              //   textStyle: const TextStyle(
              //     fontSize: 10,
              //     color: Color.fromARGB(255, 156, 156, 156),
              //     fontFamily: 'iransans-regular',
              //   ),
              //   enableCaching: true,
              //   onLoadingBuilder: ((context, element, loadingProgress) =>
              //       const Loading()),
              // ),
            ),
            //Category Model
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: SizedBox(
                width: 500,
                height: 70,
                child: ListView.builder(
                    itemCount: tagName.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: ((context, index) {
                      return Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 100,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 242, 242, 242),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(100)),
                              ),
                              child: Center(
                                  child: Text(
                                tagName[index].title,
                                style: const TextStyle(
                                  fontFamily: 'iransans-regular',
                                  fontSize: 10,
                                ),
                              )),
                            ),
                          ),
                        ],
                      );
                    })),
              ),
            ),
            // Neveshte Mortabet Titile
            Padding(
              padding: EdgeInsets.only(left: size.width / 2, bottom: 10),
              child: const Text(
                "نوشته های مرتبط",
                style: TextStyle(
                  fontFamily: 'iransans-black',
                  fontSize: 15,
                  color: SolidColor.colorTitle,
                ),
              ),
            ),
            // Neveshte Mortabet List View
            SizedBox(
              width: double.infinity,
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: blogList.length,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              right: index == 0
                                  ? MediaQuery.of(context).size.width / 10
                                  : 25),
                          child: SizedBox(
                            height: size.height / 5.3,
                            width: size.width / 2.5,
                            child: Stack(
                              children: [
                                CachedNetworkImage(
                                  imageUrl: blogList[index].imageUrl,
                                  imageBuilder: (context, imageprovider) =>
                                      Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      image: DecorationImage(
                                          image: imageprovider,
                                          fit: BoxFit.cover),
                                    ),
                                    foregroundDecoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(16)),
                                      gradient: LinearGradient(
                                        colors: [
                                          Colors.black,
                                          Color.fromARGB(0, 0, 0, 0),
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                  ),
                                  placeholder: (context, url) =>
                                      const Loading(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                          Icons.image_not_supported_outlined,
                                          size: 60,
                                          color: Colors.grey),
                                ),
                                Positioned(
                                  bottom: 10,
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        blogList[index].writer,
                                        style: const TextStyle(
                                            color: SolidColor.lightText,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12.0,
                                            fontFamily: 'iransans-regular'),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            blogList[index].views,
                                            style: const TextStyle(
                                              color: SolidColor.lightText,
                                              fontWeight: FontWeight.w300,
                                              fontSize: 12.0,
                                              fontFamily: 'iransans-regular',
                                            ),
                                          ),
                                          const Icon(
                                            Icons.remove_red_eye_sharp,
                                            color: Colors.white,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              right: index == 0
                                  ? MediaQuery.of(context).size.width / 10
                                  : 25),
                          child: SizedBox(
                            width: size.width / 2.5,
                            child: Text(
                              blogList[index].title,
                              style: const TextStyle(
                                fontFamily: 'iransans-medium',
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        ),
                      ],
                    );
                  })),
            ),
          ]),
        ),
      ),
    );
  }
}
