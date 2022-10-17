import 'package:get/get.dart';
import 'package:online_shop/logic/controller/auth_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(AuthController());
  }

}