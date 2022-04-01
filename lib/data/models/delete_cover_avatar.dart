class DeleteCoverModel {
  bool? success;
  ResultsCover? results;
  DeleteCoverModel.fromjson(Map<String, dynamic> json) {
    success = json['success'];
    results =
        json['results'] != null ? ResultsCover.fromjson(json['results']) : null;
  }
}

class ResultsCover {
  String? message;
  ResultsCover.fromjson(Map<String, dynamic> json) {
    message = json['message'];
  }
}

class DeleteAvatarModel {
  bool? success;
  ResultsAvatar? results;
  DeleteAvatarModel.fromjson(Map<String, dynamic> json) {
    success = json['success'];
    results = json['results'] != null
        ? ResultsAvatar.fromjson(json['results'])
        : null;
  }
}

class ResultsAvatar {
  String? message;
  ResultsAvatar.fromjson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
