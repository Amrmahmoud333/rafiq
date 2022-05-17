class UserDataModel {
  bool? success;
  Results? results;

  UserDataModel({this.success, this.results});

  UserDataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }
}

class Results {
  int? numberOfFollowings;
  String? firstName;
  String? lastName;
  String? userName;
  String? country;
  String? dateOfBirth;
  String? gender;
  String? cover;
  String? avatar;
  int? numberOfFollowers;
  String? liveIn;
  List<SocialMedia>? socialMedia;

  Results(
      {this.numberOfFollowings,
      this.firstName,
      this.lastName,
      this.userName,
      this.country,
      this.dateOfBirth,
      this.gender,
      this.cover,
      this.avatar,
      this.numberOfFollowers,
      this.liveIn,
      this.socialMedia});

  Results.fromJson(Map<String, dynamic> json) {
    numberOfFollowings = json['numberOfFollowings'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    country = json['country'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    cover = json['cover'];
    avatar = json['avatar'];
    numberOfFollowers = json['numberOfFollowers'];
    liveIn = json['liveIn'];
    if (json['socialMedia'] != null) {
      socialMedia = <SocialMedia>[];
      json['socialMedia'].forEach((v) {
        socialMedia!.add(SocialMedia.fromJson(v));
      });
    }
  }
}

class SocialMedia {
  String? userName;
  String? label;
  String? sId;
  String? link;
  String? id;

  SocialMedia({this.userName, this.label, this.sId, this.link, this.id});

  SocialMedia.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    label = json['label'];
    sId = json['_id'];
    link = json['link'];
    id = json['id'];
  }
}
