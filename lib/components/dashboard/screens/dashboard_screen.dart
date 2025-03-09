import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/components/chat/screens/chat_screen.dart';
import 'package:flutter_sample/components/dashboard/data/dashboard_bloc/dashboard_bloc.dart';
import 'package:flutter_sample/components/home/screens/feed_screen.dart';
import 'package:flutter_sample/components/notification/screens/notification_screen.dart';
import 'package:flutter_sample/components/profile/screens/profile_screen.dart';
import 'package:flutter_sample/utils/contants/app_assets.dart';
import 'package:flutter_sample/utils/contants/app_colors.dart';
import 'package:flutter_sample/utils/responsive/responsive_helper.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/common_widgets/app_logo_text_widget.dart';

class ResponsiveScaffold extends StatelessWidget {
  final Widget mobileBody;
  final Widget tabletBody;

  const ResponsiveScaffold({
    super.key,
    required this.mobileBody,
    required this.tabletBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          // Web/Desktop
          return SizedBox.shrink();
        } else if (constraints.maxWidth >= 600) {
          // Tablet
          return tabletBody;
        } else {
          // Mobile
          return mobileBody;
        }
      },
    );
  }
}

List<Widget> screens = [
  FeedScreen(),
  ChatScreen(),
  NotificationScreen(),
  ProfileScreen(),
];

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          DashboardBloc()..add(DashboarChnageTabEvent(tabIndex: 0)),
      child: BlocBuilder<DashboardBloc, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoadingState) {
            return Scaffold(body: Center(child: CircularProgressIndicator()));
          } else if (state is DashboarChnageTabState) {
            return Scaffold(
              backgroundColor: AppColors.white,
              appBar: AppBar(
                backgroundColor: AppColors.white,
                forceMaterialTransparency: true,
                title: AppLogoTextWidget(),
                actions: [
                  IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {},
                      icon: Image.network(
                        "https://avatar.iran.liara.run/public/1s",
                        alignment: Alignment.center,
                        width: 32,
                        height: 32,
                      )),
                ],
              ),
              bottomNavigationBar: CustomBottomNavigationBar(
                selectedIndex: state.tabIndex,
                onItemTapped: (index) {
                  context
                      .read<DashboardBloc>()
                      .add(DashboarChnageTabEvent(tabIndex: index));
                },
              ),
              body: screens[state.tabIndex],
            );
          }
          return Scaffold(body: Center(child: Text("Unknown State")));
        },
      ),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScaffold(
      mobileBody: MobileScaffold(),
      tabletBody: MobileScaffold(),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: CircularNotchedRectangle(),
      elevation: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // First item
          IconButton(
            tooltip: "Feed",
            icon: SvgPicture.asset(
              selectedIndex == 0 ? AppAssets.icActiveHome : AppAssets.icHome,
              width: ResponsiveHelper.responsiveWidth(context, 0.030),
              height: ResponsiveHelper.responsiveHeight(context, 0.030),
            ),
            onPressed: () => onItemTapped(0),
          ),
          // Second item
          IconButton(
            tooltip: "Chat",
            icon: SvgPicture.asset(
              selectedIndex == 1 ? AppAssets.icActiveChat : AppAssets.icChat,
              width: ResponsiveHelper.responsiveWidth(context, 0.030),
              height: ResponsiveHelper.responsiveHeight(context, 0.030),
            ),
            onPressed: () => onItemTapped(1),
          ),
          // // Third item
          IconButton(
            tooltip: "Notification",
            icon: SvgPicture.asset(
              selectedIndex == 2
                  ? AppAssets.icActiveNotification
                  : AppAssets.icNotification,
              width: ResponsiveHelper.responsiveWidth(context, 0.030),
              height: ResponsiveHelper.responsiveHeight(context, 0.030),
            ),
            onPressed: () => onItemTapped(2),
          ),
          // Fourth item
          IconButton(
            tooltip: "Profile",
            icon: SvgPicture.asset(
              selectedIndex == 3
                  ? AppAssets.icActiveProfile
                  : AppAssets.icProfile,
              width: ResponsiveHelper.responsiveWidth(context, 0.025),
              height: ResponsiveHelper.responsiveHeight(context, 0.025),
            ),
            onPressed: () => onItemTapped(3),
          ),
        ],
      ),
    );
  }
}
