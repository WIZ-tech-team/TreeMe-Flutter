// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:intl/intl.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:treeme/core/resources/assets_manager.dart';
// import 'package:treeme/core/resources/values_manager.dart';
//
// import '../../../../core/resources/color_manager.dart';
// import '../../../../core/resources/font_manager.dart';
// import '../../../../core/resources/styles_manager.dart';
// ///TODO : My Calendar
// class MyCalendarScreen extends StatelessWidget {
//   const MyCalendarScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final CalendarController controller = CalendarController();
//
//     return Scaffold(
//       body: Stack(fit: StackFit.loose, clipBehavior: Clip.none, children: [
//         Container(
//           height: AppSize.s550.h,
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//                 colors: [Color(0xffFBD4A4), Color(0xffFEAA46)],
//                 end: Alignment.topCenter,
//                 begin: Alignment.bottomCenter,
//                 tileMode: TileMode.decal),
//           ),
//           alignment: Alignment.topRight,
//           child: SvgPicture.asset(ImageAssets.intersectCorner),
//         ),
//         Align(
//           alignment: Alignment.topCenter,
//           child: Container(
//             child: Column(
//               children: [
//                 AppBar(
//                   backgroundColor: Colors.transparent,
//                   elevation: 0,
//                   centerTitle: true,
//                   title: Text(
//                     'My Calendar',
//                     style: getBoldStyle(
//                         color: ColorManager.chatBackGround,
//                         fontSize: FontSize.s16.sp),
//                   ),
//                   leading: Container(),
//                   actions: [
//                     Container(
//                       // height: AppSize.s20.h,
//                       margin: EdgeInsets.only(right: AppSize.s12.w),
//                       // width: 40.w,
//                       padding: EdgeInsets.symmetric(
//                           horizontal: AppSize.s15.w, vertical: AppSize.s11.h),
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(AppSize.s12.r),
//                           // color: ColorManager.white,
//                           border: Border.all(
//                               color: ColorManager.white.withOpacity(0.29),
//                               width: AppSize.s1.w),
//                           gradient: LinearGradient(
//                               colors: [
//                                 ColorManager.white.withOpacity(0.13),
//                                 ColorManager.white.withOpacity(0.51),
//                               ],
//                               tileMode: TileMode.decal,
//                               begin: Alignment.bottomRight,
//                               end: Alignment.topLeft),
//                           boxShadow: [
//                             BoxShadow(
//                                 color: ColorManager.black.withOpacity(0.03),
//                                 offset: Offset(0, 7),
//                                 blurRadius: 10)
//                           ]),
//                       child: SvgPicture.asset(ImageAssets.notificationIcon,
//                           color: ColorManager.white),
//                     )
//                   ],
//                 ),
//                 SfCalendar(
//                   view: CalendarView.month,
//                   firstDayOfWeek: 6,
//                   controller: controller,
//                 selectionDecoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: Colors.white,
//                 ),
//                   cellBorderColor: Colors.transparent,
//
//                   monthViewSettings: MonthViewSettings(showAgenda: true,monthCellStyle: MonthCellStyle(
// textStyle: getBoldStyle(color: ColorManager.chatBackGround,fontSize: FontSize.s16.sp)
//                   )),
//                   timeSlotViewSettings:
//                       TimeSlotViewSettings(timelineAppointmentHeight: 52),
//                   appointmentBuilder: (context, calendarAppointmentDetails) {
//                     final Appointment appointment =
//                         calendarAppointmentDetails.appointments.first;
//                     return Column(
//                       children: [
//                         Container(
//                             width: calendarAppointmentDetails.bounds.width,
//                             height:
//                                 calendarAppointmentDetails.bounds.height / 2,
//                             color: appointment.color,
//                             child: Center(
//                               child: Icon(
//                                 Icons.group,
//                                 color: Colors.black,
//                               ),
//                             )),
//                         Container(
//                           width: calendarAppointmentDetails.bounds.width,
//                           height: calendarAppointmentDetails.bounds.height / 2,
//                           color: appointment.color,
//                           child: Text(
//                             appointment.subject +
//                                 DateFormat(' (hh:mm a')
//                                     .format(appointment.startTime) +
//                                 '-' +
//                                 DateFormat('hh:mm a)')
//                                     .format(appointment.endTime),
//                             textAlign: TextAlign.center,
//                             style: TextStyle(fontSize: 10),
//                           ),
//                         )
//                       ],
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         )
//       ]),
//     );
//   }
// }
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:treeme/core/resources/resource.dart';

