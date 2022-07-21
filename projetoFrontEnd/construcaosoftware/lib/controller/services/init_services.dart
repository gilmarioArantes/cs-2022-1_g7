import 'package:construcaosoftware/controller/login/controller_login.dart';
import 'package:construcaosoftware/controller/services/service_dio_provider.dart';
import 'package:construcaosoftware/controller/services/user_service.dart';
import 'package:get/get.dart';

Future<void> initServices() async {
  Get.put(ServiceDioProvider());
  var dioConn = Get.find<ServiceDioProvider>().getDio();
  Get.put(UserService(dioConn));
 
  Get.put(ControllerLogin());
  // Get.put(ControllerSearchCountry());
}
