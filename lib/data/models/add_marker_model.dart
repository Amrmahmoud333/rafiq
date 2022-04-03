class AddMarkRequestModel {
  String? type;
  double? latitude;
  double? longitude;

  AddMarkRequestModel({this.type, this.latitude, this.longitude});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}

class AddMarkResponseModel {
  bool? success;
  Results? results;

  AddMarkResponseModel({this.success, this.results});

  AddMarkResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }
}

class Results {
  String? message;
  Marker? marker;

  Results({this.message, this.marker});

  Results.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    marker = json['marker'] != null ? Marker.fromJson(json['marker']) : null;
  }
}

class Marker {
  double? latitude;
  double? longitude;
  String? type;
  String? sId;

  Marker({this.latitude, this.longitude, this.type, this.sId});

  Marker.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    type = json['type'];
    sId = json['_id'];
  }
}