class MyCalendarScreen extends StatefulWidget {
  const MyCalendarScreen({Key? key}) : super(key: key);

  @override
  State<MyCalendarScreen> createState() => _MyCalendarScreenState();
}

class _MyCalendarScreenState extends State<MyCalendarScreen> {
  late _MeetingDataSource _events;
  final CalendarController _calendarController = CalendarController();

  @override
  void initState() {
    super.initState();
    _calendarController.selectedDate = DateTime.now();
    _events = _MeetingDataSource(_getAppointments());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Color(0xffFBD4A4), Color(0xffFEAA46)],
            end: Alignment.topCenter,
            begin: Alignment.bottomCenter,
            tileMode: TileMode.decal),
      ),
      alignment: Alignment.topRight,
      child: Stack(
        children: [
          Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(ImageAssets.intersectCorner)),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  'My Calendar',
                  style: getBoldStyle(
                      color: ColorManager.chatBackGround,
                      fontSize: FontSize.s16.sp),
                ),
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
                leading: SizedBox(),
              ),
            ),
          ),
          Positioned(
              top: AppSize.s100.h,
              bottom: 0,
              child: SfCalendar(
                view: CalendarView.month,
                backgroundColor: Colors.transparent,
                controller: _calendarController,
                showNavigationArrow: true,
                onViewChanged: _onViewChanged,
                dataSource: _events,
                cellBorderColor: Colors.transparent,
                todayHighlightColor: Colors.white,
                todayTextStyle: TextStyle(color: Color(0xffEA4477)),
                headerStyle: CalendarHeaderStyle(
                  textAlign: TextAlign.center,
                  textStyle: getBoldStyle(
                      color: ColorManager.white, fontSize: FontSize.s16.sp),
                ),
                headerDateFormat: 'MMMM',
                cellEndPadding: 5,

                monthViewSettings: MonthViewSettings(
                    dayFormat: 'EEE',
                    numberOfWeeksInView: 5,
                    appointmentDisplayCount: 2,
                    // appointmentDisplayCount: 2,
                    // agendaItemHeight: 400,
                    // DateRangePickerMonthViewSettings(
                    //     viewHeaderStyle:
                    //     DateRangePickerViewHeaderStyle(
                    //       textStyle: getBoldStyle(
                    //           color: ColorManager.goodMorning,
                    //           fontSize: FontSize.s16.sp),
                    //     ),
                    //     dayFormat: 'EE',
                    //     showTrailingAndLeadingDates: true)
                    appointmentDisplayMode:
                        MonthAppointmentDisplayMode.indicator,
                    monthCellStyle: MonthCellStyle(
                        textStyle: getBoldStyle(
                            color: ColorManager.chatBackGround,
                            fontSize: FontSize.s16.sp),
                        leadingDatesTextStyle: getBoldStyle(
                            color: ColorManager.chatBackGround.withOpacity(0.5),
                            fontSize: FontSize.s16.sp),
                        trailingDatesTextStyle: getBoldStyle(
                            color: ColorManager.chatBackGround.withOpacity(0.5),
                            fontSize: FontSize.s16.sp)),
                    showAgenda: true,
                    agendaStyle: AgendaStyle(),
                    agendaViewHeight: MediaQuery.of(context).size.height / 2,
                    // agendaStyle: AgendaStyle(),
                    navigationDirection: MonthNavigationDirection.horizontal),

                // selectionDecoration: BoxDecoration(color: Colors.white),
                // monthViewSettings:
                //     MonthViewSettings(showAgenda: true, numberOfWeeksInView: 5),
              )),
        ],
      ),
    );
  }

  void _onViewChanged(ViewChangedDetails visibleDatesChangedDetails) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      final DateTime currentViewDate = visibleDatesChangedDetails
          .visibleDates[visibleDatesChangedDetails.visibleDates.length ~/ 2];

      if (currentViewDate.month == DateTime.now().month &&
          currentViewDate.year == DateTime.now().year) {
        _calendarController.selectedDate = DateTime.now();
      } else {
        _calendarController.selectedDate =
            DateTime(currentViewDate.year, currentViewDate.month);
      }
    });
  }

  List<_Meeting> _getAppointments() {
    /// Creates the required appointment subject details as a list.
    final List<String> subjectCollection = <String>[];
    subjectCollection.add('General Meeting');
    subjectCollection.add('Plan Execution');
    subjectCollection.add('Project Plan');
    subjectCollection.add('Consulting');
    subjectCollection.add('Support');
    subjectCollection.add('Development Meeting');
    subjectCollection.add('Scrum');
    subjectCollection.add('Project Completion');
    subjectCollection.add('Release updates');
    subjectCollection.add('Performance Check');

    /// Creates the required appointment color details as a list.
    final List<Color> colorCollection = <Color>[];
    colorCollection.add(const Color(0xFF0F8644));
    colorCollection.add(const Color(0xFF8B1FA9));
    colorCollection.add(const Color(0xFFD20100));
    colorCollection.add(const Color(0xFFFC571D));
    colorCollection.add(const Color(0xFF36B37B));
    colorCollection.add(const Color(0xFF01A1EF));
    colorCollection.add(const Color(0xFF3D4FB5));
    colorCollection.add(const Color(0xFFE47C73));
    colorCollection.add(const Color(0xFF636363));
    colorCollection.add(const Color(0xFF0A8043));

    final List<_Meeting> meetings = <_Meeting>[];
    final Random random = Random();
    final DateTime rangeStartDate =
        DateTime.now().add(const Duration(days: -(365 ~/ 2)));
    final DateTime rangeEndDate = DateTime.now().add(const Duration(days: 365));
    for (DateTime i = rangeStartDate;
        i.isBefore(rangeEndDate);
        i = i.add(const Duration(days: 1))) {
      final DateTime date = i;
      final num count = 1 + random.nextInt(3);
      for (int j = 0; j < count; j++) {
        final DateTime startDate = DateTime(
            date.year, date.month, date.day, (8 + random.nextInt(8)).toInt());
        meetings.add(_Meeting(
            subjectCollection[random.nextInt(7)],
            '',
            '',
            null,
            startDate,
            startDate.add(Duration(hours: random.nextInt(3))),
            colorCollection[random.nextInt(9)],
            false,
            '',
            '',
            ''));
      }
    }

    // added recurrence appointment
    meetings.add(_Meeting(
        'Development status',
        '',
        '',
        null,
        DateTime.now(),
        DateTime.now().add(const Duration(hours: 2)),
        colorCollection[random.nextInt(9)],
        false,
        '',
        '',
        'FREQ=WEEKLY;BYDAY=FR;INTERVAL=1'));
    return meetings;
  }
}

