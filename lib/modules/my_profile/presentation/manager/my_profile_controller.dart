import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:treeme/core/resources/assets_manager.dart';
import 'package:treeme/core/resources/color_manager.dart';
import 'package:treeme/modules/my_profile/domain/entities/my_profile_model.dart';

import '../widgets/custom_switch_widget.dart';

class MyProfileController extends GetxController {
  RxBool notificationSwitch = true.obs;
  RxList<MyProfileModel> listProfile = <MyProfileModel>[].obs;

  @override
  void onInit() {
    listProfile = [
      MyProfileModel(
    SvgPicture.asset( ImageAssets.editProfile, width: 40.w,
    height: 42.h,
    fit: BoxFit.cover,), 'Edit Profile', Icon(Icons.arrow_forward,color: ColorManager.goodMorning,)),
      MyProfileModel(
          SvgPicture.asset( ImageAssets.settingsProfile, width: 40.w,
            height: 42.h,
            fit: BoxFit.cover,), 'Settings', Icon(Icons.arrow_forward,color: ColorManager.goodMorning,)),
      MyProfileModel(  SvgPicture.asset(ImageAssets.notificationProfile, width: 40.w,
        height: 42.h,
        fit: BoxFit.cover,), 'Notifications',
          switchNotification()),
      MyProfileModel(
          SvgPicture.asset( ImageAssets.logoutProfile, width: 40.w,
            height: 42.h,
            fit: BoxFit.cover,), 'Logout', null),

      MyProfileModel(
          null, 'Delete Account', null),
    ].obs;
  }


  Widget switchNotification() {
    return Obx(() {
      return CustomSwitch(
        onChanged: (bool value) {
          notificationSwitch.toggle();
          // value = notificationSwitch.value;
          print(notificationSwitch);
        },
        value: notificationSwitch.value,
      );
    });
  }
}