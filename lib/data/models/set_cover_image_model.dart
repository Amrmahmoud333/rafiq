class setCoverModel {
  bool? success;
  Results? results;

  setCoverModel({this.success, this.results});

  setCoverModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
  }
}

class Results {
  String? cover;

  Results({this.cover});

  Results.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
  }
}

class setAvatarModel {
  bool? success;
  ResultsAvatar? results;

  setAvatarModel({this.success, this.results});

  setAvatarModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    results = json['results'] != null
        ? new ResultsAvatar.fromJson(json['results'])
        : null;
  }
}

class ResultsAvatar {
  String? avatar;

  ResultsAvatar({this.avatar});

  ResultsAvatar.fromJson(Map<String, dynamic> json) {
    avatar = json['avatar'];
  }
}
