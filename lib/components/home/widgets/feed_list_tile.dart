import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/components/home/data/models/feed_model.dart';
import 'package:flutter_sample/components/home/widgets/feed_action_bar_widget.dart';
import 'package:flutter_sample/components/profile/screens/profile_skills_section_widget.dart';
import 'package:flutter_sample/utils/contants/app_colors.dart';
import 'package:flutter_sample/utils/contants/app_styles.dart';
import 'package:flutter_sample/utils/responsive/responsive_helper.dart';

import '../widgets/feed_profile_widget.dart';

class FeedListTile extends StatelessWidget {
  final FeedModel feedData;
  const FeedListTile({super.key, required this.feedData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.white,
          boxShadow: AppStyles.minimalShadow),
      child: Column(
        spacing: 12,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FeedProfileWidget(profileData: feedData.profile),
          //Title
          Text(
            feedData.title,
            style: TextStyle(
                color: AppColors.naturalBlack,
                fontSize: ResponsiveHelper.responsiveFontSize(context, 14),
                fontWeight: FontWeight.w600),
          ),
          Text(
            feedData.description,
            style: TextStyle(
                color: AppColors.naturalBlack,
                fontSize: ResponsiveHelper.responsiveFontSize(context, 12),
                fontWeight: FontWeight.w400),
          ),
          Wrap(
            spacing: 8.0,
            children: List.generate(
              feedData.techStack.length,
              (index) => Container(
                padding: EdgeInsets.symmetric(horizontal: 9, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightBlue, width: 1),
                  borderRadius: BorderRadius.circular(8),
                  color: chipColors[0 % chipColors.length],
                ),
                child: Text(
                  feedData.techStack[index],
                  style: TextStyle(
                      color: AppColors.naturalBlack,
                      fontSize:
                          ResponsiveHelper.responsiveFontSize(context, 12),
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),

          Row(
            spacing: 8.0,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Status: ',
                style: TextStyle(
                    color: AppColors.naturalBlack,
                    fontSize: ResponsiveHelper.responsiveFontSize(context, 12),
                    fontWeight: FontWeight.w500),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightBlue, width: 1),
                  borderRadius: BorderRadius.circular(5),
                  color: chipColors[0 % chipColors.length],
                ),
                child: Text(
                  // "Start from Scratch",
                  feedData.developmentStatus,
                  style: TextStyle(
                    color: AppColors.naturalBlack,
                    fontSize: ResponsiveHelper.responsiveFontSize(context, 10),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Team: ',
                style: TextStyle(
                    color: AppColors.naturalBlack,
                    fontSize: ResponsiveHelper.responsiveFontSize(context, 12),
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(width: 8.0),
              SizedBox(
                height: ResponsiveHelper.responsiveHeight(context, 0.05),
                width: ResponsiveHelper.responsiveWidth(
                  context,
                  0.50,
                ),
                child: Stack(
                  children: List.generate(feedData.teamMembers.length, (index) {
                    return Positioned(
                      left: index * 20.0, // Adjust the spacing between avatars
                      child: CircleAvatar(
                          radius: 16,
                          backgroundColor: Colors.blue[300],
                          child: imageWidget(
                              imageUrl:
                                  feedData.teamMembers[index].profilePhoto)),
                    );
                  }),
                ),
              ),
            ],
          ),
          Divider(
            color: AppColors.lightGray,
            height: 1,
            thickness: 1,
          ),
          FeedActionBarWidget()
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
