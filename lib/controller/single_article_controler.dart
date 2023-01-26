import 'package:flutter_application_1/models/article_models.dart';
import 'package:flutter_application_1/models/tags_model.dart';
import 'package:flutter_application_1/servise/dio_service.dart';
import 'package:get/get.dart';
import '../component/api_component.dart';
import '../models/article_info_model.dart';
import '../view/single.dart';

class SingleArticleControler extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);
  Rx<ArticleInfoModel> articleInfoModel = ArticleInfoModel().obs;
  RxList<ArticleModel> relatedList = RxList();
  RxList<TagsModel> tagsList = RxList();
  getArticleInfo(var id) async {
    articleInfoModel = ArticleInfoModel().obs;
    Get.to(Single());
    loading.value = true;
    var userId = "";
    var responce = await DioService().getMethod(
        "${ApiConstant.baseUrl}/article/get.php?command=info&id=$id&user_id=$userId");

    if (responce.statusCode == 200) {
      articleInfoModel.value = ArticleInfoModel.fromJson(responce.data);
      loading.value = false;
    }
    tagsList.clear();
    responce.data["tags"].forEach((element) {
      tagsList.add(TagsModel.fromJson(element));
    });
    relatedList.clear();
    responce.data["related"].forEach((element) {
      relatedList.add(ArticleModel.fromJson(element));
    });
  }
}
