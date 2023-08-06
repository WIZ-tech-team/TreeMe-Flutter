/// message : "user conversations and events"
/// conversation_data : [{"conversationId":"e8ada7800c474be088dd","data":{"users_id":[1,3],"firebaseIds":{"receiver":"Undg0qwkkDSa8uZO61W701ghtT23","sender":"0whsoBu5wbOkAHwmFRFSfuWJ1nQ2"},"lastMessageId":" ","type":"peer","created_by":3,"participants":{"1":true,"3":true},"updatedAt":"2023-07-24T20:16:30.538000Z"},"user_data":[{"id":1,"name":"Maram","email_verified_at":null,"provider":null,"provider_id":null,"created_at":"2023-07-24T11:12:31.000000Z","updated_at":"2023-07-25T12:03:27.000000Z","user_type":"member","firebase_uid":"Undg0qwkkDSa8uZO61W701ghtT23","avatar":null,"phone":"+970592877046","otp":"304360","age":null,"contacts":"[\"+972597250522\",\"+970592877046\"]","email":null}]},{"conversationId":"ec114afcd6894143a1a5","data":{"users_id":[2,3],"firebaseIds":{"receiver":"CAqUB4Gxaie7pIsa78XdrfpTBCd2","sender":"0whsoBu5wbOkAHwmFRFSfuWJ1nQ2"},"lastMessageId":" ","type":"peer","created_by":3,"participants":{"2":true,"3":true},"updatedAt":"2023-07-24T13:22:12.101000Z"},"user_data":[{"id":2,"name":"HIND","email_verified_at":null,"provider":null,"provider_id":null,"created_at":"2023-07-24T11:40:07.000000Z","updated_at":"2023-07-24T13:22:01.000000Z","user_type":"member","firebase_uid":"CAqUB4Gxaie7pIsa78XdrfpTBCd2","avatar":null,"phone":"+970595137670","otp":"183538","age":null,"contacts":"[\"+972597350412\",\"+972597450412\",\"+972597450479\"]","email":null}]}]
/// event_data : [{"id":1,"document_id":"e7140f2bf1c142839214","title":"birthdaaaaaay","time":"15:07:00","date":"2023-06-19","event_color":"#ff0080,#ff64b1","event_image":"images/GINP1DwAzRdZc2admIo00oMqO0m8i4kDI0d29tqL.jpg","avatars":[{"id":1,"avatar":null},{"id":2,"avatar":null},{"id":3,"avatar":null},{"id":4,"avatar":null}],"userIds":["0whsoBu5wbOkAHwmFRFSfuWJ1nQ2","3ps6pHzfAjaUkDXvNA21yfflZN73","CAqUB4Gxaie7pIsa78XdrfpTBCd2","Undg0qwkkDSa8uZO61W701ghtT23"]},{"id":2,"document_id":"4a55d8418d354b669c61","title":"mmoh","time":"18:52:00","date":"2023-07-20","event_color":"#ff0080,#ff64b1","event_image":"images/GINP1DwAzRdZc2admIo00oMqO0m8i4kDI0d29tqL.jpg","avatars":[{"id":1,"avatar":null},{"id":2,"avatar":null},{"id":3,"avatar":null}],"userIds":["Undg0qwkkDSa8uZO61W701ghtT23","CAqUB4Gxaie7pIsa78XdrfpTBCd2","0whsoBu5wbOkAHwmFRFSfuWJ1nQ2"]},{"id":3,"document_id":"ab5206eb7fc24910975f","title":"test evenr","time":"19:32:00","date":"2023-07-12","event_color":"#ff0080,#ff64b1","event_image":"images/GINP1DwAzRdZc2admIo00oMqO0m8i4kDI0d29tqL.jpg","avatars":[{"id":1,"avatar":null},{"id":2,"avatar":null},{"id":3,"avatar":null}],"userIds":["Undg0qwkkDSa8uZO61W701ghtT23","CAqUB4Gxaie7pIsa78XdrfpTBCd2","0whsoBu5wbOkAHwmFRFSfuWJ1nQ2"]},{"id":4,"document_id":"1567264e95c84966abc9","title":"hhgg","time":"15:46:00","date":"2023-07-26","event_color":"#A99EFF,#8271F2","event_image":"images/SJ92NpDWXJiAFVr7YmvtI3Ijm2x0SEu8nzTcI4TV.png","avatars":[{"id":1,"avatar":null},{"id":3,"avatar":null},{"id":5,"avatar":null}],"userIds":["Undg0qwkkDSa8uZO61W701ghtT23","0whsoBu5wbOkAHwmFRFSfuWJ1nQ2","N8qQjbnewQXqg8eui761EIMra5A2"]},{"id":5,"document_id":"8c7fcf2ae6c9435fa7b9","title":"ytewjb","time":"15:07:00","date":"2023-06-19","event_color":"#ff0080,#ff64b1","event_image":"images/GINP1DwAzRdZc2admIo00oMqO0m8i4kDI0d29tqL.jpg","avatars":[{"id":2,"avatar":null},{"id":3,"avatar":null},{"id":4,"avatar":null}],"userIds":["CAqUB4Gxaie7pIsa78XdrfpTBCd2","0whsoBu5wbOkAHwmFRFSfuWJ1nQ2","3ps6pHzfAjaUkDXvNA21yfflZN73"]}]
/// status : 200

