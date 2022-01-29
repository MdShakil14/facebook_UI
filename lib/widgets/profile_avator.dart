import 'package:cached_network_image/cached_network_image.dart';
import 'package:facebook_ui/config/palette.dart';
import 'package:flutter/material.dart';

class ProfileAvator extends StatelessWidget {
  final String imageUrl;
  final bool isActive;

  ProfileAvator({@required this.imageUrl = '', this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 20.0,
          backgroundColor: Colors.grey[200],
          backgroundImage: CachedNetworkImageProvider(imageUrl),
        ),
        isActive
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Palette.online,
                    border: Border.all(width: 2.0, color: Colors.white),
                  ),
                ),
              )
            : SizedBox.shrink(),
      ],
    );
  }
}
