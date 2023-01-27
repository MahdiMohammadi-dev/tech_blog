import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/component/api_component.dart';
import 'package:flutter_application_1/servise/dio_service.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController emailtextEditingController = TextEditingController();
  TextEditingController activatecodetextEditingController =
      TextEditingController();

  register() async {
    Map<String, dynamic> map = {
      'email': emailtextEditingController,
      'command': 'register'
    };

    var response = await DioService().postMethod(map, ApiConstant.postRegister);
    print(response);
  }
}
