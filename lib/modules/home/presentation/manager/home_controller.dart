// import 'package:flutter/animation.dart';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_firebase_chat_core/flutter_firebase_chat_core.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:treeme/core/utils/services/storage.dart';
import 'package:treeme/modules/home/data/data_sources/home_data_source.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/netwrok/failure.dart';
import '../../../../core/utils/error_toast.dart';
import '../../data/models/home_model.dart';

class HomeController extends GetxController {
  final IHomeDataSource _homeDataSource;

  HomeController(this._homeDataSource);

  final rxRequestStatus = RequestStatus.LOADING.obs;

  void setRxRequestStatus(RequestStatus _value) => rxRequestStatus.value = _value;
  RxList<EventData> eventByDate = <EventData>[].obs;
  final Rx<HomeModel> rxMyHomeModel = HomeModel().obs;
  RxInt number = 0.obs;
  void setRxGlobalSummary(HomeModel _value) => rxMyHomeModel.value = _value;

  @override
  void onInit() {
    super.onInit();
    print('refreshToken ${Storage().refreshToken}');
    print('refreshToken ${Storage().firebaseUID}');
    print('refreshToken ${FirebaseAuth.instance.currentUser}');
    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      print(newToken);
      Storage().refreshToken = newToken;
      log('fcmtoken ${Storage().refreshToken.toString()}');
      _homeDataSource.refeshToken(Storage().firebaseUID ?? '', newToken);
    });
    // prepreContact();
    getHome();
    postContact('+972597350412,+972597450412,+972597450479,+970592877046,+970595137670');
  }

  Future<void> postContact(String phones) async {
    final registerModel = await _homeDataSource.postContact(phones);
    registerModel.fold((l) => errorToast(l.message), (r) {
      log('secccc $r');
    });
  }

  DateTime parseTime(dynamic date) {
    return (date as Timestamp).toDate();
  }

  int showdeliverd(QuerySnapshot<Map<String, dynamic>>? data) {
    if (data != null) {
      data.docs.forEach((e) {
        if (e != null) {
          String status = e.data().toString().contains('status') ? e.get('status') : 'no';
          if (status == 'delivered' && e['authorId'] != Storage().firebaseUID) {
            number++;
          }
          // print(e.data().toString().contains('status') ? e.get('status') : 'no');
        }
      });
    }
    print('numer ${number.value}');
    return number.value;
  }

  prepreContact() async {
    List<String> contact = [];
    List<Contact> contacts = await ContactsService.getContacts(withThumbnails: false);
    contacts.forEach((element) {
      // print(element.phones.firstWhere((element) => element.value.).toString());
      if (element.phones != null) {
        if (element.phones?.isNotEmpty == true) {
          contact.add(element.phones?[0].value?.replaceAll(RegExp(r'[-\s]'), "") ?? '');
        }
      }
    });
    String dddd = contact.toString();
    log(dddd.replaceAll(RegExp(r'[\[\]\s]'), ''));
    postContact(contact.toString().replaceAll(RegExp(r'[-\s]'), ""));
  }

  Future<void> getHome() async {
    setRxRequestStatus(RequestStatus.LOADING);

    final Either<Failure, HomeModel> myHome = await _homeDataSource.getHome();
    myHome.fold((l) {
      setRxRequestStatus(RequestStatus.ERROR);

      log(l.message.toString());
      log(l.code.toString());
      // errorToast(l.message);
    }, (r) {
      // r = _myContactModel.value;
      // r.eventData?.sort((a, b) => DateTime.parse('${a.date} ${a.time} ')
      //     .compareTo(DateTime.parse('${b.date} ${b.time} ')));
      setRxGlobalSummary(r);
      r.eventData?.sort((a, b) => DateTime.parse('${b.date} ${b.time}')
          .compareTo(DateTime.parse('${a.date} ${a.time}')));
      setRxRequestStatus(RequestStatus.SUCESS);
      log(r.eventData.toString());
      // List<DateTime>? dates = r.eventData
      //     ?.map((dateString) =>
      //         DateTime.parse('${dateString.date} ${dateString.time}' ?? ''))
      //     .toList();
      //
      // dates?.sort((a, b) => b.compareTo(a));
      // List<String>? sortedDateStrings =
      //     dates?.map((date) => date.toString().substring(0, 10)).toList();
      // print(sortedDateStrings.toString());
      update();
      // print(_myContactModel.toString());
    });
  }

  valudate(List<String> contact) async {
    List<String> validNumbers = await getValidPhoneNumbers(contact);
    log("Valid phone numbers: ${validNumbers.toString()}");
  }

  // Stream<Room> rooms({bool orderByUpdatedAt = false}) {
  //   final fu = FirebaseAuth.instance.currentUser;
  //
  //   if (fu == null) return const Stream.empty();
  //
  //   final collection = orderByUpdatedAt
  //       ? FirebaseChatCore.instance
  //           .getFirebaseFirestore()
  //           .collection('Conversation')
  //           .where('firebaseIds', arrayContains: fu.uid)
  //           .orderBy('updatedAt', descending: true)
  //       : FirebaseChatCore.instance
  //           .getFirebaseFirestore()
  //           .collection('Conversation')
  //           .where('userIds', arrayContains: fu.uid);
  //
  //   return collection.snapshots().asyncMap(
  //         (query) => processRoomsQuery(
  //           fu,
  //           getFirebaseFirestore(),
  //           query,
  //           config.usersCollectionName,
  //         ),
  //       );
  // }

  Future<List<String>> getValidPhoneNumbers(List<String> numbers) async {
    final List<String> validNumbers = [];

    for (String number in numbers) {
      try {
        bool? isValid = await PhoneNumberUtil.isValidPhoneNumber(
          phoneNumber: number,
          isoCode: '', // Replace with the relevant country code
        );

        if (isValid!) {
          print(number);
          validNumbers.add(number.replaceAll(RegExp(r'[-\s]'), ''));
        }
      } catch (e) {
        print(e);
      }
    }

    return validNumbers;
  }

  bool hasInternationalPhoneNumber(String input) {
    PhoneNumber(countryISOCode: '', countryCode: '', number: input).isValidNumber();
    RegExp pattern = RegExp(
      r'^\+?\d{1,3}[-.\s]?\(?\d{1,4}\)?[-.\s]?\d{1,4}[-.\s]?\d{1,9}$',
      caseSensitive: false,
      multiLine: false,
    );
    return pattern.hasMatch(input);
  }

  Stream<types.Message> messages(
    types.Room room, {
    List<Object?>? endAt,
    List<Object?>? endBefore,
    int? limit,
    List<Object?>? startAfter,
    List<Object?>? startAt,
  }) {
    var query = FirebaseChatCore.instance
        .getFirebaseFirestore()
        .collection('${'Conversation'}/${room.id}/messages')
        .orderBy('createdAt', descending: false);

    if (endAt != null) {
      query = query.endAt(endAt);
    }

    if (endBefore != null) {
      query = query.endBefore(endBefore);
    }

    if (limit != null) {
      query = query.limit(limit);
    }

    if (startAfter != null) {
      query = query.startAfter(startAfter);
    }

    if (startAt != null) {
      query = query.startAt(startAt);
    }

    return query.snapshots().map(
          (snapshot) => snapshot.docs.fold<types.Message>(
            '' as types.Message,
            (previousValue, doc) {
              final data = doc.data();
              final author = room.users.firstWhere(
                (u) => u.id == data['authorId'],
                orElse: () => types.User(id: data['authorId'] as String),
              );

              data['author'] = author.toJson();
              data['createdAt'] = data['createdAt']?.millisecondsSinceEpoch;
              data['id'] = doc.id;
              data['updatedAt'] = data['updatedAt']?.millisecondsSinceEpoch;

              return types.Message.fromJson(data);
            },
          ),
        );
  }
}
