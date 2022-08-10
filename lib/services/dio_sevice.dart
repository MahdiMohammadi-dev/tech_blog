import 'package:dio/dio.dart';

class DioService {
  Future<dynamic> getMethodFromServer(String url) async {
    Dio dio = Dio();

    dio.options.headers['content-Type'] = 'application/json';

    return await dio
        .get(
          url,
          options: Options(responseType: ResponseType.json, method: 'Get'),
        )
        .then((value) => value);
  }
}
