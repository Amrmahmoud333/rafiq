class AddPostModel {
  bool? success;
  Results? results;

  AddPostModel({this.success, this.results});

  AddPostModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }
}

class Results {
  String? message;

  Results({this.message});

  Results.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
