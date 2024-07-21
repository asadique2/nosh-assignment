import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nosh_assignment/app/data/model/dto/response.dart';
import 'package:nosh_assignment/app/data/model/response/DishModel.dart';
import 'package:nosh_assignment/app/data/repository/recipes_repository.dart';
import 'package:nosh_assignment/app/data/value/strings.dart';
import 'package:nosh_assignment/base/base_controller.dart';
import 'package:nosh_assignment/utils/app_utils.dart';

class RecipeController extends BaseController<RecipesRepository> {

  TextEditingController searchTextController = TextEditingController();
  RxList<DishModel> dishList = RxList();
  RxBool isLoading = RxBool(false);


  @override
  void onInit() async {
    await getRecipesList();
    super.onInit();
  }

  Future<void> getRecipesList() async {
    try {
      isLoading.value = true;
      RepoResponse response = await repository.getDishList();
      if (response.data != null) {
        isLoading.value = false;
        var dishes = response.data as List;
        if (dishes.isNotEmpty) {
          for (var dish in dishes) {
            dishList.add(dish);
          }
        }
      } else {
        isLoading.value = false;
        AppUtils.showToast(
            msg: response.error?.message ?? ErrorMessages.networkGeneral);
      }
    } catch (e) {
      isLoading.value = false;
      log(e.toString());
    }
  }
}
