import 'dart:convert';
import 'package:construcaosoftware/controller/url/config_url.dart';
import 'package:dio/dio.dart';

class ServiceDioProvider {
  final dio = Dio();
  final urlDescover = ConfigURL();
  String? token;

  Dio getDio() {

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
       
        // options.headers
        //     .addAll({'Authorization': controllerSplash?.tokenService});
        options.headers.addAll({'Access-Control-Allow-Credentials': true});
        options.headers.addAll({
          'Access-Control-Allow-Headers':
              'Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token'
        });
        options.headers
            .addAll({'Access-Control-Allow-Methods': 'GET, POST, OPTIONS'});
       
        var urlSistema = await urlDescover.url(options.path.split('/').first);
        if (urlSistema != null) {
          options.path =
              options.path.replaceAll(options.path.split('/').first, '');
          options.baseUrl = urlSistema;
        }
        return handler.next(options);
      },
      onResponse: (response, handler) {
        if (response.data.runtimeType == String) {
          response.data = const JsonCodec().decode(response.data)['sucesso'];
          return handler.next(response);
        }
        if (response.data['sucesso'] != null) {
          response.data = response.data['sucesso'];
          return handler.next(response);
        }
        return handler.next(response);
      },
      onError: (e, handler) {
        DioError? erro; 
       
        // print(e.response?.data);
        if (e.response?.data['erro'] != null) {
          erro = DioError(
              type: DioErrorType.other,
              requestOptions: e.requestOptions,
              error: e.response!.data['erro']);
        }
        return handler.next(erro ?? e);
      },
    ));
    return dio;
  }
}
