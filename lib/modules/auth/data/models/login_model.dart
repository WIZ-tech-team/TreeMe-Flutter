/// success : true
/// token : {"api_token":"270|xPQFfhRti8Cf04wLbav2oZflsjDCc7NB3DMb7Txa"}
/// message : "User login successfully."
/// user_id : 145
/// status : 200

class LoginModel {
  LoginModel({
      bool? success, 
      Token? token, 
      String? message, 
      num? userId, 
      num? status,}){
    _success = success;
    _token = token;
    _message = message;
    _userId = userId;
    _status = status;
}

  LoginModel.fromJson(dynamic json) {
    _success = json['success'];
    _token = json['token'] != null ? Token.fromJson(json['token']) : null;
    _message = json['message'];
    _userId = json['user_id'];
    _status = json['status'];
  }
  bool? _success;
  Token? _token;
  String? _message;
  num? _userId;
  num? _status;
LoginModel copyWith({  bool? success,
  Token? token,
  String? message,
  num? userId,
  num? status,
}) => LoginModel(  success: success ?? _success,
  token: token ?? _token,
  message: message ?? _message,
  userId: userId ?? _userId,
  status: status ?? _status,
);
  bool? get success => _success;
  Token? get token => _token;
  String? get message => _message;
  num? get userId => _userId;
  num? get status => _status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    if (_token != null) {
      map['token'] = _token?.toJson();
    }
    map['message'] = _message;
    map['user_id'] = _userId;
    map['status'] = _status;
    return map;
  }

}

/// api_token : "270|xPQFfhRti8Cf04wLbav2oZflsjDCc7NB3DMb7Txa"

class Token {
  Token({
      String? apiToken,}){
    _apiToken = apiToken;
}

  Token.fromJson(dynamic json) {
    _apiToken = json['api_token'];
  }
  String? _apiToken;
Token copyWith({  String? apiToken,
}) => Token(  apiToken: apiToken ?? _apiToken,
);
  String? get apiToken => _apiToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['api_token'] = _apiToken;
    return map;
  }

}