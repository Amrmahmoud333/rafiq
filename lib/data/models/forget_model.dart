class RequestForgetModel {
  String? emailOrUserName;

  RequestForgetModel.fromjson(Map<String, dynamic> json) {
    emailOrUserName = json['emailOrUserName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emailOrUserName'] = emailOrUserName;

    return data;
  }
}
