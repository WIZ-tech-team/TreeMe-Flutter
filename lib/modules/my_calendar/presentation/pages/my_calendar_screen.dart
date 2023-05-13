import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:treeme/core/resources/assets_manager.dart';
import 'package:treeme/core/resources/values_manager.dart';

import '../../../../core/resources/color_manager.dart';
import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/styles_manager.dart';
///TODO : My Calendar
class MyCalendarScreen extends StatelessWidget {
  const MyCalendarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CalendarController controller = CalendarController();

    return Scaffold(
      body: Stack(fit: StackFit.loose, clipBehavior: Clip.none, children: [
        Container(
          height: AppSize.s550.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Color(0xffFBD4A4), Color(0xffFEAA46)],
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                tileMode: TileMode.decal),
          ),
          alignment: Alignment.topRight,
          child: SvgPicture.asset(ImageAssets.intersectCorner),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            child: Column(
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  centerTitle: true,
                  title: Text(
                    'My Calendar',
                    style: getBoldStyle(
                        color: ColorManager.chatBackGround,
                        fontSize: FontSize.s16.sp),
                  ),
                  leading: Container(),
                  actions: [
                    Container(
                      // height: AppSize.s20.h,
                      margin: EdgeInsets.only(right: AppSize.s12.w),
                      // width: 40.w,
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.s15.w, vertical: AppSize.s11.h),
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
                      child: SvgPicture.asset(ImageAssets.notificationIcon,
                          color: ColorManager.white),
                    )
                  ],
                ),
                SfCalendar(
                  view: CalendarView.month,
                  firstDayOfWeek: 6,
                  controller: controller,
                selectionDecoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                  cellBorderColor: Colors.transparent,

                  monthViewSettings: MonthViewSettings(showAgenda: true,monthCellStyle: MonthCellStyle(
textStyle: getBoldStyle(color: ColorManager.chatBackGround,fontSize: FontSize.s16.sp)
                  )),
                  timeSlotViewSettings:
                      TimeSlotViewSettings(timelineAppointmentHeight: 52),
                  appointmentBuilder: (context, calendarAppointmentDetails) {
                    final Appointment appointment =
                        calendarAppointmentDetails.appointments.first;
                    return Column(
                      children: [
                        Container(
                            width: calendarAppointmentDetails.bounds.width,
                            height:
                                calendarAppointmentDetails.bounds.height / 2,
                            color: appointment.color,
                            child: Center(
                              child: Icon(
                                Icons.group,
                                color: Colors.black,
                              ),
                            )),
                        Container(
                          width: calendarAppointmentDetails.bounds.width,
                          height: calendarAppointmentDetails.bounds.height / 2,
                          color: appointment.color,
                          child: Text(
                            appointment.subject +
                                DateFormat(' (hh:mm a')
                                    .format(appointment.startTime) +
                                '-' +
                                DateFormat('hh:mm a)')
                                    .format(appointment.endTime),
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 10),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        )
      ]),
    );
  }
}
