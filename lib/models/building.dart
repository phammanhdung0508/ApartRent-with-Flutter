class Building {
  int? buildingId;
  String? buildingName;
  String? corporationName;
  String? location;
  String? buildingImgUrl;
  String? locationImgUrl;
  List<String>? apartments;

  Building(
      {this.buildingId,
      this.buildingName,
      this.corporationName,
      this.location,
      this.buildingImgUrl,
      this.locationImgUrl,
      this.apartments});

  Building.fromJson(Map<String, dynamic> json) {
    buildingId = json['buildingId'];
    buildingName = json['buildingName'];
    corporationName = json['corporationName'];
    location = json['location'];
    buildingImgUrl = json['buildingImgUrl'];
    locationImgUrl = json['locationImgUrl'];
    apartments = json['apartments'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['buildingId'] = this.buildingId;
    data['buildingName'] = this.buildingName;
    data['corporationName'] = this.corporationName;
    data['location'] = this.location;
    data['buildingImgUrl'] = this.buildingImgUrl;
    data['locationImgUrl'] = this.locationImgUrl;
    data['apartments'] = this.apartments;
    return data;
  }
}