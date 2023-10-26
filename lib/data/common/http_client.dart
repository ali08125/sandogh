import 'package:dio/dio.dart';
import 'package:sandogh/data/repo/auth_repository.dart';

final Dio httpClient = Dio(BaseOptions(baseUrl: 'http://192.168.54.137:8000/'))
  ..interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      final authInfo = AuthRepository.authChangeNotifir.value;
      if (authInfo != null && authInfo.accessToken.isNotEmpty) {
        options.headers['Authorization'] =
            'Bearer ${authInfo.accessToken}';
      }
      handler.next(options);
    },
  ));
