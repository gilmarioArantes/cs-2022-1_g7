import 'package:construcaosoftware/screens/login/login_screen.dart';
import 'package:construcaosoftware/screens/register/singUpRegisterScreen.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  // ignore: missing_return
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // ignore: unused_local_variable
    final args = settings.arguments;

    switch (settings.name) {
      case '/login':
        return MaterialPageRoute(builder: (_) =>const LoginScreen());
      case '/signup':
        return MaterialPageRoute(builder: (_) => const SignUpScreenRegister());

  
      case '/':
      default:
        return MaterialPageRoute(builder: (_) =>const LoginScreen(),
         settings: settings);
    }
  }
}
