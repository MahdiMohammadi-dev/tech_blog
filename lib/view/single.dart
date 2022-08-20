import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:tech_blog/component/MyComponent.dart';
import 'package:tech_blog/component/colors.dart';
import 'package:tech_blog/gen/assets.gen.dart';

class Single extends StatelessWidget {
  const Single({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Stack(children: [
            CachedNetworkImage(
              imageUrl: "img",
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
          Positioned(child: Container(
            height: 60,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: GradientColors.singleappbargradient,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                SizedBox(width: 20,),
                Icon(Icons.arrow_back,color: Colors.white,size: 30,),
                Expanded(child: SizedBox()),
                Icon(Icons.bookmark_border_outlined,color: Colors.white,size: 24,),
                SizedBox(width: 20,),
                Icon(Icons.share,color: Colors.white,size: 24,),
                SizedBox(width: 20,),
              ],
            ),
          )),
          ]),
          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "راز های اساسین کرید والهالا؛ از هری پاتر و ارباب حلقه ها  تا دارک سولز",
              maxLines: 2,
              style: TextStyle(fontSize: 15,
              color: Colors.black,
              fontFamily: 'iransans-black',
              ),
              ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Image(
                  height: 50,
                  image: AssetImage(Assets.images.avatar.path,)),
                  const SizedBox(width: 16,),
                   const Text(
                    "مهدی محمدی",
                style: TextStyle(fontSize: 10,
                color: Colors.black,
                fontFamily: 'iransans-medium',
                ),
                ),
                const SizedBox(width: 16,),
                   const Text(
                  "تاریخ",
                style: TextStyle(fontSize: 10,
                color: Color.fromARGB(255, 156, 156, 156),
                fontFamily: 'iransans-regular',
                ),
                ),
                
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: HtmlWidget(
              '''
              <h1>Mahdi Mohammadi</h1>
              <h2>Sasan Safari</h2>
              <h3>REza Ahmadi</h3>
              <h4>Sahar Eyvazzadeh</h4>''',
              textStyle: const TextStyle(fontSize: 10,
                  color: Color.fromARGB(255, 156, 156, 156),
                  fontFamily: 'iransans-regular',
            ),enableCaching: true,
            onLoadingBuilder: ((context, element, loadingProgress) => const Loading()),
            ),
          ),
        ],
      ),
    ));
  }
}
