import 'package:apart_rent/models/apartment.dart';
import 'package:apart_rent/models/owner.dart';
import 'package:apart_rent/models/post_status.dart';
import 'package:apart_rent/models/post_type.dart';

class Post {
  int? postId;
  String? title;
  int? price;
  String? description;
  String? dateCreate;
  PostStatus? postStatus;
  int? postStatusId;
  PostType? postType;
  int? postTypeId;
  Apartment? apartment;
  int? apartmentId;
  Owner? owner;
  int? ownerId;

  Post(
      {this.postId,
      this.title,
      this.price,
      this.description,
      this.dateCreate,
      this.postStatus,
      this.postStatusId,
      this.postType,
      this.postTypeId,
      this.apartment,
      this.apartmentId,
      this.owner,
      this.ownerId});

  Post.fromJson(Map<String, dynamic> json) {
    postId = json['postId'];
    title = json['title'];
    price = json['price'];
    description = json['description'];
    dateCreate = json['dateCreate'];
    postStatus = json['postStatus'] != null
        ? new PostStatus.fromJson(json['postStatus'])
        : null;
    postStatusId = json['postStatusId'];
    postType = json['postType'] != null
        ? new PostType.fromJson(json['postType'])
        : null;
    postTypeId = json['postTypeId'];
    apartment = json['apartment'] != null
        ? new Apartment.fromJson(json['apartment'])
        : null;
    apartmentId = json['apartmentId'];
    owner = json['owner'] != null ? new Owner.fromJson(json['owner']) : null;
    ownerId = json['ownerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postId'] = this.postId;
    data['title'] = this.title;
    data['price'] = this.price;
    data['description'] = this.description;
    data['dateCreate'] = this.dateCreate;
    if (this.postStatus != null) {
      data['postStatus'] = this.postStatus!.toJson();
    }
    data['postStatusId'] = this.postStatusId;
    if (this.postType != null) {
      data['postType'] = this.postType!.toJson();
    }
    data['postTypeId'] = this.postTypeId;
    if (this.apartment != null) {
      data['apartment'] = this.apartment!.toJson();
    }
    data['apartmentId'] = this.apartmentId;
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    data['ownerId'] = this.ownerId;
    return data;
  }
}