class _MeetingDataSource extends CalendarDataSource {
  _MeetingDataSource(this.source);

  List<_Meeting> source;

  @override
  List<_Meeting> get appointments => source;

  @override
  DateTime getStartTime(int index) {
    return source[index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return source[index].to;
  }

  @override
  bool isAllDay(int index) {
    return source[index].isAllDay;
  }

  @override
  String getSubject(int index) {
    return source[index].eventName;
  }

  @override
  String? getStartTimeZone(int index) {
    return source[index].startTimeZone;
  }

  @override
  String? getEndTimeZone(int index) {
    return source[index].endTimeZone;
  }

  @override
  Color getColor(int index) {
    return source[index].background;
  }

  @override
  String? getRecurrenceRule(int index) {
    return source[index].recurrenceRule;
  }
}

/// Custom business object class which contains properties to hold the detailed
/// information about the event data which will be rendered in calendar.
class _Meeting {
  _Meeting(
      this.eventName,
      this.organizer,
      this.contactID,
      this.capacity,
      this.from,
      this.to,
      this.background,
      this.isAllDay,
      this.startTimeZone,
      this.endTimeZone,
      this.recurrenceRule);

  String eventName;
  String? organizer;
  String? contactID;
  int? capacity;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  String? startTimeZone;
  String? endTimeZone;
  String? recurrenceRule;
}