class HomeModel {
  HomeModel({
    String? message,
    List<ConversationData>? conversationData,
    List<EventData>? eventData,
    num? status,
  }) {
    _message = message;
    _conversationData = conversationData;
    _eventData = eventData;
    _status = status;
  }

  HomeModel.fromJson(dynamic json) {
    _message = json['message'];
    if (json['conversation_data'] != null) {
      _conversationData = [];
      json['conversation_data'].forEach((v) {
        _conversationData?.add(ConversationData.fromJson(v));
      });
    }
    if (json['event_data'] != null) {
      _eventData = [];
      json['event_data'].forEach((v) {
        _eventData?.add(EventData.fromJson(v));
      });
    }
    _status = json['status'];
  }
  String? _message;
  List<ConversationData>? _conversationData;
  List<EventData>? _eventData;
  num? _status;
  HomeModel copyWith({
    String? message,
    List<ConversationData>? conversationData,
    List<EventData>? eventData,
    num? status,
  }) =>
      HomeModel(
        message: message ?? _message,
        conversationData: conversationData ?? _conversationData,
        eventData: eventData ?? _eventData,
        status: status ?? _status,
      );
  String? get message => _message;
  List<ConversationData>? get conversationData => _conversationData;
  List<EventData>? get eventData => _eventData;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_conversationData != null) {
      map['conversation_data'] = _conversationData?.map((v) => v.toJson()).toList();
    }
    if (_eventData != null) {
      map['event_data'] = _eventData?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    return map;
  }
}

/// id : 1
/// document_id : "e7140f2bf1c142839214"
/// title : "birthdaaaaaay"
/// time : "15:07:00"
/// date : "2023-06-19"
/// event_color : "#ff0080,#ff64b1"
/// event_image : "images/GINP1DwAzRdZc2admIo00oMqO0m8i4kDI0d29tqL.jpg"
/// avatars : [{"id":1,"avatar":null},{"id":2,"avatar":null},{"id":3,"avatar":null},{"id":4,"avatar":null}]
/// userIds : ["0whsoBu5wbOkAHwmFRFSfuWJ1nQ2","3ps6pHzfAjaUkDXvNA21yfflZN73","CAqUB4Gxaie7pIsa78XdrfpTBCd2","Undg0qwkkDSa8uZO61W701ghtT23"]

class EventData {
  EventData({
    num? id,
    String? documentId,
    String? title,
    String? time,
    String? date,
    String? eventColor,
    String? eventImage,
    List<Avatars>? avatars,
    List<String>? userIds,
  }) {
    _id = id;
    _documentId = documentId;
    _title = title;
    _time = time;
    _date = date;
    _eventColor = eventColor;
    _eventImage = eventImage;
    _avatars = avatars;
    _userIds = userIds;
  }

