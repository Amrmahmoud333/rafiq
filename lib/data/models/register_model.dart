class RegisterModel {
  bool? success;
  RegistError? status;
  Registsuccess? registsuccess;
  RegisterModel({this.success, this.status ,this.registsuccess});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    success = json['success'] == true ?  : {};
    status = json['error'] != null ? RegistError.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    if (status != null) {
      data['error'] = status!.toJson();
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
