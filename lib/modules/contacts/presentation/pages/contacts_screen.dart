import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:treeme/core/resources/assets_manager.dart';
import 'package:treeme/core/resources/color_manager.dart';
import 'package:treeme/core/resources/font_manager.dart';
import 'package:treeme/core/resources/styles_manager.dart';
import 'package:treeme/core/resources/values_manager.dart';
import 'package:treeme/core/routes/app_routes.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
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
                  title: Text(
                    'My Contacts',
                    style: getBoldStyle(
                        color: ColorManager.goodMorning,
                        fontSize: FontSize.s16.sp),
                  ),
                  flexibleSpace: Container(
                    height: 56.h,
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(left:AppSize.s30.w,right: AppSize.s30.w ,top: AppSize.s100.h,bottom: AppSize.s20.h),
                    decoration: BoxDecoration(
                        color: ColorManager.chatBackGround,
                        borderRadius: BorderRadius.circular(AppSize.s10.r)),
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: AppSize.s16.w,
                              top: AppSize.s20.h,
                              right: AppSize.s12.w,
                              bottom: AppSize.s10.h),
                          fillColor: ColorManager.chatBackGround,
                          hintStyle: getRegularStyle(
                              color: ColorManager.hintColor, fontSize: FontSize.s16.sp),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          // suffix: suffix,
                           prefixIcon: Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: SvgPicture.asset(
                               ImageAssets.iconSearch,
                               height: AppSize.s16.h,
                               color: ColorManager.subTitleCreateEvent,
                               width: AppSize.s16.w,
                             ),
                           ),
                          hintText: 'Search here'),
                    ),
                  ),
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
                        onTap: (){
                          Get.toNamed(AppRoutes.profile);
                        },
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

                      ),
                    );
                  },
                ),
              ),


            ],
          ),
        ),

      ],
    );
  }
}
