class PostLikeModel {
  bool? success;
  Results? results;

  PostLikeModel({this.success, this.results});

  PostLikeModel.fromJson(Map<String, dynamic> json) {
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
