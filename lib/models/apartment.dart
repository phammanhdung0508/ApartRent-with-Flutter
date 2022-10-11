import 'package:apart_rent/models/building.dart';

class Apartment {
  int? apartmentId;
  double? area;
  int? numberOfBedroom;
  int? numberOfBathroom;
  String? houseDirection;
  String? balconyDirection;
  String? legalInformation;
  String? apartmentImgUrl;
  String? post;
  Building? building;
  int? buildingId;

  Apartment(
      {this.apartmentId,
      this.area,
      this.numberOfBedroom,
      this.numberOfBathroom,
      this.houseDirection,
      this.balconyDirection,
      this.legalInformation,
      this.apartmentImgUrl,
      this.post,
      this.building,
      this.buildingId});

  Apartment.fromJson(Map<String, dynamic> json) {
    apartmentId = json['apartmentId'];
    area = json['area'] == null ? 0.0 : json['area'].toDouble();
    numberOfBedroom = json['numberOfBedroom'];
    numberOfBathroom = json['numberOfBathroom'];
    houseDirection = json['houseDirection'];
    balconyDirection = json['balconyDirection'];
    legalInformation = json['legalInformation'];
    apartmentImgUrl = json['apartmentImgUrl'];
    post = json['post'];
    building = json['building'] != null
        ? new Building.fromJson(json['building'])
        : null;
    buildingId = json['buildingId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apartmentId'] = this.apartmentId;
    data['area'] = this.area;
    data['numberOfBedroom'] = this.numberOfBedroom;
    data['numberOfBathroom'] = this.numberOfBathroom;
    data['houseDirection'] = this.houseDirection;
    data['balconyDirection'] = this.balconyDirection;
    data['legalInformation'] = this.legalInformation;
    data['apartmentImgUrl'] = this.apartmentImgUrl;
    data['post'] = this.post;
    if (this.building != null) {
      data['building'] = this.building!.toJson();
    }
    data['buildingId'] = this.buildingId;
    return data;
  }
}