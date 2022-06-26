class CityInformationModel {
  bool? success;
  Results? results;

  CityInformationModel({this.success, this.results});

  CityInformationModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }
}

class Results {
  String? sId;
  String? firstName;
  String? lastName;
  List<String>? images;
  Location? location;
  String? timeZone;
  Country? country;
  int? iV;

  Results(
      {this.sId,
      this.firstName,
      this.lastName,
      this.images,
      this.location,
      this.timeZone,
      this.country,
      this.iV});

  Results.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    images = json['images'].cast<String>();
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    timeZone = json['timeZone'];
    country =
        json['country'] != null ? Country.fromJson(json['country']) : null;
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

class Country {
  Language? language;
  Currency? currency;
  String? sId;
  String? name;
  String? flag;
  String? capital;
  String? region;
  EmergencyNumbers? emergencyNumbers;
  int? iV;

  Country(
      {this.language,
      this.currency,
      this.sId,
      this.name,
      this.flag,
      this.capital,
      this.region,
      this.emergencyNumbers,
      this.iV});

  Country.fromJson(Map<String, dynamic> json) {
    language =
        json['language'] != null ? Language.fromJson(json['language']) : null;
    currency =
        json['currency'] != null ? Currency.fromJson(json['currency']) : null;
    sId = json['_id'];
    name = json['name'];
    flag = json['flag'];
    capital = json['capital'];
    region = json['region'];
    emergencyNumbers = json['emergencyNumbers'] != null
        ? EmergencyNumbers.fromJson(json['emergencyNumbers'])
        : null;
    iV = json['__v'];
  }
}

class Language {
  String? code;
  String? name;

  Language({this.code, this.name});

  Language.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }
}

class Currency {
  String? code;
  String? name;
  String? symbol;

  Currency({this.code, this.name, this.symbol});

  Currency.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    symbol = json['symbol'];
  }
}

class EmergencyNumbers {
  List<String>? police;
  List<String>? ambulance;
  List<String>? fire;
  String? sId;

  EmergencyNumbers({this.police, this.ambulance, this.fire, this.sId});

  EmergencyNumbers.fromJson(Map<String, dynamic> json) {
    police = json['police'].cast<String>();
    ambulance = json['ambulance'].cast<String>();
    fire = json['fire'].cast<String>();
    sId = json['_id'];
  }
}
