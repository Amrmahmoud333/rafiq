import 'package:flutter/widgets.dart';

class RegisterModel {
  bool? success;
  RegistError? registError;
  Registsuccess? registsuccess;
  RegisterModel({this.success, this.registError, this.registsuccess});

  // because there is different in second parameter in response
  // can be 'error' that contan 4 arument
  // or results that contan onlu massege
  RegisterModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];

    if (success = json['success'] == true) {
      if (json['results'] != null) {
        Registsuccess.fromJson(json['results']);
      } else {
        json['results'] == null;
      }
    } else {
      if (json['error'] != null) {
        RegistError.fromJson(json['error']);
      } else {
        json['error'] == null;
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    if (registError != null) {
      data['error'] = registError!.toJson();
    }
    return data;
  }
}

class Registsuccess {
  String? message;

  Registsuccess({this.message});

  Registsuccess.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['message'] = message;
    return data;
  }
}

class RegistError {
  int? statusCode;
  String? name;
  String? message;
  String? stack;

  RegistError({this.statusCode, this.name, this.message, this.stack});

  RegistError.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    name = json['name'];
    message = json['message'];
    stack = json['stack'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['statusCode'] = statusCode;
    data['name'] = name;
    data['message'] = message;
    data['stack'] = stack;
    return data;
  }
}

class AuthRequsetModel {
  String firstName = "amr";
  String lastName = "amr";
  String userName = 'SAmdsaldksad';
  String email = "AmrMahmoudfdsf@gmail.com";
  String password = "password";
  String confirmPassword = "password";
  String country = "Egypt";
  String gender = 'male';
  String dateOfBirth = "2002-12-09";

  AuthRequsetModel();

  AuthRequsetModel.fromJson(Map<String, dynamic> json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    confirmPassword = json['confirmPassword'];
    country = json['country'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
