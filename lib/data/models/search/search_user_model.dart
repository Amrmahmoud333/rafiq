class SearchUserModel {
  bool? success;
  Results? results;

  SearchUserModel({this.success, this.results});

  SearchUserModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }
}

class Results {
  String? message;
  List<Suggestions>? suggestions;

  Results({this.message, this.suggestions});

  Results.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['suggestions'] != null) {
      suggestions = <Suggestions>[];
      json['suggestions'].forEach((v) {
        suggestions!.add(Suggestions.fromJson(v));
      });
    }
  }
}

class Suggestions {
  String? sId;
  String? firstName;
  String? lastName;
  String? userName;
  String? email;
  String? password;
  String? country;
  String? dateOfBirth;
  String? gender;
  String? resetToken;
  int? iV;
  bool? confirmed;
  String? cover;
  String? avatar;
  int? numberOfFollowers;
  String? liveIn;
  List<SocialMedia>? socialMedia;
  List<String>? posts;
  List<String>? newsFeed;
  int? numberOfFollowings;

  Suggestions(
      {this.sId,
      this.firstName,
      this.lastName,
      this.userName,
      this.email,
      this.password,
      this.country,
      this.dateOfBirth,
      this.gender,
      this.resetToken,
      this.iV,
      this.confirmed,
      this.cover,
      this.avatar,
      this.numberOfFollowers,
      this.liveIn,
      this.socialMedia,
      this.posts,
      this.newsFeed,
      this.numberOfFollowings});

  Suggestions.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    country = json['country'];
    dateOfBirth = json['dateOfBirth'];
    gender = json['gender'];
    resetToken = json['resetToken'];
    iV = json['__v'];
    confirmed = json['confirmed'];
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
    posts = json['posts'].cast<String>();
    newsFeed = json['newsFeed'].cast<String>();
    numberOfFollowings = json['numberOfFollowings'];
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
