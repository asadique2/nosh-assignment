import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:nosh_assignment/app/data/model/response/DishModel.dart';
import 'package:nosh_assignment/app/data/value/dimens.dart';
import 'package:nosh_assignment/app/data/value/strings.dart';
import 'package:nosh_assignment/app/modules/recipes/controllers/recipes_controller.dart';
import 'package:nosh_assignment/app/theme/app_color.dart';
import 'package:nosh_assignment/utils/app_utils.dart';
import 'package:nosh_assignment/widgets/common_text/common_text.dart';
import 'package:nosh_assignment/widgets/custom_text_field.dart';



class RecipeScreen extends GetView<RecipeController> {
  const RecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : controller.dishList.isNotEmpty
                ? _body(controller)
                : const Center(
                    child: Text(AppStrings.dataNotFound),
                  ),
      ),
    );
  }

  Widget _body(RecipeController controller) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          surfaceTintColor: AppColors.baseColor,
          title: const Text(AppStrings.recipes),
          actions: [
            const Icon(Icons.favorite_border)
                .paddingOnly(right: Dimens.paddingX16)
          ],
        ),
        SliverToBoxAdapter(
          child: Stack(
            children: [
              controller.dishList.isNotEmpty
                  ? AppUtils.imageHandler(
                      controller.dishList.first.imageUrl ?? "",
                      borderRadius: 0)
                  : null,
              CustomTextField(
                      prefixWidget: const Icon(
                        Icons.search,
                        size: 24,
                      ),
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: Dimens.paddingX4,
                          vertical: Dimens.paddingX8),
                      controller: controller.searchTextController)
                  .paddingSymmetric(
                      horizontal: Dimens.paddingX20, vertical: Dimens.gapX3),
              Positioned(
                  bottom: 30,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      heading(
                          text: AppStrings.dishOfTheDay,
                          textColor: AppColors.white),
                      title(
                          text: controller.dishList.first.dishName ?? '',
                          textColor: AppColors.white)
                    ],
                  ))
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: Dimens.heightGap30,
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.paddingX16),
          sliver: SliverToBoxAdapter(
            child: subHeading(text: AppStrings.discoverRegionalDelights),
          ),
        ),
        const SliverToBoxAdapter(
          child: Dimens.heightGap10,
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: Dimens.paddingX8),
          sliver: SliverToBoxAdapter(
            child: SizedBox(
              height: 310, // Height of the horizontal list
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.dishList.length,
                itemBuilder: (context, index) =>
                    dishWidget(controller.dishList[index])
                        .paddingOnly(left: 16),
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Dimens.heightGap30,
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: Dimens.paddingX16),
          sliver: SliverToBoxAdapter(
            child: Container(
              color: AppColors.black,
              padding: EdgeInsets.symmetric(vertical: Dimens.paddingX20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Dimens.heightGap10,
                  subHeading(
                          text: AppStrings.breakfastForChampions,
                          textColor: AppColors.white)
                      .paddingOnly(left: 16),
                  Dimens.heightGap30,
                  SizedBox(
                    height: 310, // Height of the horizontal list
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.dishList.length,
                      itemBuilder: (context, index) =>
                          dishWidget(controller.dishList[index])
                              .paddingOnly(left: 16),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget dishWidget(DishModel dish) {
    return Container(
      height: 310,
      width: 230,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0,
              spreadRadius: 1,
              offset: Offset(1, 2)),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 200,
            width: 230,
            child: AppUtils.imageHandler(dish.imageUrl ?? " tdy guy",
                border: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
          ),
          Dimens.heightGap10,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                label(text: dish.dishName ?? 'Na', maxLine: 2),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    textIconWidget(icon: Icons.access_time, name: '20 minutes'),
                    textIconWidget(
                        icon: Icons.circle,
                        name: 'Vegetarian',
                        color: Colors.green),
                  ],
                ),
                Dimens.heightGap5,
                ratingWidget(),
                Dimens.heightGap10,
              ],
            ).paddingSymmetric(horizontal: Dimens.paddingX16),
          )
        ],
      ),
    ).paddingAll(Dimens.paddingX4);
  }

  Widget textIconWidget(
      {required IconData icon, Color? color, required String name}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color ?? AppColors.black),
        Dimens.widthGap5,
        caption(text: name)
      ],
    );
  }

  Widget ratingWidget() {
    return RatingBar.builder(
      initialRating: 3.5,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      ignoreGestures: true,
      itemCount: 5,
      itemSize: 14,
      itemPadding: const EdgeInsets.symmetric(horizontal: 0),
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.grey,
      ),
      onRatingUpdate: (rating) {},
    );
  }
}
