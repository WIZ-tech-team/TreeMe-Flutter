import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:treeme/core/resources/assets_manager.dart';
import 'package:treeme/core/resources/color_manager.dart';
import 'package:treeme/core/resources/font_manager.dart';
import 'package:treeme/core/resources/strings_manager.dart';
import 'package:treeme/core/resources/styles_manager.dart';
import 'package:treeme/core/resources/values_manager.dart';
import 'package:treeme/core/routes/app_routes.dart';
import 'package:treeme/core/widgets/custom_textField_with_label.dart';

import '../../../../core/widgets/custom_elevated_button_widget.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: AppSize.s400.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: ColorManager().gradientFloating,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.elliptical(125, 35),
                    bottomLeft: Radius.elliptical(125, 35),
                  ),
                ),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(ImageAssets.intersectCorner),
                    ),
                    // BackgroundArcs(Colors.white),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(ImageAssets.calenderLarge),
                          SizedBox(
                            height: AppSize.s16.h,
                          ),
                          Text(
                            AppStrings.createNewEvent,
                            style: getBoldStyle(
                                color: ColorManager.chatBackGround,
                                fontSize: FontSize.s20.sp),
                          ),
                          SizedBox(
                            height: AppSize.s13.h,
                          ),
                          RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: [
                                TextSpan(
                                    text:
                                        'Let Us Help You Create Unforgettable\n Surprises. ',
                                    style: getMediumStyle(
                                        color: ColorManager.chatBackGround,
                                        fontSize: FontSize.s14.sp),
                                    children: [
                                      WidgetSpan(
                                          child: Lottie.network(
                                              'https://fonts.gstatic.com/s/e/notoemoji/latest/1f609/lottie.json',
                                              height: AppSize.s20.h,
                                              width: AppSize.s20.w))
                                    ])
                              ])),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            toolbarHeight: 50.h,
            actions: [
              Container(
                // height: AppSize.s20.h,
                margin: EdgeInsets.only(right: AppSize.s24.w),
                width: 50.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s12.r),
                    // color: ColorManager.white,
                    border: Border.all(
                        color: ColorManager.white.withOpacity(0.29),
                        width: AppSize.s1.w),
                    gradient: LinearGradient(
                        colors: [
                          ColorManager.white.withOpacity(0.13),
                          ColorManager.white.withOpacity(0.51),
                        ],
                        tileMode: TileMode.decal,
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft),
                    boxShadow: [
                      BoxShadow(
                          color: ColorManager.black.withOpacity(0.03),
                          offset: Offset(0, 7),
                          blurRadius: 10)
                    ]),
                child: Icon(Icons.notifications_none),
              )
            ],
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                margin: EdgeInsets.only(left: AppSize.s24.w),
                width: 50.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSize.s12.r),
                    border: Border.all(
                        color: ColorManager.white.withOpacity(0.29),
                        width: AppSize.s1.w),
                    // color: Colors.transparent,
                    gradient: LinearGradient(
                        colors: [
                          ColorManager.white.withOpacity(0.13),
                          ColorManager.white.withOpacity(0.51),
                        ],
                        tileMode: TileMode.decal,
                        begin: Alignment.bottomRight,
                        end: Alignment.topLeft),
                    boxShadow: [
                      BoxShadow(
                          color: ColorManager.black.withOpacity(0.03),
                          offset: Offset(0, 7),
                          blurRadius: 10)
                    ]),
                child: Icon(Icons.arrow_back),
              ),
            ),
            leadingWidth: 75.w,
          ),
          SliverToBoxAdapter(
            // hasScrollBody: true,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.s30.w, vertical: AppSize.s33.h),
              child: Column(
                children: [
                  CustomTextFieldWithLabel(
                    label: 'Event Title',
                    hint: 'Event Title',
                  ),
                  SizedBox(
                    height: AppSize.s15.h,
                  ),
                  ElevatedButton(
                    // decoration: BoxDecoration(
                    //   color: ColorManager.white,
                    //
                    // ),
                    onPressed: () {
                      Get.bottomSheet(Container(
                        height: 360.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSize.s30.w, vertical: AppSize.s15.h),
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.elliptical(125, 35),
                            topRight: Radius.elliptical(125, 35),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              child: CupertinoDatePicker(
                                onDateTimeChanged: (value) {
                                  print(value);
                                },
                                mode: CupertinoDatePickerMode.time,
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            SizedBox(
                              height: AppSize.s15.h,
                            ),
                            CustomElevatedButton(
                                title: 'DONE',
                                onPressed: () {
                                  Get.back();
                                }),
                          ],
                        ),
                      ));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(ColorManager.white),
                      // side: MaterialStateProperty.all(BorderSide())
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s20.r),
                      )),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(AppSize.s8.h),
                      // onTap: () {},

                      leading: SvgPicture.asset(ImageAssets.dateTimeIcon),
                      minLeadingWidth: AppSize.s50.w,
                      title: Text(
                        'Event Time',
                        style: getBoldStyle(
                            color: ColorManager.goodMorning,
                            fontSize: FontSize.s16.sp),
                      ),
                      subtitle: Text(
                        'Pick The Time Please',
                        style: getLightStyle(
                            color: ColorManager.subTitleCreateEvent,
                            fontSize: FontSize.s14.sp),
                      ),

                      trailing: Icon(
                        Icons.arrow_forward,
                        color: ColorManager.goodMorning,
                        size: AppSize.s25.w,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s15.h,
                  ),
                  ElevatedButton(
                    // decoration: BoxDecoration(
                    //   color: ColorManager.white,
                    //
                    // ),
                    onPressed: () {
                      Get.bottomSheet(Container(
                        // height: 487.h,
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSize.s30.w, vertical: AppSize.s15.h),
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.elliptical(125, 35),
                            topRight: Radius.elliptical(125, 35),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SfDateRangePicker(
                              view: DateRangePickerView.month,
                              monthViewSettings:
                                  DateRangePickerMonthViewSettings(
                                      viewHeaderStyle:
                                          DateRangePickerViewHeaderStyle(
                                        textStyle: getBoldStyle(
                                            color: ColorManager.goodMorning,
                                            fontSize: FontSize.s16.sp),
                                      ),
                                      dayFormat: 'EE',
                                      showTrailingAndLeadingDates: true),
                              allowViewNavigation: true,
                              headerStyle: DateRangePickerHeaderStyle(
                                textAlign: TextAlign.center,
                                textStyle: getBoldStyle(
                                    color: ColorManager.goodMorning,
                                    fontSize: FontSize.s16.sp),
                              ),
                              viewSpacing: 50,
                              monthCellStyle: DateRangePickerMonthCellStyle(
                                textStyle: getRegularStyle(
                                    color: ColorManager.goodMorning,
                                    fontSize: FontSize.s16.sp),
                              ),
                              headerHeight: 60,
                              monthFormat: 'MMMM',
                              showNavigationArrow: true,
                            ),
                            SizedBox(
                              height: AppSize.s15.h,
                            ),
                            CustomElevatedButton(
                                title: 'SELECT',
                                onPressed: () {
                                  Get.back();
                                }),
                          ],
                        ),
                      ));
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(ColorManager.white),
                      // side: MaterialStateProperty.all(BorderSide())
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s20.r),
                      )),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: ListTile(
                      contentPadding: EdgeInsets.all(AppSize.s8.h),
                      // onTap: () {},

                      leading: SvgPicture.asset(ImageAssets.dateDateIcon),
                      minLeadingWidth: AppSize.s50.w,
                      title: Text(
                        'Event Date',
                        style: getBoldStyle(
                            color: ColorManager.goodMorning,
                            fontSize: FontSize.s16.sp),
                      ),
                      subtitle: Text(
                        'Pick The Date Please',
                        style: getLightStyle(
                            color: ColorManager.subTitleCreateEvent,
                            fontSize: FontSize.s14.sp),
                      ),

                      trailing: Icon(
                        Icons.arrow_forward,
                        color: ColorManager.goodMorning,
                        size: AppSize.s25.w,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s30.h,
                  ),
                  CustomElevatedButton(
                      title: 'NEXT',
                      onPressed: () {
                        Get.toNamed(AppRoutes.typeWithTheme);
                      }),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
