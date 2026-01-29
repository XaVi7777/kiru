import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:kiru/app_colors.dart';

class AppAvatar extends StatelessWidget {
  final String? imageUrl;
  const AppAvatar({super.key, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final image = imageUrl == null
        ? Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.grey,
            ),
            alignment: Alignment.center,
            child: Icon(Icons.person),
          )
        : CachedNetworkImage(
        imageUrl: imageUrl!,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
     );
    return CircleAvatar(radius: 42, child: ClipOval(child: image));
  }
}
