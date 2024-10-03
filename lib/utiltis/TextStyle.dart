import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Colors.dart';

Widget Heddingone (
    {
      required String text,
      Color? TextColor,
      FontWeight? fontWeight,
      double? fontSize

    }
    ){
  return Text(
    text,
    style: TextStyle(
        color: TextColor?? AppColors.White,
        fontWeight: fontWeight?? FontWeight.w600,
        fontSize: fontSize ?? 30.sp),
  );

}

Widget Heddingtwo (
    {
      required String text,
      Color? TextColor,
      FontWeight? fontWeight

    }
    ){
  return Text(
    text,
    style: TextStyle(
        color: TextColor?? AppColors.White,
        fontWeight: fontWeight?? FontWeight.w600,
        fontSize: 25.sp),
  );

}

Widget HeddingThree (
    {
      required String text,
      Color? TextColor,
      FontWeight? fontWeight

    }
    ){
  return Text(
    text,
    style: TextStyle(
        color: TextColor?? AppColors.White,
        fontWeight: fontWeight?? FontWeight.w600,
        fontSize: 16.sp),
  );

}

Widget HeddingFour (
    {
      required String text,
      Color? TextColor,
      FontWeight? fontWeight

    }
    ){
  return Text(
    text,
    style: TextStyle(
        color: TextColor?? AppColors.White,
        fontWeight: fontWeight?? FontWeight.w600,
        fontSize: 14.sp),
  );

}