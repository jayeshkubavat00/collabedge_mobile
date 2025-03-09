part of 'feed_bloc.dart';

sealed class FeedState extends Equatable {
  const FeedState();

  @override
  List<Object> get props => [];
}

final class FeedInitial extends FeedState {}

class FeedLoadingState extends FeedState {}

class FeedLoadedState extends FeedState {
  final List<FeedModel> feeds;
  const FeedLoadedState({required this.feeds});

  @override
  List<Object> get props => [feeds];
}

class FeedEmptyState extends FeedState {}

class FeedErrorState extends FeedState {}
