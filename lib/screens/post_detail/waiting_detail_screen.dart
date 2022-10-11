import 'package:apart_rent/constants.dart';
import 'package:apart_rent/screens/post_detail/body/body.dart';
import 'package:apart_rent/screens/post_manager/body/posts_waiting_for_approval.dart';

import 'package:flutter/material.dart';

class WaitingDetailScreen extends StatelessWidget {
  static String routeName = "/waiting";
  const WaitingDetailScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as PostWaitingId;
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
              onPressed: () {},
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
    }
  }
}
