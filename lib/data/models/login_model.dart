class LoginModel {
  bool? success;
  LoginSuccess? loginSuccess;
  LoginError? loginError;
  LoginModel({this.success, this.loginSuccess});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if(success = json['success'] == false){
      loginError = json['error'] != null ?  LoginError.fromJson(json['error']) : null;
    }else{
        loginSuccess = json['results'] != null
        ?  LoginSuccess.fromJson(json['results'])
        : null;
    }
    
   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] =success;
    if (loginSuccess != null) {
      data['results'] = loginSuccess!.toJson();
    }
    return data;
  }
}

class LoginError {
  int? statusCode;
  String? name;
  String? message;
  String? stack;

  LoginError({this.statusCode, this.name, this.message, this.stack});

  LoginError.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    name = json['name'];
    message = json['message'];
    stack = json['stack'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = statusCode;
    data['name'] = name;
    data['message'] = message;
    data['stack'] = stack;
    return data;
  }
}
class LoginSuccess {
  String? message;
  User? user;
  String? accessToken;
  String? refreshToken;

  LoginSuccess({this.message, this.user, this.accessToken, this.refreshToken});

  LoginSuccess.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ?  User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = message;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['accessToken'] = accessToken;
    data['refreshToken'] = refreshToken;
    return data;
  }
}

class User {
  String? userName;

  User({this.userName});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = userName;
    return data;
  }
}
