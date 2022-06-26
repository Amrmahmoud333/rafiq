class ActivitiesModel {
  bool? success;
  Results? results;

  ActivitiesModel({this.success, this.results});

  ActivitiesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }
}

class Results {
  List<Data>? data;

  Results({this.data});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }
}

class Data {
  String? id;
  String? type;
  String? name;
  String? shortDescription;
  GeoCode? geoCode;
  String? rating;
  List<String>? pictures;
  String? bookingLink;
  Price? price;

  Data(
      {this.id,
      this.type,
      this.name,
      this.shortDescription,
      this.geoCode,
      this.rating,
      this.pictures,
      this.bookingLink,
      this.price});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    name = json['name'];
    shortDescription = json['shortDescription'];
    geoCode =
        json['geoCode'] != null ? GeoCode.fromJson(json['geoCode']) : null;
    rating = json['rating'];
    pictures = json['pictures'].cast<String>();
    bookingLink = json['bookingLink'];
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
  }
}

class GeoCode {
  String? latitude;
  String? longitude;

  GeoCode({this.latitude, this.longitude});

  GeoCode.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }
}

class Price {
  String? currencyCode;
  String? amount;

  Price({this.currencyCode, this.amount});

  Price.fromJson(Map<String, dynamic> json) {
    currencyCode = json['currencyCode'];
    amount = json['amount'];
  }
}
