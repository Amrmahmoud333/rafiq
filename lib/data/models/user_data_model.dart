class UserDataModel {
  bool? success;
  Results? results;

  UserDataModel({this.success, this.results});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
  }
}

class Results {
  int? numberOfFollowers;
  int? numberOfFollowings;
  String? firstName;
  String? lastName;
  String? userName;
  String? country;
  String? dateOfBirth;
  String? gender;
  String? avatar;
  String? cover;

  Results(
      {this.numberOfFollowers,
      this.numberOfFollowings,
      this.firstName,
      this.lastName,
      this.userName,
      this.country,
      this.dateOfBirth,
      this.gender,
      this.avatar,
      this.cover});

  Results.fromJson(Map<String, dynamic> json) {
    numberOfFollowers = json['numberOfFollowers'];
    numberOfFollowings = json['numberOfFollowings'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    country = json['country'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    avatar = json['avatar'];
    cover = json['cover'];
  }
}
