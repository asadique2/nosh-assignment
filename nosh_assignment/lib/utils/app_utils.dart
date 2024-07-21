import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:nosh_assignment/app/data/value/images.dart';
import 'package:nosh_assignment/app/theme/app_color.dart';

class AppUtils {
  AppUtils._privateConstructor();

  static Future<bool?> showToast({required String msg}) {
    return Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: AppColors.white,
        textColor: AppColors.black,
        fontSize: 16.0);
  }



  static imageHandler(String url,
      {double height = 60,
        double width = 60,
        double borderRadius = 10,
        BorderRadiusGeometry? border ,
        BoxFit? fit}) {
    return url.isNotEmpty ? ClipRRect(
      borderRadius: border ?? BorderRadius.circular(borderRadius),
      child: CachedNetworkImage(
        imageUrl:url,
        fit: fit ?? BoxFit.cover,
        progressIndicatorBuilder: (context, url, progress) => Center(
          child: CircularProgressIndicator(
            value: progress.progress,
          ),
        ),
        errorWidget: (ctx, obj, _) => Image.asset(
          AppImages.noImageFound,
          height: height,
          width: width,
          fit: fit ?? BoxFit.cover,
        ),
      ),
    ) : Image.asset(AppImages.noImageFound);
  }




}
