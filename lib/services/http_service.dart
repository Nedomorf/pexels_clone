import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final dio = Dio();

class HttpService {
  late Dio _dio;

  void initHttpService() {
    final options = BaseOptions(
      baseUrl: 'https://api.pexels.com/v1/',
      headers: {'authorization': dotenv.env['API_KEY']},
    );

    _dio = Dio(options);
  }

  Future<dynamic> get(
      String path, MappedQueries? queries) async {
    final res = await _dio.get(path, queryParameters: queries);

    return res.data;
  }
}

typedef MappedQueries = Map<String, dynamic>;
