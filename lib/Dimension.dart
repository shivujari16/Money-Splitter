import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDimension {
  static double screenHeight = Get.context!.height;
  static double screenWidth = Get.context!.width;

  static double height40 = screenHeight / 16;
  static double height20 = screenHeight / 32;
  static double height15 = screenHeight / 42.66;
  static double height10 = screenHeight / 64;
  static double height35 = screenHeight / 18.28;

  static double width10 = screenWidth / 36;
  static double width20 = screenWidth / 18;
  static double width40 = screenWidth / 9;
  static double width15 = screenWidth / 24;
  static double width25 = screenWidth / 14.4;
  static double width200 = screenWidth / 1.8;
  static double width90 = screenWidth / 4.0;
  static double width110 = screenWidth / 3.27;
  static double width30 = screenWidth/12;

  static double icon20 = screenHeight/32;

  static double font22 = screenHeight / 29.09;
  static double font18 = screenHeight / 35.55;
}
