class IsLikeModel {
  bool? success;
  Results? results;

  IsLikeModel({this.success, this.results});

  IsLikeModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }
}

class Results {
  bool? isLiked;

  Results({this.isLiked});

  Results.fromJson(Map<String, dynamic> json) {
    isLiked = json['isLiked'];
  }
}
