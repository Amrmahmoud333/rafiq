class SetCoverModel {
  bool? success;
  Results? results;

  SetCoverModel({this.success, this.results});

  SetCoverModel.fromJson(Map<String, dynamic> json) {
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

class SetAvatarModel {
  bool? success;
  ResultsAvatar? results;

  SetAvatarModel({this.success, this.results});

  SetAvatarModel.fromJson(Map<String, dynamic> json) {
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
