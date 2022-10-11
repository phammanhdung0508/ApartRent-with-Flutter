import 'dart:convert';

import 'package:apart_rent/models/listpost.dart';
import 'package:apart_rent/models/notification.dart';
import 'package:apart_rent/models/post.dart';
import 'package:apart_rent/repository/api/apiUrl.dart';
import 'package:http/http.dart' as http;

Future<List<Notificationn>> fetchAllNotification() async {
  final response = await http.get(Uri.parse(apiNotification));
  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List)
        .map((e) => Notificationn.fromJson(e))
        .toList();
  } else {
    throw Exception('Fail to load API');
  }
}

Future<List<ListPost>> fetchAllData() async {
  final response = await http.get(Uri.parse("$apiUrl/Post"));
  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List)
        .map((e) => ListPost.fromJson(e))
        .toList();
  } else {
    throw Exception('Fail to load API');
  }
}

Future<List<ListPost>> fetchDataBaseOnStatus(int statusId) async {
  final response = await http.get(Uri.parse("$apiUrl/Post/sta/$statusId"));
  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List)
        .map((e) => ListPost.fromJson(e))
        .toList();
  } else {
    throw Exception('Fail to load API');
  }
}

Future<Post> fetchData(int id) async {
  final response = await http.get(Uri.parse("$apiUrl/Post/$id"));
  if (response.statusCode == 200) {
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Fail to load API');
  }
}

Future addData1(data) async {
  String json = jsonEncode(data);
  
  final response = await http.post(
  Uri.parse("$apiUrl/Post/post1"), 
  headers: <String, String>{
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  },
  body: jsonEncode(data),
  );

  if(response.statusCode == 200){
    return print(response.body);
  }else{
    throw Exception(Error);
  }
}

Future addData2(data) async {
  final response = await http.post(
  Uri.parse("$apiUrl/Post/post2"), 
  headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json'
  },
  body: jsonEncode(data),
  );

  if(response.statusCode == 200){
    return print(response.body);
  }else{
    throw Exception('Fail to post DemoApi');
  }
}

Future addData3(data) async {
  String json = jsonEncode(data);
  final response = await http.post(
  Uri.parse("$apiUrl/Post/post3"), 
  headers: <String, String>{
    'Content-Type': 'application/json; charset=UTF-8',
    'Accept': 'application/json'
  },
  body: jsonEncode(data),
  );

  if(response.statusCode == 200){
    return print(response.body);
  }else{
    throw Exception('Fail to post DemoApi');
  }
}

Future<Post> updateStatusPost(int id, int postStatusId) async {
  final response = await http.put(Uri.parse("$apiUrl/Post/$id?status=$postStatusId"));

  if (response.statusCode == 200) {
    //print(response.body);
    return Post.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Fail to post DemoApi');
  }
}

Future<List<Post>> deletePost(int id) async {
  final response = await http.delete(Uri.parse("$apiUrl/Post/$id"));
  if (response.statusCode == 200) {
    return (jsonDecode(response.body) as List)
        .map((e) => Post.fromJson(e))
        .toList();
  } else {
    throw Exception('Fail to load DemoApi');
  }
}
