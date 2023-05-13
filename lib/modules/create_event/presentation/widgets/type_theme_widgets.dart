import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:treeme/core/routes/app_routes.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../../../../core/resources/values_manager.dart';
import '../../domain/entities/event_type_model.dart';
class TypeThemeWidgets extends StatelessWidget {

  final EventTypeModel eventTypeModel;
  const TypeThemeWidgets({
    super.key, required this.eventTypeModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.toNamed(AppRoutes.selectContactScreen);
      },
      child: Container(
       height: AppSize.s120.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
                AppSize.s27.r),
            gradient: eventTypeModel.gradient
        ),
        margin: EdgeInsets.symmetric(
            horizontal: AppSize.s12.w,vertical: AppSize.s8.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: AppSize.s30.h,
                    left: AppSize.s30.w,
                    bottom: AppSize.s14.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment
                      .start,
                  children: [
                    Text(eventTypeModel.typeEvent,
                      style: getBoldStyle(
                          color: ColorManager.white,
                          fontSize: FontSize.s20.sp),

                    ),
                    RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(children: [
                          TextSpan(
                              text: 'Let Us Help You Create\n Unforgettable Surprises. ',

                              style: getMediumStyle(
                                  color: ColorManager
                                      .chatBackGround,
                                  fontSize: FontSize.s12.sp),
                              children: [
                                WidgetSpan(
                                    child: Lottie.network(
                                        'https://fonts.gstatic.com/s/e/notoemoji/latest/1f609/lottie.json',
                                        height: AppSize.s15.h,
                                        width: AppSize.s15.w))
                              ])
                        ])),
                  ],
                ),
              ),
            ),

            Image.asset(eventTypeModel.imagePath)
          ],
        ),
      ),
    );
  }
}
