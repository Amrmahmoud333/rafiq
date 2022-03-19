class UpdateCoverModel {
  bool? success;
  Results? results;

  UpdateCoverModel({this.success, this.results});

  UpdateCoverModel.fromJson(Map<String, dynamic> json) {
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
