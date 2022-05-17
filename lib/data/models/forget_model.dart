class RequestForgetModel {
  RequestForgetModel(this.emailOrUserName);
  String? emailOrUserName;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['emailOrUserName'] = emailOrUserName;

    return data;
  }
}
