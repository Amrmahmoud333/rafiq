class SearchPlaceModel {
  bool? success;
  Results? results;

  SearchPlaceModel({this.success, this.results});

  SearchPlaceModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    results =
        json['results'] != null ? new Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
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
        suggestions!.add(new Suggestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.suggestions != null) {
      data['suggestions'] = this.suggestions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Suggestions {
  Location? location;
  int? numberOfFollowers;
  String? sId;
  String? firstName;
  String? lastName;
  String? asciiName;
  String? nativeName;
  List<Null>? images;
  Null? timeZone;
  String? country;
  List<Null>? admins;
  int? population;
  int? iV;

  Suggestions(
      {this.location,
      this.numberOfFollowers,
      this.sId,
      this.firstName,
      this.lastName,
      this.asciiName,
      this.nativeName,
      this.images,
      this.timeZone,
      this.country,
      this.admins,
      this.population,
      this.iV});

  Suggestions.fromJson(Map<String, dynamic> json) {
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    numberOfFollowers = json['numberOfFollowers'];
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    asciiName = json['ascii_name'];
    nativeName = json['native_name'];
    if (json['images'] != null) {
      images = <Null>[];
      json['images'].forEach((v) {
        images!.add(new Null.fromJson(v));
      });
    }
    timeZone = json['timeZone'];
    country = json['country'];
    if (json['admins'] != null) {
      admins = <Null>[];
      json['admins'].forEach((v) {
        admins!.add(new Null.fromJson(v));
      });
    }
    population = json['population'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.location != null) {
      data['location'] = this.location!.toJson();
    }
    data['numberOfFollowers'] = this.numberOfFollowers;
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['ascii_name'] = this.asciiName;
    data['native_name'] = this.nativeName;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['timeZone'] = this.timeZone;
    data['country'] = this.country;
    if (this.admins != null) {
      data['admins'] = this.admins!.map((v) => v.toJson()).toList();
    }
    data['population'] = this.population;
    data['__v'] = this.iV;
    return data;
  }
}

class Location {
  double? latitude;
  double? longitude;

  Location({this.latitude, this.longitude});

  Location.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}