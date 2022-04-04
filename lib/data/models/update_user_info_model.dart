class UpdateUserInfoReqModel {
  String? firstName;
  String? lastName;
  String? country;
  String? dateOfBirth;
  String? gender;
  String? liveIn;
  List<SocialMedia>? socialMedia;

  UpdateUserInfoReqModel(
      {this.firstName,
      this.lastName,
      this.country,
      this.dateOfBirth,
      this.gender,
      this.liveIn,
      this.socialMedia});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['country'] = country;
    data['dateOfBirth'] = dateOfBirth;
    data['gender'] = gender;
    data['liveIn'] = liveIn;
    if (socialMedia != null) {
      data['socialMedia'] = socialMedia!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SocialMedia {
  String? userName;
  String? label;

  SocialMedia({this.userName, this.label});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = userName;
    data['label'] = label;
    return data;
  }
}

// response

class UpdateUserInfoResModel {
  bool? success;
  Results? results;

  UpdateUserInfoResModel({this.success, this.results});

  UpdateUserInfoResModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }
}

class Results {
  String? message;

  Results({this.message});

  Results.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }
}
