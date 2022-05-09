class DeletePostModel {
  bool? success;
  Resulte? resulte;
  DeletePostModel.fromjson(Map<String, dynamic> json) {
    success = json['success'];
    resulte =
        json['resulte'] != null ? Resulte.fromjson(json['resulte']) : null;
  }
}

class Resulte {
  String? message;
  Resulte.fromjson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