  EventData.fromJson(dynamic json) {
    _id = json['id'];
    _documentId = json['document_id'];
    _title = json['title'];
    _time = json['time'];
    _date = json['date'];
    _eventColor = json['event_color'];
    _eventImage = json['event_image'];
    if (json['avatars'] != null) {
      _avatars = [];
      json['avatars'].forEach((v) {
        _avatars?.add(Avatars.fromJson(v));
      });
    }
    _userIds = json['userIds'] != null ? json['userIds'].cast<String>() : [];
  }
  num? _id;
  String? _documentId;
  String? _title;
  String? _time;
  String? _date;
  String? _eventColor;
  String? _eventImage;
  List<Avatars>? _avatars;
  List<String>? _userIds;
  EventData copyWith({
    num? id,
    String? documentId,
    String? title,
    String? time,
    String? date,
    String? eventColor,
    String? eventImage,
    List<Avatars>? avatars,
    List<String>? userIds,
  }) =>
      EventData(
        id: id ?? _id,
        documentId: documentId ?? _documentId,
        title: title ?? _title,
        time: time ?? _time,
        date: date ?? _date,
        eventColor: eventColor ?? _eventColor,
        eventImage: eventImage ?? _eventImage,
        avatars: avatars ?? _avatars,
        userIds: userIds ?? _userIds,
      );
  num? get id => _id;
  String? get documentId => _documentId;
  String? get title => _title;
  String? get time => _time;
  String? get date => _date;
  String? get eventColor => _eventColor;
  String? get eventImage => _eventImage;
  List<Avatars>? get avatars => _avatars;
  List<String>? get userIds => _userIds;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['document_id'] = _documentId;
    map['title'] = _title;
    map['time'] = _time;
    map['date'] = _date;
    map['event_color'] = _eventColor;
    map['event_image'] = _eventImage;
    if (_avatars != null) {
      map['avatars'] = _avatars?.map((v) => v.toJson()).toList();
    }
    map['userIds'] = _userIds;
    return map;
  }
}

/// id : 1
/// avatar : null

class Avatars {
  Avatars({
    num? id,
    dynamic avatar,
  }) {
    _id = id;
    _avatar = avatar;
  }

  Avatars.fromJson(dynamic json) {
    _id = json['id'];
    _avatar = json['avatar'];
  }
  num? _id;
  dynamic _avatar;
  Avatars copyWith({
    num? id,
    dynamic avatar,
  }) =>
      Avatars(
        id: id ?? _id,
        avatar: avatar ?? _avatar,
      );
  num? get id => _id;
  dynamic get avatar => _avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['avatar'] = _avatar;
    return map;
  }
}

/// conversationId : "e8ada7800c474be088dd"
/// data : {"users_id":[1,3],"firebaseIds":{"receiver":"Undg0qwkkDSa8uZO61W701ghtT23","sender":"0whsoBu5wbOkAHwmFRFSfuWJ1nQ2"},"lastMessageId":" ","type":"peer","created_by":3,"participants":{"1":true,"3":true},"updatedAt":"2023-07-24T20:16:30.538000Z"}
/// user_data : [{"id":1,"name":"Maram","email_verified_at":null,"provider":null,"provider_id":null,"created_at":"2023-07-24T11:12:31.000000Z","updated_at":"2023-07-25T12:03:27.000000Z","user_type":"member","firebase_uid":"Undg0qwkkDSa8uZO61W701ghtT23","avatar":null,"phone":"+970592877046","otp":"304360","age":null,"contacts":"[\"+972597250522\",\"+970592877046\"]","email":null}]

class ConversationData {
  ConversationData({
    String? conversationId,
    Data? data,
    List<UserData>? userData,
  }) {
    _conversationId = conversationId;
    _data = data;
    _userData = userData;
  }

