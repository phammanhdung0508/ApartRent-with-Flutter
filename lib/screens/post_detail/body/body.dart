import 'package:apart_rent/components/custom_detail_post_text.dart';
import 'package:apart_rent/components/custom_text.dart';
import 'package:apart_rent/constants.dart';
import 'package:apart_rent/models/post.dart';
import 'package:apart_rent/repository/api/api.dart';
import 'package:apart_rent/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatefulWidget {
  final int postId;
  const Body({Key? key, required this.postId}) : super(key: key);

  @override
  _Body createState() => _Body();
}

class _Body extends State<Body> {
  Future<Post>? futurePost;

  buildFutureData(BuildContext context) {
    return FutureBuilder<Post>(
      future: futurePost,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                (snapshot.data!.apartment!.apartmentImgUrl)
                                    .toString()),
                          ),
                        ),
                      ),
                      Positioned(
                        width: SizeConfig.screenWidth,
                        top: 180,
                        left: 350,
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50),
                                  ),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        offset: Offset(0, 4),
                                        blurRadius: 10),
                                  ],
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.edit,
                                    size: 25,
                                    color: kPrimaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getProportionateScreenWidth(10)),
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: getProportionateScreenHeight(10)),
                          CustomText(
                            text: (snapshot.data!.title).toString(),
                            size: 18,
                            color: Colors.black,
                            maxline: 3,
                          ),
                          SizedBox(height: getProportionateScreenWidth(5)),
                          CustomText(
                              text: ("${snapshot.data!.price} Triệu/Tháng")
                                  .toString(),
                              size: 18,
                              color: Colors.green,
                              maxline: 1),
                          SizedBox(height: getProportionateScreenWidth(20)),
                          const CustomText(
                              text: "Mô tả:",
                              size: 18,
                              color: Colors.black,
                              maxline: 1),
                          SizedBox(height: getProportionateScreenWidth(5)),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: CustomText(
                                text: (snapshot.data!.description).toString(),
                                size: 18,
                                color: Colors.black,
                                maxline: 30),
                          ),
                          SizedBox(height: getProportionateScreenWidth(20)),
                          const CustomText(
                              text: "Vị trí:",
                              size: 18,
                              color: Colors.black,
                              maxline: 1),
                          SizedBox(height: getProportionateScreenWidth(5)),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage((snapshot.data!.apartment!
                                        .building!.locationImgUrl)
                                    .toString()),
                              ),
                            ),
                          ),
                          SizedBox(height: getProportionateScreenWidth(20)),
                          const CustomText(
                              text: "Thông tin chi tiết:",
                              size: 18,
                              color: Colors.black,
                              maxline: 1),
                          SizedBox(height: getProportionateScreenWidth(5)),
                          Container(
                            margin: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                CustomDetailPostText(
                                    titleSection: "Loại bài đăng: ",
                                    titleSize: 17,
                                    titleColor: kSecondaryColor,
                                    contentSection: (snapshot
                                            .data!.postType!.typeDescription)
                                        .toString(),
                                    contentSize: 17,
                                    contentColor: Colors.black,
                                    maxline: 1),
                                CustomDetailPostText(
                                    titleSection: "Diện tích: ",
                                    titleSize: 17,
                                    titleColor: kSecondaryColor,
                                    contentSection:
                                        ("${snapshot.data!.apartment!.area} m²")
                                            .toString(),
                                    contentSize: 17,
                                    contentColor: Colors.black,
                                    maxline: 1),
                                SizedBox(
                                    height: getProportionateScreenWidth(2)),
                                CustomDetailPostText(
                                    titleSection: "Địa chỉ: ",
                                    titleSize: 17,
                                    titleColor: kSecondaryColor,
                                    contentSection:
                                        // "Đường ${snapshot.data!.street}, Phường ${snapshot.data!.commune}, ${snapshot.data!.district}, Thành phố ${snapshot.data!.city}",
                                        (snapshot.data!.apartment!.building!
                                                .location)
                                            .toString(),
                                    contentSize: 17,
                                    contentColor: Colors.black,
                                    maxline: 3),
                                SizedBox(
                                    height: getProportionateScreenWidth(2)),
                                CustomDetailPostText(
                                    titleSection: "Hướng nhà: ",
                                    titleSize: 17,
                                    titleColor: kSecondaryColor,
                                    contentSection: (snapshot
                                            .data!.apartment!.houseDirection)
                                        .toString(),
                                    contentSize: 17,
                                    contentColor: Colors.black,
                                    maxline: 1),
                                SizedBox(
                                    height: getProportionateScreenWidth(2)),
                                CustomDetailPostText(
                                    titleSection: "Hướng ban công: ",
                                    titleSize: 17,
                                    titleColor: kSecondaryColor,
                                    contentSection: (snapshot
                                            .data!.apartment!.balconyDirection)
                                        .toString(),
                                    contentSize: 17,
                                    contentColor: Colors.black,
                                    maxline: 1),
                                SizedBox(
                                    height: getProportionateScreenWidth(2)),
                                CustomDetailPostText(
                                    titleSection: "Số phòng ngủ: ",
                                    titleSize: 17,
                                    titleColor: kSecondaryColor,
                                    contentSection: (snapshot
                                            .data!.apartment!.numberOfBedroom)
                                        .toString(),
                                    contentSize: 17,
                                    contentColor: Colors.black,
                                    maxline: 1),
                                SizedBox(
                                    height: getProportionateScreenWidth(2)),
                                CustomDetailPostText(
                                    titleSection: "Số phòng vệ sinh: ",
                                    titleSize: 17,
                                    titleColor: kSecondaryColor,
                                    contentSection: (snapshot
                                            .data!.apartment!.numberOfBathroom)
                                        .toString(),
                                    contentSize: 17,
                                    contentColor: Colors.black,
                                    maxline: 1),
                              ],
                            ),
                          ),
                          SizedBox(height: getProportionateScreenWidth(20)),
                          const CustomText(
                              text: "Thông tin chung cư:",
                              size: 18,
                              color: Colors.black,
                              maxline: 1),
                          SizedBox(height: getProportionateScreenWidth(5)),
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 20.0,
                                    spreadRadius: 4.0)
                              ],
                            ),
                            child: Row(children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Container(
                                  width: 150,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage((snapshot
                                              .data!
                                              .apartment!
                                              .building!
                                              .buildingImgUrl)
                                          .toString()),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: (snapshot.data!.apartment!.building!
                                              .buildingName)
                                          .toString(),
                                      size: 21,
                                      color: Colors.blue,
                                      maxline: 2,
                                    ),
                                    CustomText(
                                      text: (snapshot.data!.apartment!.building!
                                              .corporationName)
                                          .toString(),
                                      size: 17,
                                      color: Colors.black,
                                      maxline: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                          SizedBox(height: getProportionateScreenWidth(20)),
                          const CustomText(
                              text: "Thông tin liên hệ:",
                              size: 18,
                              color: Colors.black,
                              maxline: 1),
                          SizedBox(height: getProportionateScreenWidth(5)),
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 20.0,
                                    spreadRadius: 4.0)
                              ],
                            ),
                            child: Row(children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 20),
                                child: SizedBox(
                                  height: 80,
                                  width: 80,
                                  child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      backgroundImage: snapshot
                                                  .data!.owner!.ownerImgUrl !=
                                              ""
                                          ? NetworkImage((snapshot
                                                  .data!.owner!.ownerImgUrl)
                                              .toString())
                                          : const NetworkImage(
                                              'https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png')),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: (snapshot.data!.owner!.name)
                                          .toString(),
                                      size: 18,
                                      color: Colors.black,
                                      maxline: 2,
                                    ),
                                    CustomText(
                                      text: (snapshot.data!.owner!.phone)
                                          .toString(),
                                      size: 18,
                                      color: Colors.black,
                                      maxline: 2,
                                    ),
                                    CustomText(
                                      text: (snapshot.data!.owner!.email)
                                          .toString(),
                                      size: 18,
                                      color: Colors.black,
                                      maxline: 2,
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                          ),
                          SizedBox(height: getProportionateScreenWidth(20)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Text(
              '${snapshot.error}',
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Colors.green),
            );
          }
        }
        return const CircularProgressIndicator();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    futurePost = fetchData(widget.postId);
  }

  @override
  Widget build(BuildContext context) {
    return buildFutureData(context);
  }
}
