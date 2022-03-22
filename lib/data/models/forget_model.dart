class RequestForgetModel {
  RequestForgetModel(this.emailOrUserName);
  String? emailOrUserName;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emailOrUserName'] = emailOrUserName;

    return data;
  }
}
