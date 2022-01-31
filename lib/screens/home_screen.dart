import 'package:facebook_ui/models/models.dart';
import 'package:flutter/material.dart';
import '../config/palette.dart';
import '../data/data.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.white,
            title: Text(
              'facebook',
              style: TextStyle(
                  color: Palette.facebookBlue,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: -1.2),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              CircleButton(Icons.search, 30.0, () => print('Search')),
              CircleButton(
                  MdiIcons.facebookMessenger, 30.0, () => print('Messenger'))
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              child: CreatePostContainer(currentUser),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                child: Room(onlineUsers),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                child: Stories(currentUser: currentUser, stories: stories),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (context, index) {
              final Post post = posts[index];
              return PostContainer(post);
            },
            childCount: posts.length,
          ))
        ],
      ),
    );
  }
}
