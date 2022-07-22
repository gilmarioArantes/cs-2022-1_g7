
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String photo;
  final double radius;
  final ColorFilter? filter;

  const UserAvatar({Key? key, 
    required this.photo,
    this.radius = 30,
    this.filter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: photo,
      progressIndicatorBuilder: (context, url, progress) {
        return Container(
          width: radius * 2,
          height: radius * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: const AssetImage('assets/images/default_user.png'),
              fit: BoxFit.cover,
              colorFilter: filter,
            ),
          ),
        );
      },
      imageBuilder: (context, imageProvider) {
        return Container(
          width: radius * 2,
          height: radius * 2,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
              colorFilter: filter,
            ),
          ),
        );
      },
    );
  }
}
