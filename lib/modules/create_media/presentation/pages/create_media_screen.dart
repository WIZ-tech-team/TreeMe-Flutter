// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:helpers/helpers/transition.dart';
// import 'package:stack_board/stack_board.dart';
// import 'package:treeme/core/resources/resource.dart';
// import 'package:treeme/modules/create_media/presentation/manager/create_media_controller.dart';
// import 'package:video_editor/video_editor.dart';
//
// // import 'package:video_editor/ui/crop/crop_grid.dart';
//
// import '../../../../core/helpers/audio_trimm/src/trim_viewer/trim_area_properties.dart';
// import '../../../../core/helpers/audio_trimm/src/trim_viewer/trim_editor_properties.dart';
// import '../../../../core/helpers/audio_trimm/src/trim_viewer/trim_viewer.dart';
// import '../../../../core/helpers/audio_trimm/src/utils/duration_style.dart';
// import '../../domain/entities/image_bord.dart';
// import '../widgets/sticker.dart';
//
// class CreateMediaScreen extends StatefulWidget {
//   const CreateMediaScreen({Key? key}) : super(key: key);
//
//   @override
//   State<CreateMediaScreen> createState() => _CreateMediaScreenState();
// }
//
// class _CreateMediaScreenState extends State<CreateMediaScreen>
//     with SingleTickerProviderStateMixin {
//   bool shouldScaleDown = true; // change value when needed
//   double expandedWidth = 100.0;
//   double initialWidth = 200.0;
//   double _top = 300; // distance to top
//   double _left = 150; // distance to left
//   double scale = 1;
//   double _scale = 1.0;
//   double _previousScale = 1.0;
//
//   Offset _offset = Offset.zero;
//   double _minValue = 0.5;
//   double _maxValue = 100.0;
//   double _lowerValue = 20.0;
//   double sliderWidth = 20.0;
//   double _upperValue = 80.0;
//
//   void _onValueChanged(double lowerValue, double upperValue) {
//     setState(() {
//       _lowerValue = lowerValue;
//       _upperValue = upperValue;
//     });
//   }
//
//   void _setRange(double lowerValue, double upperValue) {
//     setState(() {
//       _lowerValue = lowerValue;
//       _upperValue = upperValue;
//     });
//   }
//
//   void _decreaseRange() {
//     setState(() {
//       if (_lowerValue > _minValue) {
//         _lowerValue -= 1.0;
//         _upperValue -= 1.0;
//       }
//     });
//   }
//
//   void _increaseRange() {
//     setState(() {
//       if (_upperValue < _maxValue) {
//         _lowerValue += 1.0;
//         _upperValue += 1.0;
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // double _start = 0.0; // Move _start and _end here
//     // double _end = 1.0; // from TrimSliderTextState // Example calculation
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//         backgroundColor: ColorManager.chatBackGround,
//         appBar: PreferredSize(
//           preferredSize: Size(double.infinity, AppSize.s80.h),
//           child: AppBar(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(AppSize.s36.r),
//                     bottomRight: Radius.circular(AppSize.s36.r))),
//             elevation: 0,
//             backgroundColor: ColorManager.white,
//             leading: GestureDetector(
//               onTap: () {
//                 Get.back();
//               },
//               child: Container(
//                 margin: EdgeInsets.only(left: AppSize.s12.w),
//                 // width: 50.w,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(AppSize.s12.r),
//                     border: Border.all(
//                         color: ColorManager.white.withOpacity(0.29), width: AppSize.s1.w),
//                     // color: Colors.transparent,
//                     gradient: LinearGradient(
//                         colors: [
//                           ColorManager.white.withOpacity(0.51),
//                           ColorManager.white.withOpacity(0.13),
//                         ],
//                         stops: [
//                           0.3,
//                           2
//                         ],
//                         tileMode: TileMode.decal,
//                         begin: Alignment.bottomRight,
//                         end: Alignment.topLeft),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Color(0x1A21407C), offset: Offset(0, 3), blurRadius: 10)
//                     ]),
//                 child: Icon(
//                   Icons.arrow_back,
//                   color: ColorManager.goodMorning,
//                 ),
//               ),
//             ),
//             title: Text(
//               'Create Your \n media',
//               style: getBoldStyle(
//                   color: ColorManager.goodMorning, fontSize: FontSize.s16.sp),
//               textAlign: TextAlign.center,
//             ),
//             centerTitle: true,
//             actions: [
//               GestureDetector(
//                 // onTap: () => Get.to(const MyHomePage()),
//                 child: Container(
//                   margin: EdgeInsets.only(
//                       right: AppSize.s18.w, top: AppSize.s10.h, bottom: AppSize.s10.h),
//                   width: 60.w,
//                   decoration: ShapeDecoration(
//                       gradient: LinearGradient(
//                         colors: [Color(0xffEA4477), Color(0xffFB84A7)],
//                         tileMode: TileMode.decal,
//                         begin: Alignment.bottomRight,
//                         end: Alignment.topLeft,
//                       ),
//                       shape: StadiumBorder()),
//                   alignment: Alignment.center,
//                   child: Text('Done'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         body: GetBuilder<CreateMediaController>(builder: (logic) {
//           // print(logic.textOverlays[0].id);
//           return ListView(
//             // physics: NeverScrollableScrollPhysics(),
//             // primary: false,
//             children: [
//               Container(
//                   margin: EdgeInsets.only(top: AppSize.s39.h),
//                   width: double.infinity,
//                   child: Column(
//                     children: [
//                       (logic.videoEditorController != null &&
//                               logic.videoEditorController!.initialized)
//                           ? Container(
//                               height: 300.h,
//                               margin: EdgeInsets.only(bottom: 30.h),
//                               width: double.infinity,
//                               child: Stack(
//                                 clipBehavior: Clip.none,
//                                 alignment: Alignment.center,
//                                 children: [
//                                   SizedBox(
//                                     width: logic.videoEditorController!.videoWidth,
//                                     child: CropGridViewer.preview(
//                                         controller: logic.videoEditorController!),
//                                   ),
//                                   Align(
//                                       alignment: Alignment.center,
//                                       child: StackBoard(
//                                         controller: logic.boardController,
//                                         caseStyle: const CaseStyle(
//                                           borderColor: Colors.grey,
//                                           iconColor: Colors.white,
//                                         ),
//                                         background:
//                                             const ColoredBox(color: Colors.transparent),
//                                         customBuilder: (StackBoardItem t) {
//                                           if (t is CustomItem) {
//                                             return ItemCase(
//                                               key: Key('StackBoardItem${t.id}'),
//                                               // <==== must
//                                               isCenter: false,
//                                               onDel: () async =>
//                                                   logic.boardController.remove(t.id),
//                                               onTap: () => logic.boardController
//                                                   .moveItemToTop(t.id),
//                                               caseStyle: const CaseStyle(
//                                                 borderColor: Colors.grey,
//                                                 iconColor: Colors.white,
//                                               ),
//                                               child: Container(
//                                                 width: 100,
//                                                 height: 100,
//                                                 // color: t.color,
//                                                 alignment: Alignment.center,
//                                                 child: t.child,
//                                               ),
//                                             );
//                                           }
//
//                                           return null;
//                                         },
//                                       )),
//                                   /*Obx(() {
//                                     return StickerView(
//                                       // List of Stickers
//                                       // width: 20,
//                                         height: 300.h,
//                                         stickerList:
//                                         // for (var item in logic.imageOverlays)
//
//                                         logic.textOverlays
//                                             .map((e) => Sticker(
//                                           id: e.id ?? '',
//                                           isText: true,
//                                           child: Text(
//                                             e.text,
//                                             style: TextStyle(
//                                                 color: Colors
//                                                     .yellow,
//                                                 fontSize: 50,
//                                                 fontWeight:
//                                                 FontWeight
//                                                     .w900),
//                                           ),
//                                         ))
//                                             .toList()
//
//                                       //   Sticker(
//                                       //     id: "uniqueId_sas111",
//                                       //     child: Image.network(
//                                       //         "https://images.unsplash.com/photo-1640113292801-785c4c678e1e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=736&q=80"),
//                                       //   ),
//                                       // ],
//                                     );
//                                   })*/ /**/
//                                   /*  for (var item in logic.imageOverlays)
//                                     Visibility(
//                                       visible:
//                                           logic.imageOverlays.isNotEmpty &&
//                                               item.isSelected,
//                                       child: Container(
//                                         child: DragScaleImage(
//                                           imageOverly: item,
//                                           controller: logic,
//                                         ),
//                                       ),
//                                       // child: Positioned(
//                                       //   left: item.position.dx,
//                                       //   top: item.position.dy,
//                                       //   child: GestureDetector(
//                                       //     onScaleStart: (details) {
//                                       //       _previousScale = _scale;
//                                       //     },
//                                       //     onScaleUpdate: (details) {
//                                       //       setState(() {
//                                       //         _scale = _previousScale *
//                                       //             details.scale;
//                                       //       });
//                                       //       print(details.scale);
//                                       //     },
//                                       //     onScaleEnd: (_) {
//                                       //       _previousScale = 1.0;
//                                       //     },
//                                       //     child: Draggable(
//                                       //       child: Image.file(
//                                       //         File(
//                                       //           item.selectedImage!,
//                                       //         ),
//                                       //         scale: _scale,
//                                       //       ),
//                                       //       feedback: Image.file(
//                                       //         File(
//                                       //           item.selectedImage!,
//                                       //         ),
//                                       //         scale: _scale,
//                                       //       ),
//                                       //       childWhenDragging: Container(),
//                                       //       onDraggableCanceled: (_, __) {},
//                                       //       hitTestBehavior:
//                                       //           HitTestBehavior.opaque,
//                                       //       onDragEnd: (details) {
//                                       //         setState(() {
//                                       //           item.position =
//                                       //               details.offset;
//                                       //         });
//                                       //       },
//                                       //     ),
//                                       //   ),
//                                       //
//                                       //   // child: GestureDetector(
//                                       //   //   onScaleUpdate: (details) {
//                                       //   //     setState(() {
//                                       //   //       item.position +=
//                                       //   //           details.focalPoint -
//                                       //   //               details.localFocalPoint;
//                                       //   //       item.scale = details.scale;
//                                       //   //     });
//                                       //   //   },
//                                       //   //   child: Transform.scale(
//                                       //   //     scale: item.scale,
//                                       //   //     child: Image.file(File(
//                                       //   //       item.selectedImage!,
//                                       //   //     )),
//                                       //   //   ),
//                                       //   // ),
//                                       // ),
//                                     ),
//                                   for (var item in logic.textOverlays)
//                                     // StickerView(
//                                     //   height: 50,
//                                     //   width: 50,
//                                     //   stickerList: [
//                                     //     Sticker(
//                                     //       child: const Text("Hello"),
//                                     //       id: "uniqueId_222",
//                                     //       isText: true,
//                                     //     ),
//                                     //   ],
//                                     // ),
//                                     Positioned(
//                                       left: item.position?.dx,
//                                       top: item.position?.dy,
//                                       child: Container(
//                                         alignment: Alignment.center,
//                                         width: 150,
//                                         height: 300,
//                                         // color: Colors.white,
//                                         child: GestureDetector(
//                                           onPanUpdate: (details) {
//                                             setState(() {
//                                               item.position = Offset(
//                                                   (item.position?.dx ?? 0) +
//                                                       details.delta.dx,
//                                                   (item.position?.dy ?? 0) +
//                                                       details.delta.dy);
//                                             });
//                                           },
//                                           child: Padding(
//                                             padding:
//                                                 const EdgeInsets.all(8.0),
//                                             child: Center(
//                                               child: Text(item.text,
//                                                   textAlign: TextAlign.center,
//                                                   style: TextStyle(
//                                                       fontSize: item.fontSize,
//                                                       color: item.textColor)),
//                                             ),
//                                           ),
//                                         ),
//                                       ),
//                                     )*/
//                                 ],
//                               ),
//                             )
//                           : (logic.videoPlayerController != null &&
//                                   logic.videoPlayerController!.value.hasError)
//                               ? Text('Error loading video')
//                               : Image.network(
//                                   'https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?w=2000',
//                                   height: AppSize.s261.h,
//                                 ),
//
//                       // Visibility(
//                       //   visible: logic.videoFilePath.isNotEmpty,
//                       //   replacement: Image.network(
//                       //     'https://img.freepik.com/free-vector/hand-painted-watercolor-pastel-sky-background_23-2148902771.jpg?w=2000',
//                       //     height: AppSize.s261.h,
//                       //   ),
//                       //   child:
//                       //       VideoPlayerWidget(videoFilePath: logic.videoFilePath),
//                       // ),
//                       // if (logic.videoFilePath.isNotEmpty)
//                       //
//                       //   Chewie(controller: logic.chewieController),
//                       SizedBox(
//                         height: AppSize.s16.h,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           (logic.videoEditorController != null &&
//                                   logic.videoEditorController!.initialized)
//                               ? AnimatedBuilder(
//                                   animation: Listenable.merge([
//                                     logic.videoEditorController,
//                                     logic.videoEditorController?.video,
//                                   ]),
//                                   builder: (_, __) {
//                                     final duration =
//                                         logic.videoEditorController?.videoDuration;
//                                     final posSeconds =
//                                         logic.videoEditorController!.trimPosition *
//                                             duration!.inSeconds;
//                                     final posMin =
//                                         logic.videoEditorController!.trimPosition *
//                                             duration!.inMinutes;
//
//                                     return Text(
//                                       logic.formatter(Duration(
//                                           seconds: posSeconds.toInt(),
//                                           minutes: posMin.toInt())),
//                                       style: getBoldStyle(
//                                           color: ColorManager.goodMorning,
//                                           fontSize: FontSize.s12.sp),
//                                     );
//                                   })
//                               : SizedBox(),
//                           (logic.videoEditorController != null &&
//                                   logic.videoEditorController!.initialized)
//                               ? Text(
//                                   '/',
//                                   style: getBoldStyle(
//                                       color: Color(0xffBDBDC1),
//                                       fontSize: FontSize.s12.sp),
//                                 )
//                               : SizedBox(),
//                           (logic.videoEditorController != null &&
//                                   logic.videoEditorController!.initialized)
//                               ? Text(
//                                   logic.formatter(
//                                       logic.videoEditorController!.videoDuration),
//                                   style: getBoldStyle(
//                                       color: ColorManager.goodMorning,
//                                       fontSize: FontSize.s12.sp),
//                                 )
//                               : SizedBox(),
//                         ],
//                       )
//                     ],
//                   )),
//               SizedBox(
//                 height: AppSize.s16.h,
//               ),
//               Container(
//                 color: ColorManager.white,
//                 padding: EdgeInsets.only(left: AppSize.s18.w, top: AppSize.s26.h),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisSize: MainAxisSize.max,
//                     children: [
//                       Padding(
//                         padding: EdgeInsets.only(right: AppSize.s18.w),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 SvgPicture.asset(ImageAssets.backwordArrow),
//                                 SizedBox(
//                                   width: AppSize.s12.w,
//                                 ),
//                                 SvgPicture.asset(ImageAssets.forwardArrow),
//                               ],
//                             ),
//                             Row(
//                               children: [
//                                 SvgPicture.asset(ImageAssets.backVideo),
//                                 SizedBox(
//                                   width: AppSize.s20.w,
//                                 ),
//                                 Visibility(
//                                   visible: !logic.pause.value,
//                                   replacement: OpacityTransition(
//                                     visible: logic.pause.value,
//                                     child: GestureDetector(
//                                         onTap: () {
//                                           logic.videoEditorController!.video.pause();
//                                           logic.pausePlayer();
//                                         },
//                                         child: Icon(Icons.pause)),
//                                   ),
//                                   child: OpacityTransition(
//                                     visible: !logic.pause.value,
//                                     child: GestureDetector(
//                                         onTap: () {
//                                           logic.videoEditorController!.video.play();
//                                           logic.pausePlayer();
//                                         },
//                                         child: SvgPicture.asset(ImageAssets.playVideo)),
//                                   ),
//                                 ),
//                                 // GestureDetector(
//                                 //     onTap: () => logic.playandPause2(),
//                                 //     child: Visibility(
//                                 //         visible: !logic.pause.value,
//                                 //         replacement: Icon(Icons.pause),
//                                 //         child: SvgPicture.asset(
//                                 //             ImageAssets.playVideo))),
//                                 SizedBox(
//                                   width: AppSize.s20.w,
//                                 ),
//                                 GestureDetector(
//                                     // onTap: () => Get.to(() => CapCutEditor()),
//                                     child: SvgPicture.asset(ImageAssets.forwardVideo)),
//                               ],
//                             ),
//                             SvgPicture.asset(ImageAssets.zoomIcon),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: AppSize.s20.h,
//                       ),
//
//                       Row(
//                         children: [
//                           Stack(
//                             clipBehavior: Clip.hardEdge,
//                             fit: StackFit.loose,
//                             alignment: Alignment.bottomRight,
//                             // alignment: Alignment.bottomRight,
//                             children: [
//                               SvgPicture.asset(
//                                 ImageAssets.music,
//                               ),
//                               GestureDetector(
//                                 onTap: () => logic.pickFile(),
//                                 child: Container(
//                                   // margin: EdgeInsets.only(left: 5, top: 5),
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                     color: Colors.white,
//                                   ),
//                                   child: Icon(
//                                     Icons.add,
//                                     size: 14.sp,
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             width: AppSize.s14.w,
//                           ),
//                           Expanded(
//                             child: logic.isLoadingAudio
//                                 ? Container(
//                                     height: AppSize.s50.h,
//                                     color: Color(0xffE8E8E8),
//                                     alignment: Alignment.topCenter,
//                                     child: SizedBox(
//                                         height: 5.h,
//                                         child: LinearProgressIndicator(
//                                           backgroundColor: Color(0xffF15C89),
//                                         )))
//                                 : Visibility(
//                                     visible: !logic.progressVisibility,
//                                     replacement: TrimViewer(
//                                       trimmer: logic.trimmer,
//                                       viewerHeight: 50.h,
//                                       maxAudioLength: logic.durationAudio,
//                                       viewerWidth: Get.width,
//                                       durationStyle: DurationStyle.FORMAT_MM_SS,
//                                       backgroundColor: Color(0xffF15C89),
//                                       barColor: Colors.white,
//                                       durationTextStyle: TextStyle(
//                                           color: Theme.of(context).primaryColor),
//                                       allowAudioSelection: true,
//                                       editorProperties: TrimEditorProperties(
//                                         circleSize: 10,
//                                         borderPaintColor: Colors.pinkAccent,
//                                         borderWidth: 4,
//                                         borderRadius: 5,
//                                         circlePaintColor: Colors.pink.shade400,
//                                       ),
//                                       areaProperties: TrimAreaProperties.edgeBlur(
//                                           blurEdges: true, barFit: BoxFit.contain),
//                                       onChangeStart: (value) =>
//                                           logic.startValueAudio = value,
//                                       onChangeEnd: (value) => logic.endValueAudio = value,
//                                       onChangePlaybackState: (value) {
//                                         // if (mounted) {
//                                         // setState(() => _isPlaying = value);
//                                         // }
//                                       },
//                                     ),
//                                     child: Container(
//                                       height: AppSize.s50.h,
//                                       color: Color(0xffE8E8E8),
//                                       // child: AudioFileWaveforms(
//                                       //   size: Size(
//                                       //       MediaQuery.of(context).size.width / 2, 70),
//                                       //   playerController: logic.playerController,
//                                       //   waveformType: WaveformType.fitWidth,
//                                       //   decoration: BoxDecoration(
//                                       //     color: Color(0xffF15C89),
//                                       //   ),
//                                       //   enableSeekGesture: true,
//                                       //   continuousWaveform: true,
//                                       //   animationDuration:
//                                       //       const Duration(milliseconds: 200),
//                                       //   playerWaveStyle: const PlayerWaveStyle(
//                                       //       scaleFactor: 90,
//                                       //       fixedWaveColor: Colors.black54,
//                                       //       liveWaveColor: Colors.white,
//                                       //       waveCap: StrokeCap.round,
//                                       //       spacing: 5,
//                                       //       showTop: true,
//                                       //       showSeekLine: true,
//                                       //       seekLineColor: Colors.yellow,
//                                       //       seekLineThickness: 5,
//                                       //       showBottom: true),
//                                       // ),
//                                     ),
//                                   ),
//                           )
//                           // Expanded(
//                           //   child: WaveVisualizer(
//                           //     audioUrl: _isPlaying ? _filePath : null,
//                           //     isPlaying: _isPlaying,
//                           //   ),
//                           // ),
//                           // Expanded(
//                           //     child: Container(
//                           //   height: AppSize.s50.h,
//                           //   color: Color(0xffF15C89),
//                           //   // child: AnimatedBuilder(
//                           //   //   animation: logic.animationController,
//                           //   //   builder: (context, child) {
//                           //   //     return Row(
//                           //   //       mainAxisAlignment: MainAxisAlignment.center,
//                           //   //       children: List.generate(
//                           //   //         logic.audioData.length,
//                           //   //         (int index) {
//                           //   //           return Container(
//                           //   //             width: 5,
//                           //   //             height: 30 + (logic.audioData[index] * 30),
//                           //   //             margin: EdgeInsets.symmetric(horizontal: 2),
//                           //   //             color: Colors.white,
//                           //   //           );
//                           //   //         },
//                           //   //       ),
//                           //   //     );
//                           //   //   },
//                           //   // ),
//                           // ))
//                         ],
//                       ),
//                       SizedBox(
//                         height: AppSize.s10.h,
//                       ),
//                       Row(
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               logic.showTextOverlayDialog(context);
//                             },
//                             child: Stack(
//                               clipBehavior: Clip.none,
//                               alignment: Alignment.bottomRight,
//                               children: [
//                                 SvgPicture.asset(ImageAssets.text),
//                                 Align(
//                                   alignment: Alignment.bottomRight,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white,
//                                     ),
//                                     child: Icon(
//                                       Icons.add,
//                                       size: 14.sp,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             width: AppSize.s14.w,
//                           ),
//                           Obx(() {
//                             return logic.textOverlays.isNotEmpty == true
//                                 ? Expanded(
//                                     child: Container(
//                                       color: Color(0xffE8E8E8),
//                                       // height: 60,
//                                       child: ReorderableListView.builder(
//                                         shrinkWrap: true,
//                                         itemCount: logic.textOverlays.length,
//                                         padding: EdgeInsets.zero,
//                                         onReorder: (oldIndex, newIndex) {
//                                           setState(() {
//                                             if (newIndex > oldIndex) {
//                                               newIndex -= 1;
//                                             }
//                                             final item =
//                                                 logic.textOverlays.removeAt(oldIndex);
//                                             logic.textOverlays.insert(newIndex, item);
//                                           });
//                                         },
//                                         scrollDirection: Axis.vertical,
//                                         itemBuilder: (context, index) {
//                                           return Container(
//                                             // width: Get.width * 0.5,
//                                             margin: EdgeInsets.symmetric(vertical: 5.h),
//                                             key: Key(
//                                                 '$index-${logic.textOverlays[index]}'),
//                                             child: AnimatedBuilder(
//                                                 animation: Listenable.merge([
//                                                   logic.videoEditorController,
//                                                   logic.videoEditorController?.video,
//                                                 ]),
//                                                 builder: (_, __) {
//                                                   final duration = logic
//                                                       .videoEditorController
//                                                       ?.videoDuration;
//                                                   final posSeconds = logic
//                                                           .videoEditorController!
//                                                           .trimPosition *
//                                                       duration!.inSeconds;
//                                                   final posMin = logic
//                                                           .videoEditorController!
//                                                           .trimPosition *
//                                                       duration!.inMinutes;
//                                                   return WaveSlider(
//                                                     backgroundColor: Colors.transparent,
//                                                     heightWaveSlider: 60,
//                                                     widthWaveSlider: Get.width,
//                                                     sliderColor: Colors.black,
//                                                     duration: logic.videoEditorController!
//                                                         .videoDuration.inMilliseconds
//                                                         .toDouble(),
//                                                     callbackStart: (duration) {
//                                                       logic.textOverlays[index].startTime;
//                                                       print("Start $duration");
//                                                     },
//                                                     callbackEnd: (duration) {
//                                                       logic.textOverlays[index].endTime;
//                                                       print("End $duration");
//                                                     },
//                                                     // minTrimDuration: 0.5,
//                                                     // start: logic
//                                                     //     .videoEditorController!
//                                                     //     .minTrim,
//                                                     // end: logic.videoEditorController!
//                                                     //     .minTrim,
//                                                     // onTrimUpdate: (start, end) {
//                                                     //   print("Start ${start * 100}");
//                                                     //   print("Start ${start}");
//                                                     //   // _start =
//                                                     //   //     start; // Assign the updated values to _start and _end
//                                                     //   // _end = end; // variables
//                                                     //   print('end ${end * 100}');
//                                                     // },
//                                                     child: AnimatedContainer(
//                                                       duration:
//                                                           Duration(milliseconds: 300),
//                                                       decoration: BoxDecoration(
//                                                         color: logic.textOverlays[index]
//                                                             .textColor,
//                                                         borderRadius:
//                                                             BorderRadius.circular(
//                                                                 AppSize.s5.r),
//                                                         border: logic.textOverlays[index]
//                                                                 .isSelected
//                                                             ? Border.all(
//                                                                 color: Colors.black,
//                                                                 width: 1)
//                                                             : null,
//                                                       ),
//                                                       child: Stack(
//                                                         clipBehavior: Clip.none,
//                                                         alignment: Alignment.center,
//                                                         children: [
//                                                           Container(
//                                                             padding: EdgeInsets.all(
//                                                                 AppSize.s8.h),
//                                                             alignment: Alignment.center,
//                                                             child: Row(
//                                                               mainAxisSize:
//                                                                   MainAxisSize.min,
//                                                               crossAxisAlignment:
//                                                                   CrossAxisAlignment
//                                                                       .center,
//                                                               mainAxisAlignment:
//                                                                   MainAxisAlignment.start,
//                                                               children: [
//                                                                 Expanded(
//                                                                   child: SvgPicture.asset(
//                                                                     ImageAssets.text,
//                                                                     color: Colors.white,
//                                                                   ),
//                                                                 ),
//                                                                 Expanded(
//                                                                   child: Text(
//                                                                     logic
//                                                                         .textOverlays[
//                                                                             index]
//                                                                         .text,
//                                                                     overflow:
//                                                                         TextOverflow.clip,
//                                                                     softWrap: false,
//                                                                     style: TextStyle(
//                                                                         color:
//                                                                             Colors.white),
//                                                                   ),
//                                                                 ),
//                                                               ],
//                                                             ),
//                                                           ),
//                                                           logic.textOverlays[index]
//                                                                   .isSelected
//                                                               ? Align(
//                                                                   alignment:
//                                                                       Alignment.topRight,
//                                                                   child: InkWell(
//                                                                     onTap: () => logic
//                                                                         .removeTextOverlay(
//                                                                             index),
//                                                                     child: Container(
//                                                                       width: 20.w,
//                                                                       height: 20.h,
//                                                                       decoration:
//                                                                           BoxDecoration(
//                                                                         shape: BoxShape
//                                                                             .circle,
//                                                                         color:
//                                                                             Colors.blue,
//                                                                       ),
//                                                                       child: Icon(
//                                                                         Icons.close,
//                                                                         color:
//                                                                             Colors.white,
//                                                                         size: 10.sp,
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 )
//                                                               : SizedBox(),
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   );
//                                                 }),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   )
//                                 : Expanded(
//                                     child: Container(
//                                     height: AppSize.s50.h,
//                                     color: Color(0xffE8E8E8),
//                                     // child: AnimatedBuilder(
//                                     //   animation: logic.animationController,
//                                     //   builder: (context, child) {
//                                     //     return Row(
//                                     //       mainAxisAlignment: MainAxisAlignment.center,
//                                     //       children: List.generate(
//                                     //         logic.audioData.length,
//                                     //         (int index) {
//                                     //           return Container(
//                                     //             width: 5,
//                                     //             height: 30 + (logic.audioData[index] * 30),
//                                     //             margin: EdgeInsets.symmetric(horizontal: 2),
//                                     //             color: Colors.white,
//                                     //           );
//                                     //         },
//                                     //       ),
//                                     //     );
//                                     //   },
//                                     // ),
//                                   ));
//                           })
//                         ],
//                       ),
//                       SizedBox(
//                         height: AppSize.s10.h,
//                       ),
//                       Row(
//                         children: [
//                           GestureDetector(
//                             onTap: () {
//                               logic.pickFileImage();
//                             },
//                             child: Stack(
//                               clipBehavior: Clip.none,
//                               alignment: Alignment.bottomRight,
//                               children: [
//                                 SvgPicture.asset(ImageAssets.image),
//                                 Align(
//                                   alignment: Alignment.bottomRight,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white,
//                                     ),
//                                     child: Icon(
//                                       Icons.add,
//                                       size: 14.sp,
//                                     ),
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             width: AppSize.s14.w,
//                           ),
//                           Obx(() {
//                             return logic.imageOverlays.isNotEmpty == true
//                                 ? Expanded(
//                                     child: Container(
//                                       color: Color(0xffE8E8E8),
//                                       height: 50.h,
//                                       child: ReorderableListView.builder(
//                                         shrinkWrap: true,
//                                         itemCount: logic.imageOverlays.length,
//                                         padding: EdgeInsets.zero,
//                                         onReorder: (oldIndex, newIndex) {
//                                           setState(() {
//                                             if (newIndex > oldIndex) newIndex -= 1;
//                                             final item =
//                                                 logic.imageOverlays.removeAt(oldIndex);
//                                             logic.imageOverlays.insert(newIndex, item);
//                                           });
//                                         },
//                                         scrollDirection: Axis.horizontal,
//                                         itemBuilder: (context, index) {
//                                           return GestureDetector(
//                                             onTap: () {
//                                               logic.selectedImage(
//                                                   logic.imageOverlays[index]);
//                                             },
//                                             key: Key(
//                                                 '$index-${logic.imageOverlays[index]}'),
//                                             child: WaveSlider(
//                                               backgroundColor: Colors.transparent,
//                                               heightWaveSlider: 60,
//                                               widthWaveSlider: Get.width,
//                                               sliderColor: Colors.black,
//                                               duration: logic.videoEditorController!
//                                                   .videoDuration.inMilliseconds
//                                                   .toDouble(),
//                                               callbackStart: (duration) {
//                                                 // logic.imageOverlays[index];
//                                                 print("Start $duration");
//                                               },
//                                               callbackEnd: (duration) {
//                                                 print("End $duration");
//                                               },
//                                               child: Image.file(File(logic
//                                                   .imageOverlays[index].selectedImage!)),
//                                             ),
//                                             // child: Stack(
//                                             //   alignment: Alignment.center,
//                                             //   children: [
//                                             //     Image.file(File(logic
//                                             //         .imageOverlays[index]
//                                             //         .selectedImage!)),
//                                             //     WidthRangeSliderScreen(
//                                             //         values: SfRangeValues(
//                                             //             logic.imageOverlays[index]
//                                             //                 .startRange,
//                                             //             logic.imageOverlays[index]
//                                             //                 .endRange)),
//                                             //   ],
//                                             // ),
//                                           );
//                                         },
//                                       ),
//                                     ),
//                                   )
//                                 : Expanded(
//                                     child: Container(
//                                     height: AppSize.s50.h,
//                                     color: Color(0xffE8E8E8),
//
//                                     // child: AnimatedBuilder(
//                                     //   animation: logic.animationController,
//                                     //   builder: (context, child) {
//                                     //     return Row(
//                                     //       mainAxisAlignment: MainAxisAlignment.center,
//                                     //       children: List.generate(
//                                     //         logic.audioData.length,
//                                     //         (int index) {
//                                     //           return Container(
//                                     //             width: 5,
//                                     //             height: 30 + (logic.audioData[index] * 30),
//                                     //             margin: EdgeInsets.symmetric(horizontal: 2),
//                                     //             color: Colors.white,
//                                     //           );
//                                     //         },
//                                     //       ),
//                                     //     );
//                                     //   },
//                                     // ),
//                                   ));
//                           })
//                         ],
//                       ),
//                       SizedBox(
//                         height: AppSize.s10.h,
//                       ),
//                       Row(
//                         // shrinkWrap: true,
//                         // scrollDirection: Axis.horizontal,
//
//                         // direction: Axis.horizontal,
//                         // mainAxisSize: MainAxisSize.max,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Stack(
//                             clipBehavior: Clip.none,
//                             alignment: Alignment.bottomRight,
//                             children: [
//                               SvgPicture.asset(ImageAssets.video),
//                               GestureDetector(
//                                 onTap: () => logic.pickFileVideo(context),
//                                 child: Align(
//                                   alignment: Alignment.bottomRight,
//                                   child: Container(
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.white,
//                                     ),
//                                     child: Icon(
//                                       Icons.add,
//                                       size: 14.sp,
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                           SizedBox(
//                             width: AppSize.s14.w,
//                           ),
//                           (logic.videoEditorController != null &&
//                                   logic.videoEditorController!.initialized)
//                               ? Expanded(child:
//                                   LayoutBuilder(builder: (context, boxConstraints) {
//                                   print(boxConstraints.maxWidth);
//                                   return Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: logic.trimSlider(context),
//                                   );
//                                 }))
//                               : Expanded(
//                                   child: Container(
//                                   height: AppSize.s50.h,
//                                   color: Color(0xffE8E8E8),
//                                   // child: AnimatedBuilder(
//                                   //   animation: logic.animationController,
//                                   //   builder: (context, child) {
//                                   //     return Row(
//                                   //       mainAxisAlignment: MainAxisAlignment.center,
//                                   //       children: List.generate(
//                                   //         logic.audioData.length,
//                                   //         (int index) {
//                                   //           return Container(
//                                   //             width: 5,
//                                   //             height: 30 + (logic.audioData[index] * 30),
//                                   //             margin: EdgeInsets.symmetric(horizontal: 2),
//                                   //             color: Colors.white,
//                                   //           );
//                                   //         },
//                                   //       ),
//                                   //     );
//                                   //   },
//                                   // ),
//                                 )),
//                         ],
//                       ),
//                       SizedBox(
//                         height: AppSize.s10.h,
//                       ),
//                       // Container(
//                       //   height: 50,
//                       //   alignment: Alignment.centerLeft,
//                       //   child: Row(
//                       //     // shrinkWrap: true,
//                       //
//                       //     // scrollDirection: Axis.horizontal,
//                       //     // physics: AlwaysScrollableScrollPhysics(),
//                       //     // direction: Axis.horizontal,
//                       //     // mainAxisSize: MainAxisSize.max,
//                       //     // mainAxisAlignment: MainAxisAlignment.start,
//                       //     // crossAxisAlignment: CrossAxisAlignment.start,
//                       //     children: [
//                       //       Stack(
//                       //         clipBehavior: Clip.none,
//                       //         alignment: Alignment.bottomRight,
//                       //         children: [
//                       //           SvgPicture.asset(ImageAssets.sound),
//                       //           Align(
//                       //             alignment: Alignment.bottomRight,
//                       //             child: Container(
//                       //               decoration: BoxDecoration(
//                       //                 shape: BoxShape.circle,
//                       //                 color: Colors.white,
//                       //               ),
//                       //               child: Icon(
//                       //                 Icons.add,
//                       //                 size: 14.sp,
//                       //               ),
//                       //             ),
//                       //           )
//                       //         ],
//                       //       ),
//                       //       SizedBox(
//                       //         width: AppSize.s14.w,
//                       //       ),
//                       //       // if (logic.videoFilePath.isNotEmpty)
//                       //       //   AudioFileWaveforms(
//                       //       //     size: Size(Get.width * 0.89, 70),
//                       //       //     playerController: logic.playerController2,
//                       //       //     waveformType: WaveformType.long,
//                       //       //     padding: EdgeInsets.only(
//                       //       //         top: 5, bottom: 5, right: 5, left: 5),
//                       //       //     decoration: BoxDecoration(
//                       //       //       color: Color(0xffF15C89),
//                       //       //     ),
//                       //       //     enableSeekGesture: true,
//                       //       //     continuousWaveform: true,
//                       //       //     animationDuration:
//                       //       //         const Duration(milliseconds: 200),
//                       //       //     playerWaveStyle: const PlayerWaveStyle(
//                       //       //         scaleFactor: 90,
//                       //       //         fixedWaveColor: Colors.black54,
//                       //       //         liveWaveColor: Colors.white,
//                       //       //         waveCap: StrokeCap.round,
//                       //       //         spacing: 5,
//                       //       //         showTop: true,
//                       //       //         showSeekLine: true,
//                       //       //         seekLineColor: Colors.yellow,
//                       //       //         seekLineThickness: 5,
//                       //       //         showBottom: true),
//                       //       //   ),
//                       //     ],
//                       //   ),
//                       // ),
//                       // Row(
//                       //   children: [
//                       //     Stack(
//                       //       clipBehavior: Clip.none,
//                       //       alignment: Alignment.bottomRight,
//                       //       children: [
//                       //         SvgPicture.asset(ImageAssets.sound),
//                       //         Align(
//                       //           alignment: Alignment.bottomRight,
//                       //           child: Container(
//                       //             decoration: BoxDecoration(
//                       //               shape: BoxShape.circle,
//                       //               color: Colors.white,
//                       //             ),
//                       //             child: Icon(
//                       //               Icons.add,
//                       //               size: 14.sp,
//                       //             ),
//                       //           ),
//                       //         )
//                       //       ],
//                       //     ),
//                       //     SizedBox(
//                       //       width: AppSize.s14.w,
//                       //     ),
//                       //     Container(
//                       //       height: AppSize.s50.h,
//                       //       child: AudioFileWaveforms(
//                       //         size:
//                       //             Size(MediaQuery.of(context).size.width / 2, 70),
//                       //         playerController: logic.playerController2,
//                       //         waveformType: WaveformType.fitWidth,
//                       //         decoration: BoxDecoration(
//                       //           color: Color(0xffF15C89),
//                       //         ),
//                       //         enableSeekGesture: true,
//                       //         continuousWaveform: true,
//                       //         animationDuration:
//                       //             const Duration(milliseconds: 200),
//                       //         playerWaveStyle: const PlayerWaveStyle(
//                       //             scaleFactor: 90,
//                       //             fixedWaveColor: Colors.black54,
//                       //             liveWaveColor: Colors.white,
//                       //             waveCap: StrokeCap.round,
//                       //             spacing: 5,
//                       //             showTop: true,
//                       //             showSeekLine: true,
//                       //             seekLineColor: Colors.yellow,
//                       //             seekLineThickness: 5,
//                       //             showBottom: true),
//                       //       ),
//                       //     )
//                       //   ],
//                       // ),
//
//                       //
//                       // (logic.videoEditorController != null &&
//                       //         logic.videoEditorController!.initialized)
//                       //     ? Container(
//                       //         width: Get.width,
//                       //         margin: EdgeInsets.symmetric(vertical: 60 / 4),
//                       //         child: TrimTimeline(
//                       //           controller: logic.videoEditorController!,
//                       //           padding: const EdgeInsets.only(top: 10),
//                       //         ),
//                       //       )
//                       //     : SizedBox(),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           );
//         }),
//       ),
//     );
//   }
// // child: FlutterSlider(
// // values: [
// // _lowerValue,
// // _upperValue
// // ],
// // rangeSlider: true,
// // min: _minValue,
// // max: _maxValue,
// // handlerWidth: 60,
// // onDragging: (handlerIndex,
// // lowerValue, upperValue) {
// // _onValueChanged(
// // lowerValue, upperValue);
// // },
// // maximumDistance: _maxValue,
// // minimumDistance: 0,
// // jump: true,
// // handlerHeight: 50,
// // hatchMark:
// // FlutterSliderHatchMark(),
// // trackBar: FlutterSliderTrackBar(
// // centralWidget: Container(
// // margin: EdgeInsets.symmetric(
// // horizontal: 5.w),
// // decoration: BoxDecoration(
// // borderRadius:
// // BorderRadius.circular(
// // AppSize.s5.r)),
// // child: Stack(
// // clipBehavior: Clip.none,
// // alignment:
// // Alignment.topRight,
// // children: [
// // Container(
// // child: Image.file(
// // File(
// // logic
// //     .imageOverlays[
// // index]
// //     .selectedImage ??
// // '',
// // ),
// // ),
// // ),
// // // Align(
// // //     alignment: Alignment.topRight,
// // //     child: InkWell(
// // //       onTap: () => logic
// // //           .removeImageOverlay(
// // //               index),
// // //       child: Container(
// // //         width: 20.w,
// // //         height: 20.h,
// // //         decoration: BoxDecoration(
// // //           shape: BoxShape.circle,
// // //           color: Colors.blue,
// // //         ),
// // //         child: Icon(
// // //           Icons.close,
// // //           color: Colors.white,
// // //           size: 10.sp,
// // //         ),
// // //       ),
// // //     ))
// // ],
// // ),
// // ),
// // ),
// //
// // handler: FlutterSliderHandler(
// // decoration: BoxDecoration(),
// // child: Container(
// // width: 16.w,
// // height: double.infinity,
// // alignment: Alignment.center,
// // decoration: BoxDecoration(
// // color: Colors.black,
// // borderRadius:
// // BorderRadius
// //     .circular(2)),
// // child: Icon(
// // Icons.arrow_back_ios_new,
// // color: Colors.white,
// // size: 15.sp,
// // ),
// // )),
// // rightHandler:
// // FlutterSliderHandler(
// // decoration:
// // BoxDecoration(),
// // child: Container(
// // width: 16.w,
// // height: double.infinity,
// // alignment:
// // Alignment.center,
// // decoration: BoxDecoration(
// // color: Colors.black,
// // borderRadius:
// // BorderRadius
// //     .circular(
// // 2)),
// // child: Icon(
// // Icons
// //     .arrow_forward_ios,
// // color: Colors.white,
// // size: 15.sp,
// // ),
// // )),
// //
// // // foregroundDecoration:
// // //     BoxDecoration(
// // //         color: Colors.pink),
// // ));
// // void _onHorizontalDragStart(DragStartDetails details) {
// //   final pos = details.localPosition;
// //
// //   // Left, right and video progress indicator touch areas
// //   Rect leftTouch = Rect.fromCenter(
// //     center: Offset(_rect.left - _edgesTouchMargin / 2, _rect.height / 2),
// //     width: _edgesTouchMargin,
// //     height: _rect.height,
// //   );
// //   Rect rightTouch = Rect.fromCenter(
// //     center: Offset(_rect.right + _edgesTouchMargin / 2, _rect.height / 2),
// //     width: _edgesTouchMargin,
// //     height: _rect.height,
// //   );
// //   final progressTouch = Rect.fromCenter(
// //     center: Offset(progressTrim, _rect.height / 2),
// //     width: _positionTouchMargin,
// //     height: _rect.height,
// //   );
// //
// //   // if the scroll view is touched, it will be by default an inside gesture
// //   _boundary = _TrimBoundaries.inside;
// //
// //   /// boundary should not be set to other that inside when scroll controller is moving
// //   /// it would lead to weird behavior to change position while scrolling
// //   if (isNotScrollBouncingBack &&
// //       !_scrollController.position.isScrollingNotifier.value) {
// //     if (progressTouch.contains(pos)) {
// //       // video indicator should have the higher priority since it does not affect the trim param
// //       _boundary = _TrimBoundaries.progress;
// //     } else {
// //       // if video indicator is not touched, expand [leftTouch] and [rightTouch] on the inside
// //       leftTouch = leftTouch.expandToInclude(
// //           Rect.fromLTWH(_rect.left, 0, _edgesTouchMargin, 1));
// //       rightTouch = rightTouch.expandToInclude(Rect.fromLTWH(
// //           _rect.right - _edgesTouchMargin, 0, _edgesTouchMargin, 1));
// //     }
// //
// //     if (leftTouch.contains(pos)) {
// //       _boundary = _TrimBoundaries.left;
// //     } else if (rightTouch.contains(pos)) {
// //       _boundary = _TrimBoundaries.right;
// //     }
// //   }
// //
// //   _updateControllerIsTrimming(true);
// // }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stories_editor/stories_editor.dart';
import 'package:treeme/core/resources/resource.dart';
import 'package:treeme/core/widgets/custom_elevated_button_widget.dart';
import 'package:treeme/modules/create_event/presentation/manager/create_event_controller.dart';

class CreateMediaScreen extends StatefulWidget {
  const CreateMediaScreen({Key? key}) : super(key: key);

  @override
  State<CreateMediaScreen> createState() => _CreateMediaScreenState();
}

class _CreateMediaScreenState extends State<CreateMediaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, AppSize.s80.h),
        child: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppSize.s36.r),
                  bottomRight: Radius.circular(AppSize.s36.r))),
          elevation: 0,
          backgroundColor: ColorManager.white,
          leading: GestureDetector(
            onTap: () {
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
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Create Your \n media',
              style: getBoldStyle(
                  color: ColorManager.goodMorning, fontSize: FontSize.s16.sp),
              textAlign: TextAlign.center,
            ),
          ),
          centerTitle: true,
          // actions: [
          //   GestureDetector(
          //     // onTap: () => Get.to(const MyHomePage()),
          //     child: Container(
          //       margin: EdgeInsets.only(
          //           right: AppSize.s18.w, top: AppSize.s10.h, bottom: AppSize.s10.h),
          //       width: 60.w,
          //       decoration: ShapeDecoration(
          //           gradient: LinearGradient(
          //             colors: [Color(0xffEA4477), Color(0xffFB84A7)],
          //             tileMode: TileMode.decal,
          //             begin: Alignment.bottomRight,
          //             end: Alignment.topLeft,
          //           ),
          //           shape: StadiumBorder()),
          //       alignment: Alignment.center,
          //       child: Text('Done'),
          //     ),
          //   ),
          // ],
        ),
      ),
      body: GetBuilder<CreateEventController>(

        builder: (logic) {
          return StoriesEditor(
            giphyKey: 'VK4ckKZgLUk2G2l2n4Ssukm67DV947Yn',
            onDone: (uri) {
              debugPrint(uri);
              logic.urlMedia.value = uri;
              logic.createNewEvent();
              // Share.shareFiles([uri]);
            },
            onDoneButtonStyle: CustomElevatedButton(title: 'Next'),
            middleBottomWidget: SizedBox(),
            editorBackgroundColor: Color(0xffE5E5E5),
          );
        },
      ),
    );
  }
}
