class RentPost{
  final int id;
  final String title;
  final String price;
  final String area;
  final int numBedroom;
  final int numBathroom;
  final String directHouse;
  final String directBalcony;
  final String furniture;
  final String postDay;
  final String city;
  final String district;
  final String commune;
  final String street;
  final String description;
  final String time;
  final String imgUrl;
  final String imgLocationUrl;

  const RentPost({
    required this.id, 
    required this.title, 
    required this.price, 
    required this.area, 
    required this.numBedroom, 
    required this.numBathroom, 
    required this.directHouse,
    required this.directBalcony,
    required this.furniture,
    required this.postDay,
    required this.city,
    required this.district,
    required this.commune,
    required this.street,
    required this.description, 
    required this.time, 
    required this.imgUrl, 
    required this.imgLocationUrl
  });

  factory RentPost.fromJson(Map<String, dynamic> json){
    return RentPost(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      area: json['area'],
      numBedroom: json['numBedroom'],
      numBathroom: json['numBathroom'],
      directHouse: json['directHouse'],
      directBalcony: json['directBalcony'],
      furniture: json['furniture'],
      postDay: json['postDay'],
      city: json['city'],
      district: json['district'],
      commune: json['commune'],
      street: json['street'],
      description: json['description'],
      time: json['time'],
      imgUrl: json['imgUrl'],
      imgLocationUrl: json['imgLocationUrl']
    );
  }
}