import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:treeme/core/resources/assets_manager.dart';
import 'package:treeme/core/resources/color_manager.dart';
import 'package:treeme/core/resources/font_manager.dart';
import 'package:treeme/core/resources/styles_manager.dart';
import 'package:treeme/core/resources/values_manager.dart';
import 'package:treeme/core/widgets/custom_elevated_button_widget.dart';

import '../manager/create_event_controller.dart';

class SelectContactsScreen extends StatelessWidget {
  const SelectContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.chatBackGround,
      body: GetBuilder<CreateEventController>(
        builder: (logic) {
          return Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  clipBehavior: Clip.none,
                  slivers: [
                    SliverAppBar(
                        expandedHeight: AppSize.s130.h,
                        backgroundColor: ColorManager.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(AppSize.s36.r),
                              bottomRight: Radius.circular(AppSize.s36.r)),
                        ),
                        elevation: 4,
                        // toolbarHeight: 40.h,
                        actions: [
                          Container(
                              // height: AppSize.s20.h,
                              margin: EdgeInsets.only(right: AppSize.s24.w),
                              width: 50.w,
                              padding: EdgeInsets.all(AppSize.s15.h),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(AppSize.s12.r),
                                  // color: ColorManager.white,
                                  // border: Border.all(
                                  //     color: ColorManager.white.withOpacity(0.29),
                                  //     width: AppSize.s1.w),
                                  gradient: LinearGradient(
                                      colors: [
                                        ColorManager.white.withOpacity(0.11),
                                        ColorManager.white,
                                      ],
                                      tileMode: TileMode.decal,
                                      begin: Alignment.bottomRight,
                                      end: Alignment.topLeft),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color(0xff16434D).withAlpha(10),
                                        offset: Offset(0, 3),
                                        blurRadius: 13)
                                  ]),
                              child: SvgPicture.asset(
                                ImageAssets.notificationIcon,
                                height: 17.h,
                                width: 16.w,
                                fit: BoxFit.cover,
                              ))
                        ],
                        centerTitle: true,
                        flexibleSpace: Center(
                          child: Text(
                            'Select your\n Contacts',
                            style: getBoldStyle(
                                color: ColorManager.goodMorning,
                                fontSize: FontSize.s16.sp),
                          ),
                        ),
                        leading: GestureDetector(
                          onTap: (){
                            Get.back();
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: AppSize.s12.w),
                            // width: 50.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppSize.s12.r),
                                border: Border.all(
                                    color: ColorManager.white.withOpacity(0.29),
                                    width: AppSize.s1.w),
                                // color: Colors.transparent,
                                gradient: LinearGradient(
                                    colors: [
                                      ColorManager.white.withOpacity(0.51),
                                      ColorManager.white.withOpacity(0.13),
                                    ],
                                    stops: [
                                      0.3,
                                      2
                                    ],
                                    tileMode: TileMode.decal,
                                    begin: Alignment.bottomRight,
                                    end: Alignment.topLeft),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color(0x1A21407C),
                                      offset: Offset(0, 3),
                                      blurRadius: 10)
                                ]),
                            child: Icon(
                              Icons.arrow_back,
                              color: ColorManager.goodMorning,
                            ),
                          ),
                        ),
                        leadingWidth: 75.w,
                        pinned: false,snap: true,floating: true),
                    SliverFillRemaining(
                      hasScrollBody: true,
                       // fillOverscroll: true,
                      child: ListView.builder(
                        itemCount: 12,
                        clipBehavior: Clip.none,
                        physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: AppSize.s30.w, vertical: AppSize.s5.h),
                            child: ListTile(
                              tileColor: ColorManager.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(AppSize.s10.r)),
                              leading: CircleAvatar(
                                radius: AppSize.s28,
                              ),

                              contentPadding: EdgeInsets.only(
                                  left: 12, top: 18, bottom: 12, right: 16),
                              horizontalTitleGap: 8,
                              title: Text(
                                'Mohammed Ali',
                                style: getBoldStyle(
                                    color: ColorManager.goodMorning,
                                    fontSize: FontSize.s16.sp),
                              ),
                              trailing: Checkbox(
                                checkColor: Colors.white,
                                overlayColor:
                                    MaterialStateProperty.all(Color(0xffD9D9D9)),
                                value: logic.isChecked.value,
                                activeColor: Color(0xffFB84A7),
                                shape: CircleBorder(),
                                onChanged: (bool? value) {
                                  logic.isCheck();
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),


                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: AppSize.s30.w,vertical: AppSize.s30.h),
                child: CustomElevatedButton(title: 'NEXT',),
              )
            ],
          );
        },
      ),
    );
  }
}
