import 'package:get/get.dart';
import 'package:tech_blog/component/api_link.dart';
import 'package:tech_blog/services/dio_sevice.dart';

class SingleArticleController extends GetxController {
  RxBool loading = false.obs;
  RxInt id = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    getArticleInfo();
  }

  getArticleInfo() async {
    loading.value = true;
    var response = await DioService().getMethodFromServer(ApiLink.getarticleitem);

    if(response.statusCode==200){
      response.data.forEach((element){
        
      });
      loading.value = false;
    }
    // List<dynamic> rawArticleList = response.data; 
  }
}
