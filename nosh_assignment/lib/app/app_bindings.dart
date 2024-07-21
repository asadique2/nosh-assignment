import 'package:get/get.dart';
import 'package:nosh_assignment/app/data/repository/recipes_repository.dart';
import 'package:nosh_assignment/app/modules/landing_page/controller/landing_controller.dart';
import 'package:nosh_assignment/app/modules/recipes/controllers/recipes_controller.dart';

import 'data/network/network_request.dart';

class AppBinding extends Bindings {
  @override

  void dependencies() {
    Get.put(NetworkRequester(), permanent: true);
    Get.put(RecipesRepository());


    Get.put(RecipeController());
    Get.put(LandingController());

  }
}
