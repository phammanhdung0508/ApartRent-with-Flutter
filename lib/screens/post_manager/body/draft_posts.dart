import 'package:apart_rent/constants.dart';
import 'package:apart_rent/models/listpost.dart';
import 'package:apart_rent/repository/api/api.dart';
import 'package:apart_rent/size_config.dart';
import 'package:flutter/material.dart';

class DraftPosts extends StatefulWidget{
  const DraftPosts({Key? key}) : super(key: key);

  _DraftPosts createState() => _DraftPosts();
}

class _DraftPosts extends State<DraftPosts>{
  Future<List<ListPost>>? futureListPost;
  int id = 3;

  buildFutureAllData(BuildContext context) {
    return FutureBuilder<List<ListPost>>(
      future: futureListPost,
      builder: (context, snapshot) {
        if(snapshot.connectionState == ConnectionState.done){
        if (snapshot.hasData) {
          return ListView.separated(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    //Navigator.pushNamed(context, WaitingDetailScreen.routeName, arguments: PostWaitingId(snapshot.data![index].postId));
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
                                      color: Colors.grey.withOpacity(0.3),
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
                                borderRadius: BorderRadius.circular(5.0),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      (snapshot.data![index].apartment!.apartmentImgUrl).toString()),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    (snapshot.data![index].title).toString(),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        ("${snapshot.data![index].price} tr/th").toString(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 3, right: 3),
                                      child: Text('-'),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        ("${snapshot.data![index].apartment!.area} m²").toString(),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Padding(
                                      padding: EdgeInsets.only(right: 3),
                                      child: Icon(
                                        Icons.bed,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        (snapshot.data![index].apartment!.numberOfBedroom).toString(),
                                        style: const TextStyle(
                                          fontSize: 12,
                                          color: kTextColor,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 3, right: 3),
                                      child: Text('-'),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(right: 3),
                                      child: Icon(
                                        Icons.bathtub_outlined,
                                        color: Colors.black,
                                        size: 18,
                                      ),
                                    ),
                                    Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        (snapshot.data![index].apartment!.numberOfBathroom).toString(),
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
                                    (snapshot.data![index].description).toString(),
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
                                    (snapshot.data![index].dateCreate).toString(),
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
                );
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
                fontSize: 25, fontWeight: FontWeight.w500, color: Colors.green),
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
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        children: [buildFutureAllData(context)],
      ),
    );
  }
}