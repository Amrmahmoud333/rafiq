import 'package:flutter/widgets.dart';

class RegisterModel {
  bool? success;
  Results? results;
  Error? error;

  RegisterModel({this.success, this.results, this.error});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['success'] == false) {
      print('register model');
    }
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
    error = json['error'] != null ? Error.fromJson(json['error']) : null;
  }
}

class Results {
  String? message;

  Results({this.message});

  Results.fromJson(Map<String, dynamic> json) {
    message = json['message'];
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

class RequsetRegisterModel {
  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? password;
  String? confirmPassword;
  String? country;
  String? gender;
  String? dateOfBirth;

  RequsetRegisterModel({
    @required this.firstName,
    @required this.lastName,
    @required this.userName,
    @required this.email,
    @required this.password,
    @required this.confirmPassword,
    @required this.country,
    @required this.gender,
    @required this.dateOfBirth,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['userName'] = userName;
    data['email'] = email;
    data['password'] = password;
    data['confirmPassword'] = confirmPassword;
    data['country'] = country;
    data['gender'] = gender;
    data['dateOfBirth'] = dateOfBirth;
    return data;
  }
}
