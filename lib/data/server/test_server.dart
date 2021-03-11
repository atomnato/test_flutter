import 'package:dio/dio.dart';

class TestServer {
  final Dio _dio = Dio();

  Future<List<dynamic>> getContentFromServer() async {
    final Response response =
        await _dio.get("https://kalyandoma.com/wp-json/wp/v2/posts");
    return response.data;
  }

  Future<String> getContentPageFromServer(int index) async {
    final Response response =
        await _dio.get("https://kalyandoma.com/wp-json/wp/v2/posts");
    String res = response.data[index]['content']['rendered'];
    return res;
  }
}
