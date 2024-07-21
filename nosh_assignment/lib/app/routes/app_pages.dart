import 'package:get/get.dart';
import 'package:nosh_assignment/app/modules/landing_page/binding/landing_binding.dart';
import 'package:nosh_assignment/app/modules/landing_page/view/landing_screen.dart';
import 'package:nosh_assignment/app/modules/recipes/bindings/recipes_binding.dart';
import 'package:nosh_assignment/app/modules/recipes/views/recipes_screen.dart';
import 'package:nosh_assignment/app/routes/app_routes.dart';



class AppPages {
  static final pages = [
    GetPage(
        name: Routes.RECIPES_SCREEN,
        page: () => const RecipeScreen(),
        binding: RecipeBinding(),
       ),
    GetPage(
      name: Routes.LANDING_SCREEN,
      page: () => const LandingScreen(),
      binding: LandingBindings(),
    ),
  ];
}
