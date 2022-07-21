import 'package:construcaosoftware/controller/services/user_service.dart';
import 'package:construcaosoftware/model/Usuario.dart';
import 'package:construcaosoftware/model/UsuarioRegister.dart';
import 'package:get/get.dart';


class ControllerLogin extends GetxController  {
  bool isLoading = false;
 
  Usuario? usuario;
  
  RxList<Usuario> nUserLogin = <Usuario>[].obs;
  UserService authService = Get.find();


  void loginUser(
    String email, String password,
    {    Function()? loading,
    Function()? done,
    Function(String fail)? fail,}
  ) {
    loading?.call();
    Map<String, dynamic> userLogin = {
      'email':email,
      "password": password,
    
    };

    authService.login(userLogin)
        .then((userFull) {
      usuario = userFull;
      done?.call();
     
  }).catchError((onError) {
      fail?.call("Usuário ou senha incorreto");
    });
  }

void registerUser(
    UsuarioRegister user,
    {    Function()? loading,
    Function()? done,
    Function(String fail)? fail,}
  ) {
    loading?.call();
    Map<String, dynamic> userLogin = {
      "email":user.email,
      "password": user.password,
      "name": user.name, 
      "birth": user.birth, 
      "gender": user.gender,
      "phone": user.phone,
      "admin": false

    
    };

    authService.createUser(userLogin)
        .then((userFull) {
      usuario = userFull;
      done?.call();
     
  }).catchError((onError) {
      fail?.call("Usuário ou senha incorreto");
    });
  }
 
}
