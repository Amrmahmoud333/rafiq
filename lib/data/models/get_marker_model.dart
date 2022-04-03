class GetMarkerResponseModel {
  bool? success;
  Results? results;

  GetMarkerResponseModel({this.success, this.results});

  GetMarkerResponseModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    results =
        json['results'] != null ? Results.fromJson(json['results']) : null;
  }
}

class Results {
  List<TravelMap>? travelMap;

  Results({this.travelMap});

  Results.fromJson(Map<String, dynamic> json) {
    if (json['travelMap'] != null) {
      travelMap = <TravelMap>[];
      json['travelMap'].forEach((v) {
        travelMap!.add(TravelMap.fromJson(v));
      });
    }
  }
}

class TravelMap {
  double? latitude;
  double? longitude;
  String? type;
  String? sId;

  TravelMap({this.latitude, this.longitude, this.type, this.sId});

  TravelMap.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    type = json['type'];
    sId = json['_id'];
  }
}
