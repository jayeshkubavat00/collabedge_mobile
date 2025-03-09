import 'package:flutter/material.dart';
import 'package:flutter_sample/components/home/data/models/feed_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../utils/contants/app_colors.dart';
import '../../../utils/responsive/responsive_helper.dart';

class FeedProfileWidget extends StatelessWidget {
  final Profile profileData;
  const FeedProfileWidget({super.key, required this.profileData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          imageWidget(imageUrl: profileData.profilePhoto),
          SizedBox(
            width: ResponsiveHelper.responsiveWidth(context, 0.005),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 1,
            children: [
              Text(
                profileData.profileId,
                style: TextStyle(
                    color: AppColors.naturalBlack,
                    fontSize: ResponsiveHelper.responsiveFontSize(context, 11),
                    fontWeight: FontWeight.w500),
              ),
              Text(
                profileData.description,
                style: TextStyle(
                    color: AppColors.naturalBlack,
                    fontSize: ResponsiveHelper.responsiveFontSize(context, 9),
                    fontWeight: FontWeight.w400),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget imageWidget({required String imageUrl}) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        alignment: Alignment.center,
        width: 32.0,
        height: 32.0,
        fit: BoxFit
            .cover, // Ensures the image covers the circular container properly
        placeholder: (context, url) => Center(
            child: CircularProgressIndicator()), // Show loading indicator
        errorWidget: (context, url, error) =>
            Icon(Icons.error), // Show error icon on failure
      ),
    );
  }
}
