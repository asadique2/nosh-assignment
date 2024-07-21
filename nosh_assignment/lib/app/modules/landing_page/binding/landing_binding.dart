import 'package:get/get.dart';
import 'package:nosh_assignment/app/modules/landing_page/controller/landing_controller.dart';

class LandingBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(LandingController());
  }

}