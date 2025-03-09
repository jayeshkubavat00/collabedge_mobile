import 'package:flutter/material.dart';
import 'package:flutter_sample/components/profile/screens/profile_section_widget.dart';

import '../../../utils/contants/app_assets.dart';
import '../../../utils/responsive/responsive_helper.dart';
import 'profile_section_list_tile.dart';

class ProfileExperinceWidget extends StatelessWidget {
  const ProfileExperinceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ProfileSectionWidget(
            svgUrl: AppAssets.icExperince, title: "Experience"),
        SizedBox(height: ResponsiveHelper.responsiveHeight(context, 0.015)),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            1,
            (index) {
              return ProfileSectionListTile(
                title: "Flutter Developer",
                subTitle: "Apliket Technology",
              );
            },
          ),
        ),
      ],
    );
  }
}
