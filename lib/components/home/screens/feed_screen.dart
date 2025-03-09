import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sample/components/home/widgets/feed_list_tile.dart';
import 'package:flutter_sample/shared/common_widgets/app_system_overlay_widget.dart';

import '../../../utils/contants/app_colors.dart';
import '../data/bloc/feed_bloc.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FeedBloc()..add(FeedLoadEvent()),
      child: AppSystemOverlay(
        overlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarColor: AppColors.white,
        ),
        child: SafeArea(
          child: BlocBuilder<FeedBloc, FeedState>(
            builder: (context, state) {
              if (state is FeedLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is FeedLoadedState) {
                return ListView.builder(
                  padding: const EdgeInsets.all(18),
                  itemCount: state.feeds.length,
                  itemBuilder: (context, index) {
                    return FeedListTile(
                      feedData: state.feeds[index],
                    );
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
