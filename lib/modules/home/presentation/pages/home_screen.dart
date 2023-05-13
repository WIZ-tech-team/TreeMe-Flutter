import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:treeme/core/resources/assets_manager.dart';
import 'package:treeme/core/resources/color_manager.dart';
import 'package:treeme/core/resources/values_manager.dart';
import 'package:treeme/modules/home/presentation/manager/home_controller.dart';

import '../../../../core/resources/font_manager.dart';
import '../../../../core/resources/strings_manager.dart';
import '../../../../core/resources/styles_manager.dart';
import '../widgets/arc_widget.dart';
import '../widgets/event_widget.dart';
import 'dummy_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Stack(
    //     children: [
    //       Container(
    //         alignment: Alignment.topRight,
    //         child: CustomPaint(
    //           size: Size(400, 400),
    //           painter: EllipsePainter(),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
    List<CardBTH> list = [
      CardBTH('Ahmed', Color(0xff46D1F7),
          [Color(0xff46D1F7), Color(0xffBAECFB)], 'assets/images/darticon.png'),
      CardBTH('Ali', Color(0xffFEAA46), [Color(0xffFEAA46), Color(0xffFBD4A4)],
          'assets/images/cannon.png'),
      CardBTH(
          'Mohammed',
          Color(0xffEA4477),
          [Color(0xffEA4477), Color(0xffFB84A7)],
          'assets/images/cotton candy.png'),
    ];
    // return Scaffold(
    //   backgroundColor: ColorManager.white,
    //   // appBar: PreferredSize(
    //   //     preferredSize: Size(double.infinity, 65),
    //   //     child: SafeArea(
    //   //       child: Padding(
    //   //         padding: EdgeInsets.symmetric(
    //   //             horizontal: AppSize.s25.w, vertical: AppSize.s4.h),
    //   //         child: ListTile(
    //   //           leading: CircleAvatar(
    //   //             radius: 20,
    //   //           ),
    //   //           title: RichText(
    //   //               textAlign: TextAlign.start,
    //   //               text: TextSpan(children: [
    //   //                 TextSpan(
    //   //                     text: AppStrings.goodMorning,
    //   //                     style: getRegularStyle(
    //   //                         color: ColorManager.goodMorning,
    //   //                         fontSize: FontSize.s16.sp),
    //   //                     children: [
    //   //                       WidgetSpan(
    //   //                           child: Lottie.network(
    //   //                               'https://fonts.gstatic.com/s/e/notoemoji/latest/1f44b/lottie.json',
    //   //                               height: AppSize.s20.h,
    //   //                               width: AppSize.s20.w)),
    //   //                     ])
    //   //               ])),
    //   //           subtitle: Text('Hisham',
    //   //               style: getBoldStyle(
    //   //                   color: ColorManager.goodMorning,
    //   //                   fontSize: FontSize.s20.sp)),
    //   //           trailing: Container(
    //   //             height: AppSize.s40.h,
    //   //             width: AppSize.s40.w,
    //   //             decoration: BoxDecoration(
    //   //                 borderRadius: BorderRadius.circular(AppSize.s12.r),
    //   //                 color: ColorManager.white,
    //   //                 boxShadow: [
    //   //                   BoxShadow(
    //   //                       color: Color(0xFF16434D).withOpacity(0.1),
    //   //                       offset: Offset(0, 3),
    //   //                       blurRadius: 13)
    //   //                 ]),
    //   //             child: Icon(Icons.notifications_none),
    //   //           ),
    //   //         ),
    //   //       ),
    //   //     )),
    //   body: Column(
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Padding(
    //         padding: EdgeInsets.symmetric(
    //             horizontal: AppSize.s25.w, vertical: AppSize.s4.h),
    //         child: ListTile(
    //           leading: CircleAvatar(
    //             radius: 20,
    //           ),
    //           title: RichText(
    //               textAlign: TextAlign.start,
    //               text: TextSpan(children: [
    //                 TextSpan(
    //                     text: AppStrings.goodMorning,
    //                     style: getRegularStyle(
    //                         color: ColorManager.goodMorning,
    //                         fontSize: FontSize.s16.sp),
    //                     children: [
    //                       WidgetSpan(
    //                           child: Lottie.network(
    //                               'https://fonts.gstatic.com/s/e/notoemoji/latest/1f44b/lottie.json',
    //                               height: AppSize.s20.h,
    //                               width: AppSize.s20.w)),
    //                     ])
    //               ])),
    //           subtitle: Text('Hisham',
    //               style: getBoldStyle(
    //                   color: ColorManager.goodMorning,
    //                   fontSize: FontSize.s20.sp)),
    //           trailing: Container(
    //             height: AppSize.s40.h,
    //             width: AppSize.s40.w,
    //             decoration: BoxDecoration(
    //                 borderRadius: BorderRadius.circular(AppSize.s12.r),
    //                 color: ColorManager.white,
    //                 boxShadow: [
    //                   BoxShadow(
    //                       color: Color(0xFF16434D).withOpacity(0.1),
    //                       offset: Offset(0, 3),
    //                       blurRadius: 13)
    //                 ]),
    //             child: Icon(Icons.notifications_none),
    //           ),
    //         ),
    //       ),
    //       SizedBox(
    //         height: AppSize.s50.h,
    //       ),
    //       Expanded(
    //         child: ListView.builder(
    //             shrinkWrap: true,
    //             clipBehavior: Clip.none,
    //             itemCount: list.length,
    //             scrollDirection: Axis.horizontal,
    //             itemBuilder: (context, i) {
    //               return EventWidget(
    //                 cardBTH: list[i],
    //               );
    //             }),
    //       ),
    //       SizedBox(
    //         height: AppSize.s33.h,
    //       ),
    //       Expanded(
    //         flex: 4,
    //         child: Container(
    //           padding: EdgeInsets.only(
    //               left: AppSize.s30.w,
    //               right: AppSize.s30.w,
    //               top: AppSize.s36.h),
    //           decoration: BoxDecoration(
    //             color: ColorManager.chatBackGround,
    //             borderRadius: BorderRadius.vertical(
    //               top: Radius.elliptical(145, 35),
    //             ),
    //           ),
    //           child: Column(
    //             children: [
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Text(
    //                     'Chats',
    //                     style: getBoldStyle(
    //                         color: ColorManager.goodMorning,
    //                         fontSize: FontSize.s20.sp),
    //                   ),
    //                   Container(
    //                     height: AppSize.s40.h,
    //                     padding: EdgeInsets.all(AppSize.s12.h),
    //                     width: AppSize.s40.w,
    //                     decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(AppSize.s12.r),
    //                         color: ColorManager.white,
    //                         boxShadow: [
    //                           BoxShadow(
    //                               color: Color(0xFF16434D).withOpacity(0.1),
    //                               offset: Offset(0, 3),
    //                               blurRadius: 13)
    //                         ]),
    //                     child: SvgPicture.asset(
    //                       ImageAssets.iconSearch,
    //                       height: AppSize.s16.h,
    //                       width: AppSize.s16.w,
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //               SizedBox(
    //                 height: AppSize.s18.h,
    //               ),
    //               Expanded(
    //                 child: ListView.builder(
    //                   shrinkWrap: true,
    //                   clipBehavior: Clip.antiAliasWithSaveLayer,
    //                   itemCount: 20,
    //                   itemBuilder: (context, index) {
    //                     return Container(
    //                       margin: EdgeInsets.only(bottom: AppSize.s15.h),
    //                       decoration: BoxDecoration(
    //                           color: ColorManager.white,
    //                           borderRadius:
    //                               BorderRadius.circular(AppSize.s10.r)),
    //                       child: ListTile(
    //                         leading: CircleAvatar(
    //                           radius: AppSize.s28,
    //                         ),
    //                         contentPadding: EdgeInsets.only(
    //                             left: 12, top: 18, bottom: 12, right: 16),
    //                         horizontalTitleGap: 8,
    //                         title: Text(
    //                           'Mohammed Ali',
    //                           style: getBoldStyle(
    //                               color: ColorManager.goodMorning,
    //                               fontSize: FontSize.s16.sp),
    //                         ),
    //                         subtitle: Text(
    //                           'Let\'s Celebrate Now 🥳',
    //                           style: getBoldStyle(
    //                               color: Color(0xffC3C2C9),
    //                               fontSize: FontSize.s14.sp),
    //                         ),
    //                         trailing: Column(
    //                           mainAxisSize: MainAxisSize.max,
    //                           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //                           crossAxisAlignment: CrossAxisAlignment.end,
    //                           children: [
    //                             Text(
    //                               '9:30 Pm',
    //                               style: getBoldStyle(
    //                                   color: Color(0xffC3C2C9),
    //                                   fontSize: FontSize.s12.sp),
    //                             ),
    //                             Container(
    //                               height: AppSize.s16.h,
    //                               width: AppSize.s16.w,
    //                               alignment: Alignment.center,
    //                               decoration: BoxDecoration(
    //                                   shape: BoxShape.circle,
    //                                   gradient: LinearGradient(
    //                                       colors: [
    //                                         Color(0xffEA4477),
    //                                         Color(0xffFB84A7)
    //                                       ],
    //                                       tileMode: TileMode.clamp,
    //                                       begin: Alignment.bottomRight,
    //                                       stops: [0.0, 1.0],
    //                                       end: Alignment.topLeft)),
    //                               child: Text(
    //                                 '4',
    //                                 style: getBoldStyle(
    //                                     color: ColorManager.white,
    //                                     fontSize: FontSize.s12.sp),
    //                               ),
    //                             )
    //                           ],
    //                         ),
    //                       ),
    //                     );
    //                   },
    //                 ),
    //               )
    //             ],
    //           ),
    //         ),
    //       )
    //     ],
    //   ),
    // );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child:  Stack(
          children: [
            BackgroundArcs(Color(0xff46D1F7)),
            Container(
              child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: AppSize.s25.w, vertical: AppSize.s4.h),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 20,
                        ),
                        title: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: AppStrings.goodMorning,
                                  style: getRegularStyle(
                                      color: ColorManager.goodMorning,
                                      fontSize: FontSize.s16.sp),
                                  children: [
                                    WidgetSpan(
                                        child: Lottie.network(
                                            'https://fonts.gstatic.com/s/e/notoemoji/latest/1f44b/lottie.json',
                                            height: AppSize.s20.h,
                                            width: AppSize.s20.w)),
                                  ])
                            ])),
                        subtitle: Text('Hisham',
                            style: getBoldStyle(
                                color: ColorManager.goodMorning,
                                fontSize: FontSize.s20.sp)),
                        trailing: Container(
                          height: AppSize.s40.h,
                          width: AppSize.s40.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(AppSize.s12.r),
                              color: ColorManager.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Color(0xFF16434D).withOpacity(0.1),
                                    offset: Offset(0, 3),
                                    blurRadius: 13)
                              ]),
                          child: Icon(Icons.notifications_none),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: AppSize.s50.h,
                    ),
                    SizedBox(
                     height: 145.h,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),

                          clipBehavior: Clip.none,
                          itemCount: list.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, i) {
                            return EventWidget(
                              cardBTH: list[i],
                            );
                          }),
                    ),
                    SizedBox(
                      height: AppSize.s33.h,
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        padding: EdgeInsets.only(
                            left: AppSize.s30.w,
                            right: AppSize.s30.w,
                            top: AppSize.s36.h),
                        decoration: BoxDecoration(
                          color: ColorManager.chatBackGround,
                          borderRadius: BorderRadius.vertical(
                            top: Radius.elliptical(145, 35),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Chats',
                                  style: getBoldStyle(
                                      color: ColorManager.goodMorning,
                                      fontSize: FontSize.s20.sp),
                                ),
                                Container(
                                  height: AppSize.s40.h,
                                  padding: EdgeInsets.all(AppSize.s12.h),
                                  width: AppSize.s40.w,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(AppSize.s12.r),
                                      color: ColorManager.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0xFF16434D).withOpacity(0.1),
                                            offset: Offset(0, 3),
                                            blurRadius: 13)
                                      ]),
                                  child: SvgPicture.asset(
                                    ImageAssets.iconSearch,
                                    height: AppSize.s16.h,
                                    width: AppSize.s16.w,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: AppSize.s18.h,
                            ),
                            Expanded(
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),

                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                itemCount: 20,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(bottom: AppSize.s15.h),
                                    decoration: BoxDecoration(
                                        color: ColorManager.white,
                                        borderRadius:
                                        BorderRadius.circular(AppSize.s10.r)),
                                    child: ZoomIn(
                                      child: ListTile(
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
                                        subtitle: Text(
                                          'Let\'s Celebrate Now 🥳',
                                          style: getBoldStyle(
                                              color: Color(0xffC3C2C9),
                                              fontSize: FontSize.s14.sp),
                                        ),
                                        trailing: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            Text(
                                              '9:30 Pm',
                                              style: getBoldStyle(
                                                  color: Color(0xffC3C2C9),
                                                  fontSize: FontSize.s12.sp),
                                            ),
                                            Container(
                                              height: AppSize.s16.h,
                                              width: AppSize.s16.w,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  gradient: LinearGradient(
                                                      colors: [
                                                        Color(0xffEA4477),
                                                        Color(0xffFB84A7)
                                                      ],
                                                      tileMode: TileMode.clamp,
                                                      begin: Alignment.bottomRight,
                                                      stops: [0.0, 1.0],
                                                      end: Alignment.topLeft)),
                                              child: Text(
                                                '4',
                                                style: getBoldStyle(
                                                    color: ColorManager.white,
                                                    fontSize: FontSize.s12.sp),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
            ),
          ],
        )

      ),
    );
  }
}

class QuadrantCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY);

    canvas.drawCircle(Offset(centerX, centerY), radius, paint);

    canvas.drawLine(Offset(centerX, 0), Offset(centerX, centerY), paint);
    canvas.drawLine(Offset(0, centerY), Offset(centerX, centerY), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class EllipsePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    Rect rect = Rect.fromLTWH(250, -180, size.width, size.height);
    canvas.drawOval(rect, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
