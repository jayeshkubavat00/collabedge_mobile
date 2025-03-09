import 'package:flutter/material.dart';
import 'package:flutter_sample/components/profile/screens/profile_section_widget.dart';

import '../../../utils/contants/app_assets.dart';
import '../../../utils/contants/app_colors.dart';
import '../../../utils/responsive/responsive_helper.dart';

final List<Color> chipColors = [
  Colors.blue[100]!,
  Colors.green[100]!,
  Colors.red[100]!,
  Colors.orange[100]!,
  Colors.purple[100]!,
  Colors.yellow[100]!,
  Colors.teal[100]!,
  Colors.pink[100]!,
  Colors.cyan[100]!,
];

class ProfileSkillsSectionWidget extends StatelessWidget {
  const ProfileSkillsSectionWidget({super.key});

  final List<String> skills = const [
    "Flutter",
    "Dart",
    "Firebase",
    "UI/UX Design",
    "State Management",
    "REST API",
    "GraphQL",
    "Git",
    "Agile Methodology",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ProfileSectionWidget(svgUrl: AppAssets.icIdea, title: "Skills"),
        SizedBox(height: ResponsiveHelper.responsiveHeight(context, 0.015)),
        Wrap(
          spacing: 5,
          runSpacing: 5,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: List.generate(
            skills.length,
            (index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.lightBlue, width: 1),
                  borderRadius: BorderRadius.circular(8),
                  color: chipColors[index % chipColors.length],
                ),
                child: Text(
                  skills[index],
                  style: TextStyle(
                    color: AppColors.naturalBlack,
                    fontSize: ResponsiveHelper.responsiveFontSize(context, 10),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