  ConversationData.fromJson(dynamic json) {
    _conversationId = json['conversationId'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
    if (json['user_data'] != null) {
      _userData = [];
      json['user_data'].forEach((v) {
        _userData?.add(UserData.fromJson(v));
      });
    }
  }
  String? _conversationId;
  Data? _data;
  List<UserData>? _userData;
  ConversationData copyWith({
    String? conversationId,
    Data? data,
    List<UserData>? userData,
  }) =>
      ConversationData(
        conversationId: conversationId ?? _conversationId,
        data: data ?? _data,
        userData: userData ?? _userData,
      );
  String? get conversationId => _conversationId;
  Data? get data => _data;
  List<UserData>? get userData => _userData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['conversationId'] = _conversationId;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    if (_userData != null) {
      map['user_data'] = _userData?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

/// id : 1
/// name : "Maram"
/// email_verified_at : null
/// provider : null
/// provider_id : null
/// created_at : "2023-07-24T11:12:31.000000Z"
/// updated_at : "2023-07-25T12:03:27.000000Z"
/// user_type : "member"
/// firebase_uid : "Undg0qwkkDSa8uZO61W701ghtT23"
/// avatar : null
/// phone : "+970592877046"
/// otp : "304360"
/// age : null
/// contacts : "[\"+972597250522\",\"+970592877046\"]"
/// email : null

class UserData {
  UserData({
    num? id,
    String? name,
    dynamic emailVerifiedAt,
    dynamic provider,
    dynamic providerId,
    String? createdAt,
    String? updatedAt,
    String? userType,
    String? fcm_token,
    String? firebaseUid,
    dynamic avatar,
    String? phone,
    String? otp,
    dynamic age,
    String? contacts,
    dynamic email,
  }) {
    _id = id;
    _name = name;
    _emailVerifiedAt = emailVerifiedAt;
    _provider = provider;
    _providerId = providerId;
    _createdAt = createdAt;
    _fcm_token = fcm_token;
    _updatedAt = updatedAt;
    _userType = userType;
    _firebaseUid = firebaseUid;
    _avatar = avatar;
    _phone = phone;
    _otp = otp;
    _age = age;
    _contacts = contacts;
    _email = email;
  }

  UserData.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _emailVerifiedAt = json['email_verified_at'];
    _provider = json['provider'];
    _providerId = json['provider_id'];
    _createdAt = json['created_at'];
    _fcm_token = json['fcm_token'];
    _updatedAt = json['updated_at'];
    _userType = json['user_type'];
    _firebaseUid = json['firebase_uid'];
    _avatar = json['avatar'];
    _phone = json['phone'];
    _otp = json['otp'];
    _age = json['age'];
    _contacts = json['contacts'];
    _email = json['email'];
  }
  num? _id;
  String? _name;
  dynamic _emailVerifiedAt;
  dynamic _provider;
  dynamic _providerId;
  String? _createdAt;
  String? _updatedAt;
  String? _fcm_token;
  String? _userType;
  String? _firebaseUid;
  dynamic _avatar;
  String? _phone;
  String? _otp;
  dynamic _age;
  String? _contacts;
  dynamic _email;
  UserData copyWith({
    num? id,
    String? name,
    dynamic emailVerifiedAt,
    dynamic provider,
    dynamic providerId,
    String? createdAt,
    String? updatedAt,
    String? userType,
    String? fcm_token,
    String? firebaseUid,
    dynamic avatar,
    String? phone,
    String? otp,
    dynamic age,
    String? contacts,
    dynamic email,
  }) =>
      UserData(
        id: id ?? _id,
        name: name ?? _name,
        emailVerifiedAt: emailVerifiedAt ?? _emailVerifiedAt,
        provider: provider ?? _provider,
        providerId: providerId ?? _providerId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        userType: userType ?? _userType,
        fcm_token: fcm_token ?? _fcm_token,
        firebaseUid: firebaseUid ?? _firebaseUid,
        avatar: avatar ?? _avatar,
        phone: phone ?? _phone,
        otp: otp ?? _otp,
        age: age ?? _age,
        contacts: contacts ?? _contacts,
        email: email ?? _email,
      );
  num? get id => _id;
  String? get name => _name;
  dynamic get emailVerifiedAt => _emailVerifiedAt;
  dynamic get provider => _provider;
  dynamic get providerId => _providerId;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  String? get userType => _userType;
  String? get firebaseUid => _firebaseUid;
  dynamic get avatar => _avatar;
  String? get phone => _phone;
  String? get fcm_token => _fcm_token;
  String? get otp => _otp;
  dynamic get age => _age;
  String? get contacts => _contacts;
  dynamic get email => _email;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email_verified_at'] = _emailVerifiedAt;
    map['provider'] = _provider;
    map['provider_id'] = _providerId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['user_type'] = _userType;
    map['firebase_uid'] = _firebaseUid;
    map['avatar'] = _avatar;
    map['phone'] = _phone;
    map['otp'] = _otp;
    map['age'] = _age;
    map['contacts'] = _contacts;
    map['email'] = _email;
    return map;
  }
}

/// users_id : [1,3]
/// firebaseIds : {"receiver":"Undg0qwkkDSa8uZO61W701ghtT23","sender":"0whsoBu5wbOkAHwmFRFSfuWJ1nQ2"}
/// lastMessageId : " "
/// type : "peer"
/// created_by : 3
/// participants : {"1":true,"3":true}
/// updatedAt : "2023-07-24T20:16:30.538000Z"

class Data {
  Data({
    List<num>? usersId,
    FirebaseIds? firebaseIds,
    String? lastMessageId,
    String? type,
    num? createdBy,
    String? updatedAt,
  }) {
    _usersId = usersId;
    _firebaseIds = firebaseIds;
    _lastMessageId = lastMessageId;
    _type = type;
    _createdBy = createdBy;
    _updatedAt = updatedAt;
  }

