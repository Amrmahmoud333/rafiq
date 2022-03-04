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
