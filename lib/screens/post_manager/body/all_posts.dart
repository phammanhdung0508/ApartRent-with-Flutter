import 'package:apart_rent/constants.dart';
import 'package:apart_rent/models/listpost.dart';
import 'package:apart_rent/repository/api/api.dart';
import 'package:apart_rent/screens/post_detail/post_detail_screen.dart';
import 'package:apart_rent/size_config.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PostId {
  final int? id;

  PostId(this.id);
}

class AllPosts extends StatefulWidget {
  const AllPosts({Key? key}) : super(key: key);

  @override
  _AllPosts createState() => _AllPosts();
}

class _AllPosts extends State<AllPosts> {
  Future<List<ListPost>>? futureListPost;
  AsyncSnapshot<List<ListPost>>? listPost;
  String searchString = "";
  int id = 1;
  final controller = TextEditingController();

  buildFutureAllData(BuildContext context) {
    return FutureBuilder<List<ListPost>>(
      future: futureListPost,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return ListView.separated(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  String date = DateFormat('dd-MM-yyyy').format(DateTime.parse((snapshot.data![index].dateCreate).toString()));
                  return snapshot.data![index].title!
                          .toLowerCase()
                          .contains(searchString.toLowerCase())
                      ? GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                    context, PostDetailScreen.routeName,
                                    arguments:
                                        PostId(snapshot.data![index].postId))
                                .then((_) => {
                                      setState((() {
                                        futureListPost =
                                            fetchDataBaseOnStatus(id);
                                      }))
                                    });
                          },
                          child: Container(
                            padding: const EdgeInsets.only(left: 5),
                            height: 190,
                            child: Stack(
                              children: [
                                Positioned(
                                  top: 10,
                                  left: 3,
                                  child: Material(
                                    elevation: 5,
                                    child: Container(
                                      height: 170,
                                      width: getProportionateScreenWidth(360),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5),
                                        boxShadow: [
                                          BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.3),
                                              offset: const Offset(0.0, 0.0),
                                              blurRadius: 20.0,
                                              spreadRadius: 4.0)
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 10,
                                  left: 4,
                                  child: Card(
                                    elevation: 10.0,
                                    shadowColor: Colors.grey.withOpacity(0.5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Container(
                                      height: 160,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage((snapshot
                                                  .data![index]
                                                  .apartment!
                                                  .apartmentImgUrl)
                                              .toString()),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 15,
                                  left: getProportionateScreenWidth(130),
                                  child: SizedBox(
                                    height: 200,
                                    width: 250,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            (snapshot.data![index].title)
                                                .toString(),
                                            softWrap: true,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w900,
                                              color: kPrimaryColor,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                ("${snapshot.data![index].price} tr/th")
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 3, right: 3),
                                              child: Text('-'),
                                            ),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                ("${snapshot.data![index].apartment!.area} m²")
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w900,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 3),
                                              child: Icon(
                                                Icons.bed,
                                                color: Colors.black,
                                                size: 18,
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                (snapshot
                                                        .data![index]
                                                        .apartment!
                                                        .numberOfBedroom)
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: kTextColor,
                                                ),
                                              ),
                                            ),
                                            const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 3, right: 3),
                                              child: Text('-'),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 3),
                                              child: Icon(
                                                Icons.bathtub_outlined,
                                                color: Colors.black,
                                                size: 18,
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.topLeft,
                                              child: Text(
                                                (snapshot
                                                        .data![index]
                                                        .apartment!
                                                        .numberOfBathroom)
                                                    .toString(),
                                                style: const TextStyle(
                                                  fontSize: 12,
                                                  color: kTextColor,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Divider(color: Colors.black),
                                        Container(
                                          padding: const EdgeInsets.only(
                                            bottom:
                                                3, // space between underline and text
                                          ),
                                          child: Text(
                                            (snapshot.data![index].description)
                                                .toString(),
                                            softWrap: true,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              color: kTextColor,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.only(
                                            bottom:
                                                3, // space between underline and text
                                          ),
                                          decoration: const BoxDecoration(
                                            border: Border(
                                              bottom: BorderSide(
                                                color:
                                                    kSecondaryColor, // Text colour here
                                                width: 1.0, // Underline width
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            (date)
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 10,
                                              color: kTextColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container();
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 0,
                  );
                });
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
    futureListPost = fetchDataBaseOnStatus(id);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: getProportionateScreenHeight(15),
          ),
          Container(
            width: SizeConfig.screenWidth * 0.95,
            //height: SizeConfig.screenHeight * 0.6,
            decoration: BoxDecoration(
              color: kSecondaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextField(
              controller: controller,
              onChanged: (value) {
                setState(() {
                  searchString = value;
                });
              },
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(9),
                  ),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  hintText: "Search anything",
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
          SizedBox(
            height: getProportionateScreenWidth(10),
          ),
          buildFutureAllData(context)
        ],
      ),
    );
  }
}
