import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  CreatePostContainer(this.currentUser);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage:
                    CachedNetworkImageProvider(currentUser.imageUrl),
                backgroundColor: Colors.grey[200],
                radius: 20.0,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(hintText: 'What\'s on your mind'),
                ),
              ),

            ],
          ),
          Divider(
            height: 10.0,
            thickness: 0.5,
          ),
          Container(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton.icon(
                  onPressed: () => {print('Live')},
                  icon: Icon(
                    Icons.videocam,
                    color: Colors.red,
                  ),
                  label: Text('Live'),
                ),
                const VerticalDivider(width: 8.0,),
                TextButton.icon(
                  onPressed: () => {print('Photo')},
                  icon: Icon(
                    Icons.photo_library,
                    color: Colors.green,
                  ),
                  label: Text('Photo'),
                ),
                const VerticalDivider(width: 8.0,),
                TextButton.icon(
                  onPressed: () => {print('Live')},
                  icon: Icon(
                    Icons.video_call,
                    color: Colors.red,
                  ),
                  label: Text('Room'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
