class FindHotelsModel {
  bool? success;
  Results? results;

  FindHotelsModel({this.success, this.results});

  FindHotelsModel.fromJson(Map<String, dynamic> json) {
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
  String? url;
  String? hotelName;
  Checkin? checkin;
  Checkin? checkout;
  int? hotelId;
  double? reviewScore;
  String? reviewScoreWord;
  int? reviewNr;
  String? address;
  double? minTotalPrice;
  String? mainPhotoUrl;
  String? maxPhotoUrl;
  String? max1440PhotoUrl;

  Data(
      {this.url,
      this.hotelName,
      this.checkin,
      this.checkout,
      this.hotelId,
      this.reviewScore,
      this.reviewScoreWord,
      this.reviewNr,
      this.address,
      this.minTotalPrice,
      this.mainPhotoUrl,
      this.maxPhotoUrl,
      this.max1440PhotoUrl});

  Data.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    hotelName = json['hotel_name'];
    checkin =
        json['checkin'] != null ?  Checkin.fromJson(json['checkin']) : null;
    checkout = json['checkout'] != null
        ?  Checkin.fromJson(json['checkout'])
        : null;
    hotelId = json['hotel_id'];
    reviewScore = json['review_score'];
    reviewScoreWord = json['review_score_word'];
    reviewNr = json['review_nr'];
    address = json['address'];
    minTotalPrice = json['min_total_price'];
    mainPhotoUrl = json['main_photo_url'];
    maxPhotoUrl = json['max_photo_url'];
    max1440PhotoUrl = json['max_1440_photo_url'];
  }

 
}

class Checkin {
  String? until;
  String? from;

  Checkin({this.until, this.from});

  Checkin.fromJson(Map<String, dynamic> json) {
    until = json['until'];
    from = json['from'];
  }

 
}