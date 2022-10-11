import 'package:apart_rent/constants.dart';
import 'package:apart_rent/repository/api/api.dart';
import 'package:apart_rent/screens/post_detail/body/body.dart';
import 'package:apart_rent/screens/post_manager/body/hidden_posts.dart';
import 'package:apart_rent/screens/post_manager/post_manager_screen.dart';

import 'package:flutter/material.dart';

class HiddenDetailScreen extends StatelessWidget {
  static String routeName = "/hidden";
  const HiddenDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PostHiddenId;
    int statusId = 1;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(
                  color: kAppbarColor, offset: Offset(0, 2), blurRadius: 0),
            ],
          ),
          child: AppBar(
            automaticallyImplyLeading: false,
            toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
            titleTextStyle: Theme.of(context).textTheme.headline6,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context,true);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: kPrimaryColor,
              ),
            ),
            actions: [
              PopupMenuButton<int>(
                  icon: const Icon(
                    Icons.menu,
                    color: kPrimaryColor,
                  ),
                  color: Colors.white,
                  onSelected: (item) => onSelected(context, item),
                  itemBuilder: (context) => [
                        PopupMenuItem<int>(
                          value: 0,
                          child: Row(
                            children: const [
                              Icon(Icons.share, color: kPrimaryColor),
                              SizedBox(
                                width: 8,
                              ),
                              Text('Share',
                                  style: TextStyle(color: kPrimaryColor))
                            ],
                          ),
                        ),
                        PopupMenuItem<int>(
                          value: 0,
                          child: Row(
                            children: const [
                              Icon(Icons.done, color: kPrimaryColor),
                              SizedBox(
                                width: 8,
                              ),
                              Text('Activate Post',
                                  style: TextStyle(color: kPrimaryColor))
                            ],
                          ),
                          onTap: () {
                            Future.delayed(
                                const Duration(seconds: 0),
                                () => showDialog(
                                    context: context,
                                    builder: (BuildContext conntext) {
                                      return AlertDialog(
                                        title: const Text('Bạn sẽ cho phép bài viết hiển thị?'),
                                        content: const Text('Bài viết này sẽ được hiển thị ở mục quản lý đăng tin của bạn!'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: (){
                                              updateStatusPost(args.id!, statusId);
                                              Navigator.pop(context, true);
                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Bài viết đã được mở lại!')));
                                            },
                                            child: const Text('Đồng ý'),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: const Text('Hủy'),
                                          ),
                                        ],
                                      );
                                    }));
                          },
                        ),
                        const PopupMenuDivider(height: 8),
                        PopupMenuItem<int>(
                          value: 1,
                          child: Row(
                            children: const [
                              Icon(Icons.delete, color: kPrimaryColor),
                              SizedBox(
                                width: 8,
                              ),
                              Text('Delete',
                                  style: TextStyle(color: kPrimaryColor))
                            ],
                          ),
                          onTap: () {
                            Future.delayed(
                                const Duration(seconds: 0),
                                () => showDialog(
                                    context: context,
                                    builder: (BuildContext conntext) {
                                      return AlertDialog(
                                        title: const Text('Bạn có chắc muốn xóa bài viết này không?'),
                                        content: const Text('Bài viết này sẽ bị xóa vĩnh viễn khỏi hệ thống!'),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: (){
                                              deletePost(args.id!);
                                              Navigator.popUntil(context, ModalRoute.withName(PostManagerScreen.routeName));
                                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Bài viết đã được xóa!')));
                                            },
                                            child: const Text('Đồng ý'),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                context, 'Cancel'),
                                            child: const Text('Hủy'),
                                          ),
                                        ],
                                      );
                                    }));
                          },
                        ),
                      ])
            ],
          ),
        ),
      ),
      body: Body(postId: args.id!),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kPrimaryColor,
        child: const Icon(Icons.phone),
      ),
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        break;
      case 1:
        break;
      case 2:
        break;
    }
  }
}
