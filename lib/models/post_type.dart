class PostType {
  int? postTypeId;
  String? typeDescription;
  String? post;

  PostType({this.postTypeId, this.typeDescription, this.post});

  PostType.fromJson(Map<String, dynamic> json) {
    postTypeId = json['postTypeId'];
    typeDescription = json['typeDescription'];
    post = json['post'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postTypeId'] = this.postTypeId;
    data['typeDescription'] = this.typeDescription;
    data['post'] = this.post;
    return data;
  }
}