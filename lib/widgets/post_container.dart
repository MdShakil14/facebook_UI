import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/config/palette.dart';
import 'package:facebook_ui/models/models.dart';
import 'package:facebook_ui/widgets/profile_avator.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PostContainer extends StatelessWidget {
  final Post post;

  PostContainer(@required this.post);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0),
      padding: EdgeInsets.symmetric(vertical: 8.0),
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _PostHeader(post),
                SizedBox(
                  height: 4.0,
                ),
                Text(post.caption),
                post.imageUrl != null
                    ? const SizedBox.shrink()
                    : SizedBox(
                        height: 6.0,
                      ),
              ],
            ),
          ),
          post.imageUrl != null
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CachedNetworkImage(imageUrl: post.imageUrl),
                )
              : SizedBox.shrink(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: _PostStats(post),
          )
        ],
      ),
    );
  }
}

class _PostHeader extends StatelessWidget {
  final Post post;

  _PostHeader(this.post);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvator(imageUrl: post.user.imageUrl),
        SizedBox(
          width: 8.0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.user.name,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                children: [
                  Text(
                    '${post.timeAgo}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                  Icon(
                    Icons.public,
                    color: Colors.grey[600],
                    size: 12.0,
                  ),
                ],
              )
            ],
          ),
        ),
        IconButton(
          onPressed: () => print('More'),
          icon: const Icon(Icons.more_horiz),
        )
      ],
    );
  }
}

class _PostStats extends StatelessWidget {
  final Post post;

  _PostStats(this.post);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Palette.facebookBlue),
              child: Icon(
                Icons.thumb_up,
                size: 10.0,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Text(
                '${post.likes}',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ),
            Text(
              '${post.comments} comments ',
              style: TextStyle(color: Colors.grey[600]),
            ),
            SizedBox(
              width: 8.0,
            ),
            Text(
              '${post.shares} shares',
              style: TextStyle(color: Colors.grey[600]),
            )
          ],
        ),
        Divider(),
        Row(
          children: [
            _PostButton(
              icon: Icon(MdiIcons.thumbUpOutline, color: Colors.grey[600], size: 20.0),
              label: 'Likes',
              onTap: () => print('like'),
            ),
            _PostButton(
              icon: Icon(MdiIcons.commentOutline, color: Colors.grey[600], size: 20.0),
              label: 'comment',
              onTap: () => print('comment'),
            ),
            _PostButton(
              icon: Icon(MdiIcons.shareOutline, color: Colors.grey[600], size: 25.0),
              label: 'share',
              onTap: () => print('share'),
            )
          ],
        )
      ],
    );
  }
}

class _PostButton extends StatelessWidget {
  final Icon icon;
  final String label;
  final VoidCallback onTap;

  _PostButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            height: 25.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                icon,
                SizedBox(
                  width: 4.0,
                ),
                Text(label)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
