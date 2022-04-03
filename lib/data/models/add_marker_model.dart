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
  Markers? marker;

  Results({this.message, this.marker});

  Results.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    marker = json['marker'] != null ? Markers.fromJson(json['marker']) : null;
  }
}

class Markers {
  double? latitude;
  double? longitude;
  String? type;
  String? sId;

  Markers({this.latitude, this.longitude, this.type, this.sId});

  Markers.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    type = json['type'];
    sId = json['_id'];
  }
}
