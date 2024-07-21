import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nosh_assignment/app/modules/recipes/views/recipes_screen.dart';
import 'package:nosh_assignment/base/base_controller.dart';
import 'package:nosh_assignment/utils/app_utils.dart';
import 'package:nosh_assignment/widgets/common_text/common_text.dart';

class LandingController extends BaseController {
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  RxInt currentNavigationItemIdx = RxInt(0);

  RxBool canExitTheApp = RxBool(false);

  DateTime backPressTime = DateTime.now();

  Map<String, Widget> bodyWidgetMap = {
    'Recipes': const RecipeScreen(),
    'List': Center(child: body(text: 'List Screen')),
    'Nosh': Center(child: body(text: 'Nosh Screen')),
    'MealPlan': Center(child: body(text: 'Meal Plan Screen')),
    'Profile': Center(child: body(text: 'Profile Screen')),
  }.obs;

  canCloseTheApp(bool status) {
    if (currentNavigationItemIdx.value != 0) {
      updateNavIdx(0);
    } else {
      AppUtils.showToast(msg: 'Tap again to exit');
      canExitTheApp.value = true;
      Future.delayed(const Duration(seconds: 2), () {
        canExitTheApp.value = false;
      });
    }
  }

  updateNavIdx(int idx) {
    currentNavigationItemIdx.value = idx;
  }

}
