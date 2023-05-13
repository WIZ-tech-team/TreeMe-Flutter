

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:treeme/core/resources/assets_manager.dart';
import 'package:treeme/core/resources/color_manager.dart';

import '../../domain/entities/event_type_model.dart';

class CreateEventController extends GetxController{
  RxList<EventTypeModel> eventTypeModel = <EventTypeModel>[
    EventTypeModel('birthday'.toUpperCase(), ImageAssets.brithdayTheme , ColorManager().gradientFloating),
    EventTypeModel('New Baby'.toUpperCase(), ImageAssets.newBabyTheme , LinearGradient(colors: [
Color(0xffFEB246),
      Color(0xffFBD4A4)
    ],
      tileMode: TileMode.decal,
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
    )),
    EventTypeModel('graduation'.toUpperCase(), ImageAssets.graduationTheme ,LinearGradient(colors: [
      Color(0xff8271F2),
      Color(0xffA99EFF)
    ],
        tileMode: TileMode.decal,
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
    )),
    EventTypeModel('wedding'.toUpperCase(), ImageAssets.weddingTheme , LinearGradient(colors: [
      Color(0xffEA4477),
      Color(0xffFB84A7)
    ],
        tileMode: TileMode.decal,
        begin: Alignment.bottomRight,
        end: Alignment.topLeft,
    )),
  ].obs;
  RxBool isChecked = false.obs;

  void isCheck(){
    isChecked.toggle();
    update();
  }


}

