class Notificationn {
  final int id;
  final String title;
  final String description;
  final String time;

  const Notificationn({
    required this.id,
    required this.title,
    required this.description,
    required this.time
  });

  factory Notificationn.fromJson(Map<String, dynamic> json) {
    return Notificationn(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      time: json['time']
    );
  }
}