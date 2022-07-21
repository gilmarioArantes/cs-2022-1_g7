import 'package:construcaosoftware/controller/url/config_url.dart';
import 'package:construcaosoftware/model/Usuario.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';


part 'user_service.g.dart';

@RestApi()
abstract class UserService {
  factory UserService(Dio dio, {String baseUrl}) = _UserService;

  @POST('${ConfigURL.CONSTRUCAO}/auth/login')
  Future<Usuario> login(@Body() Map<String,dynamic> map);

  @POST('${ConfigURL.CONSTRUCAO}/users')
  Future<Usuario> createUser(@Body() Map<String,dynamic> map);

}
