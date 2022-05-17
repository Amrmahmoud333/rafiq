class LoginModel {
  bool? success;
  Results? results;
  Error? error;

  LoginModel({this.success, this.results, this.error});

  LoginModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }
}

class Results {
  String? message;
  User? user;
  String? accessToken;
  String? refreshToken;

  Results({this.message, this.user, this.accessToken, this.refreshToken});

  Results.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }
}

class User {
  String? userName;

  User({this.userName});

  User.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
  }
}

class Error {
  int? statusCode;
  String? name;
  String? message;
  String? stack;

  Error({this.statusCode, this.name, this.message, this.stack});

  Error.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    name = json['name'];
    message = json['message'];
    stack = json['stack'];
  }
}

class RequestLoginModel {
  String? userName;
  String? password;

  RequestLoginModel({this.userName, this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['emailOrUserName'] = userName;
    data['password'] = password;
    return data;
  }
}
