import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';

class CustomTextFieldWithLabel extends StatelessWidget {
  const CustomTextFieldWithLabel({
    super.key,
    required this.label,
    required this.hint,
    this.suffix, this.labelStyle
  });
  final String label;
  final String hint;
  final Widget? suffix;
final TextStyle? labelStyle ;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style:labelStyle?? getRegularStyle(
              color: ColorManager.black, fontSize: FontSize.s14.sp),
        ),
        SizedBox(
          height: AppSize.s8.h,
        ),
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppSize.s10.r)),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(
                    left: AppSize.s16.w,
                    top: AppSize.s18.h,
                    right: AppSize.s12.w,
                    bottom: AppSize.s18.h),
                fillColor: ColorManager.white,
                hintStyle: getRegularStyle(
                    color: ColorManager.hintColor, fontSize: FontSize.s16.sp),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                // suffix: suffix,
                suffixIcon: suffix,
                hintText: hint),
          ),
        ),
      ],
    );
  }
}
