import 'package:get/get.dart';

import '../controllers/recipes_controller.dart';

class RecipeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RecipeController());
  }
}
