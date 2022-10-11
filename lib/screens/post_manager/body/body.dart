import 'package:apart_rent/constants.dart';
import 'package:apart_rent/screens/post_create/post_create_screen.dart';
import 'package:apart_rent/screens/post_manager/body/all_posts.dart';
import 'package:apart_rent/screens/post_manager/body/draft_posts.dart';
import 'package:apart_rent/screens/post_manager/body/hidden_posts.dart';
import 'package:apart_rent/screens/post_manager/body/posts_waiting_for_approval.dart';
import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            color: kPrimaryColor,
            child: SafeArea(
                child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(),
                ),
                const TabBar(tabs: [
                  Tab(text: 'All posts'),
                  Tab(text: 'Draft posts'),
                  Tab(text: 'Posts waiting for approval'),
                  Tab(text: 'Hidden posts'),
                ])
              ],
            )),
          ),
        ),
        body: const TabBarView(
          children: [
            AllPosts(),
            DraftPosts(),
            PostsWaitingForApproval(),
            HiddenPosts(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.pushNamed(context, PostCreateScreen.routeName);
          },
          backgroundColor: kPrimaryColor,
          child: const Icon(Icons.add),),
      ),
    );
  }
}
