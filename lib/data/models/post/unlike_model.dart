class UnlikeModel {
  bool? success;
  Results? results;

  UnlikeModel({this.success, this.results});

  UnlikeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }
}

class Results {
  int? numberOfLikes;

  Results({this.numberOfLikes});

  Results.fromJson(Map<String, dynamic> json) {
    numberOfLikes = json['numberOfLikes'];
  }
}
