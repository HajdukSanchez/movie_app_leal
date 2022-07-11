part of 'tv_show_bloc.dart';

/// Type of list to get
enum TvShowListType {
  popular,
  recommended,
  airingToday,
}

abstract class TvShowEvent extends Equatable {
  const TvShowEvent();

  @override
  List<Object> get props => [];
}

/// Event to get a list of tv show depends on the type.
class TvShowGetListEvent extends TvShowEvent {
  final TvShowListType type;

  const TvShowGetListEvent({required this.type});
}

/// Event to get details of a Tv Show depends on the ID.
class TvShowGetDetailEvent extends TvShowEvent {
  final String id;

  const TvShowGetDetailEvent({required this.id});
}
