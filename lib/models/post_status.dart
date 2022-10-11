class PostStatus {
  int? postStatusId;
  String? statusDescription;
  String? post;

  PostStatus({this.postStatusId, this.statusDescription, this.post});

  PostStatus.fromJson(Map<String, dynamic> json) {
    postStatusId = json['postStatusId'];
    statusDescription = json['statusDescription'];
    post = json['post'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postStatusId'] = this.postStatusId;
    data['statusDescription'] = this.statusDescription;
    data['post'] = this.post;
    return data;
  }
}