import 'package:get/get.dart';
import 'package:tech_blog/component/api_link.dart';
import 'package:tech_blog/models/article_info_model.dart';
import 'package:tech_blog/models/article_model.dart';
import 'package:tech_blog/models/tag_model.dart';
import 'package:tech_blog/services/dio_sevice.dart';
import 'package:tech_blog/view/single.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleinfomodel = ArticleInfoModel().obs;
  RxList<TagModel> tagList = RxList();
  RxList<ArticleModel> releatedList = RxList();

  @override
  void onInit() {
    super.onInit();
    getArticleInfo(id);
  }

  getArticleInfo(var id) async {
    articleinfomodel = ArticleInfoModel().obs;
    var userId = '';

    loading.value = true;
    var response = await DioService().getMethodFromServer(ApiLink.baseurl +
        'article/get.php?command=info&id=$id&user_id=$userId');

    if (response.statusCode == 200) {
      articleinfomodel.value = ArticleInfoModel.fromJson(response.data);

      loading.value = false;
    }

    tagList.clear();
    response.data['tags'].forEach((element) {
      tagList.add(TagModel.fromJson(element));
    });

    releatedList.clear();
    response.data['related'].forEach((element) {
      releatedList.add(ArticleModel.fromJson(element));
    });
     Get.to(  Single());
    // List<dynamic> rawArticleList = response.data;
  }
}
