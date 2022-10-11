class Owner {
  int? ownerId;
  String? name;
  String? phone;
  String? email;
  String? ownerImgUrl;
  List<String>? posts;

  Owner(
      {this.ownerId,
      this.name,
      this.phone,
      this.email,
      this.ownerImgUrl,
      this.posts});

  Owner.fromJson(Map<String, dynamic> json) {
    ownerId = json['ownerId'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    ownerImgUrl = json['ownerImgUrl'];
    posts = json['posts'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ownerId'] = this.ownerId;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['ownerImgUrl'] = this.ownerImgUrl;
    data['posts'] = this.posts;
    return data;
  }
}