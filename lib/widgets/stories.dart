import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/data/data.dart';
import 'package:facebook_ui/widgets/profile_avator.dart';
import 'package:flutter/material.dart';
import 'package:facebook_ui/models/models.dart';

class Stories extends StatelessWidget {
  final User currentUser;
  final List<Story> stories;

  Stories(
      {required this.currentUser, required this.stories});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.white,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final Story story = stories[index];
          if (index == 0) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.0),
              child: _StoryCard(
                  isAddStory: true, currentUser: currentUser, story: story),
            );
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: _StoryCard(
                isAddStory: false, currentUser: currentUser, story: story),
          );
        },
        itemCount:  stories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  final bool isAddStory;

  final User currentUser;

  final Story story;

  const _StoryCard({Key? key,
    this.isAddStory = false,
    required this.currentUser,
    required this.story})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: CachedNetworkImage(
            imageUrl: isAddStory ? currentUser.imageUrl : story.imageUrl,
            height: double.infinity,
            width: 110.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: double.infinity,
          width: 110.0,
          decoration: BoxDecoration(
              gradient: Palette.storyGradient,
              borderRadius: BorderRadius.circular(12.0)),
        ),
        Positioned(
          top: 8.0,
          left: 8.0,
          child: isAddStory ? Container(
            height: 40.0,
            width: 40.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
                color: Colors.white),
          child: IconButton(
            padding: EdgeInsets.zero,
            iconSize: 30.0,
            icon: Icon(Icons.add),
            onPressed: ()=>print('Add story'),
              color: Palette.facebookBlue,

          ),
          )
              : ProfileAvator(imageUrl: story.user.imageUrl,hasBorder: !story.isViewed)
        ),
        Positioned(
          left: 8.0,
            right: 8.0,
            bottom: 8.0,
            child: Text(
              isAddStory ? 'Add to story' : story.user.name,
              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ))

      ],
    );
  }
}
