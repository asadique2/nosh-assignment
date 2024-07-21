import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Dimens {

  //Screen height and width
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  Dimens._privateConstructor();

  //padding
  static final paddingX4 = factorOf(value: 4);
  static final paddingX8 = factorOf(value: 8);
  static final paddingX12 = factorOf(value: 12);
  static final paddingX16 = factorOf(value: 16);
  static final paddingX18 = factorOf(value: 18);
  static final paddingX20 = factorOf(value: 20);
  static final paddingX32 = factorOf(value: 32);



  //dividers
  static final gapX0_5 =  factorOf(value: 5.0);
  static final gapX1 =  factorOf(value: 10.0);
  static final gapX2 =  factorOf(value: 20.0);
  static final gapX3 =  factorOf(value: 30.0);
  static final gapX4 =  factorOf(value: 40.0);
  static final gapX5 =  factorOf(value: 50.0);


  static   const heightGap5 =  SizedBox(height: 5);
  static   const heightGap10 =  SizedBox(height: 10);
  static   const heightGap20 =  SizedBox(height: 20);
  static   const heightGap30 =  SizedBox(height: 30);
  static   const heightGap40 =  SizedBox(height: 40);
  static   const heightGap50 =  SizedBox(height: 50);

  static const widthGap5 = SizedBox(width: 5);
  static const widthGap10 = SizedBox(width: 10);
  static const widthGap20 = SizedBox(width: 20);
  static const widthGap30 = SizedBox(width: 30);
  static const widthGap40 = SizedBox(width: 40);
  static const widthGap50 = SizedBox(width: 50);


  static double factorOf({required double value}){
    double factor = screenHeight/value ;
    return Dimens.screenHeight/factor;
  }
}
