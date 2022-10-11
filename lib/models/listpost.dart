import 'package:apart_rent/models/apartment.dart';
import 'package:apart_rent/models/owner.dart';
import 'package:apart_rent/models/post_status.dart';
import 'package:apart_rent/models/post_type.dart';

class ListPost {
  int? postId;
  String? title;
  int? price;
  String? description;
  String? dateCreate;
  int? postStatusId;
  int? postTypeId;
  Apartment? apartment;
  int? apartmentId;

  ListPost(
      {this.postId,
      this.title,
      this.price,
      this.description,
      this.dateCreate,
      this.postStatusId,
      this.postTypeId,
      this.apartment,
      this.apartmentId,});

  ListPost.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    dateCreate = json['dateCreate'];
    postStatusId = json['postStatusId'];
    postTypeId = json['postTypeId'];
    apartment = json['apartment'] != null
        ? new Apartment.fromJson(json['apartment'])
        : null;
    apartmentId = json['apartmentId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['dateCreate'] = this.dateCreate;
    data['postStatusId'] = this.postStatusId;
    data['postTypeId'] = this.postTypeId;
    if (this.apartment != null) {
      data['apartment'] = this.apartment!.toJson();
    }
    data['apartmentId'] = this.apartmentId;
    return data;
  }
}