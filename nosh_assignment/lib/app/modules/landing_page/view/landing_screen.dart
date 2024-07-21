import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nosh_assignment/app/data/value/dimens.dart';
import 'package:nosh_assignment/app/data/value/strings.dart';
import 'package:nosh_assignment/app/modules/landing_page/controller/landing_controller.dart';
import 'package:nosh_assignment/app/theme/app_color.dart';

import '../../../../widgets/common_text/common_text.dart';

class LandingScreen extends GetView<LandingController> {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => PopScope(
        canPop: controller.canExitTheApp.value,
        onPopInvoked: (v) => controller.canCloseTheApp(v),
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: ValueListenableBuilder<bool>(
            valueListenable: controller.isLoading,
            builder: (context, isLoading, child) {
              return isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : _body(controller);
            },
          ),
          bottomNavigationBar: Obx(
            () {
              int activeBtnIdx = controller.currentNavigationItemIdx.value;
              return BottomAppBar(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimens.paddingX8, vertical: Dimens.paddingX4),
                shape: const CircularNotchedRectangle(),
                height: 56,
                color: AppColors.white,
                surfaceTintColor: AppColors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    button(
                      name: AppStrings.recipes,
                      isActive: activeBtnIdx == 0,
                      onTap: () => controller.updateNavIdx(0),
                      icons: Icons.restaurant_menu,
                    ),
                    button(
                      name: AppStrings.list,
                      isActive: activeBtnIdx == 1,
                      onTap: () {
                        controller.updateNavIdx(1);
                      },
                      icons: Icons.list_alt,
                    ),
                    button(
                      name: AppStrings.nosh,
                      isActive: activeBtnIdx == 2,
                      onTap: () => controller.updateNavIdx(2),
                      icons: Icons.home_outlined,
                    ),
                    button(
                        name: AppStrings.mealPlan,
                        isActive: activeBtnIdx == 3,
                        onTap: () => controller.updateNavIdx(3),
                        icons: Icons.calendar_today_rounded),
                    button(
                        name: AppStrings.profile,
                        isActive: activeBtnIdx == 4,
                        onTap: () => controller.updateNavIdx(4),
                        icons: Icons.person),
                  ],
                ).paddingSymmetric(horizontal: Dimens.paddingX16),
              );
            },
          ),
        ),
      ),
    );
  }

  _body(LandingController controller) {
    return Obx(
      () => controller.bodyWidgetMap.values
          .elementAt(controller.currentNavigationItemIdx.value),
    );
  }

  Widget button(
      {required bool isActive,
      required Function() onTap,
      required IconData icons,
      required String name}) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icons,
              color: isActive ? AppColors.baseColor : AppColors.grey,
            ),
            caption(
                text: name,
                textColor: isActive ? AppColors.baseColor : AppColors.grey)
          ],
        ),
      ),
    );
  }
}