  Data.fromJson(dynamic json) {
    _usersId = json['users_id'] != null ? json['users_id'].cast<num>() : [];
    _firebaseIds =
        json['firebaseIds'] != null ? FirebaseIds.fromJson(json['firebaseIds']) : null;
    _lastMessageId = json['lastMessageId'];
    _type = json['type'];
    _createdBy = json['created_by'];
    _updatedAt = json['updatedAt'];
  }
  List<num>? _usersId;
  FirebaseIds? _firebaseIds;
  String? _lastMessageId;
  String? _type;
  num? _createdBy;
  String? _updatedAt;
  Data copyWith({
    List<num>? usersId,
    FirebaseIds? firebaseIds,
    String? lastMessageId,
    String? type,
    num? createdBy,
    String? updatedAt,
  }) =>
      Data(
        usersId: usersId ?? _usersId,
        firebaseIds: firebaseIds ?? _firebaseIds,
        lastMessageId: lastMessageId ?? _lastMessageId,
        type: type ?? _type,
        createdBy: createdBy ?? _createdBy,
        updatedAt: updatedAt ?? _updatedAt,
      );
  List<num>? get usersId => _usersId;
  FirebaseIds? get firebaseIds => _firebaseIds;
  String? get lastMessageId => _lastMessageId;
  String? get type => _type;
  num? get createdBy => _createdBy;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['users_id'] = _usersId;
    if (_firebaseIds != null) {
      map['firebaseIds'] = _firebaseIds?.toJson();
    }
    map['lastMessageId'] = _lastMessageId;
    map['type'] = _type;
    map['created_by'] = _createdBy;

    map['updatedAt'] = _updatedAt;
    return map;
  }
}

/// 1 : true
/// 3 : true

/// receiver : "Undg0qwkkDSa8uZO61W701ghtT23"
/// sender : "0whsoBu5wbOkAHwmFRFSfuWJ1nQ2"

class FirebaseIds {
  FirebaseIds({
    String? receiver,
    String? sender,
  }) {
    _receiver = receiver;
    _sender = sender;
  }

  FirebaseIds.fromJson(dynamic json) {
    _receiver = json['receiver'];
    _sender = json['sender'];
  }
  String? _receiver;
  String? _sender;
  FirebaseIds copyWith({
    String? receiver,
    String? sender,
  }) =>
      FirebaseIds(
        receiver: receiver ?? _receiver,
        sender: sender ?? _sender,
      );
  String? get receiver => _receiver;
  String? get sender => _sender;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['receiver'] = _receiver;
    map['sender'] = _sender;
    return map;
  }
}
