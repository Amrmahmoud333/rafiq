// Image --> files

class SearchPlaceModel {
  bool? success;
  Results? results;

  SearchPlaceModel({this.success, this.results});

  SearchPlaceModel.fromJson(Map<String, dynamic> json) {
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
  Location? location;
  int? numberOfFollowers;
  String? sId;
  String? firstName;
  String? lastName;
  String? asciiName;
  String? nativeName;
  List<String>? images;
  String? timeZone;
  String? country;
  List<String>? admins;
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
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    numberOfFollowers = json['numberOfFollowers'];
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    asciiName = json['ascii_name'];
    nativeName = json['native_name'];
    images = json['images'].cast<String>();
    timeZone = json['timeZone'];
    country = json['country'];
    admins = json['admins'].cast<String>();
    population = json['population'];
    iV = json['__v'];
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
}
