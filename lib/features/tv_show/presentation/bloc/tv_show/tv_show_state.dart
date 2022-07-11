part of 'tv_show_bloc.dart';

class TvShowState extends Equatable {
  final bool hasData;
  final bool loading;
  final String? error;
  final Map<TvShowListType, List<TvShow>>? lists;

  const TvShowState({
    required this.hasData,
    required this.loading,
    this.lists,
    this.error,
  });

  TvShowState copyWith({
    bool? hasData,
    bool? loading,
    String? error,
    Map<TvShowListType, List<TvShow>>? lists,
  }) {
    return TvShowState(
      hasData: hasData ?? this.hasData,
      loading: loading ?? this.loading,
      error: error ?? this.error,
      lists: lists ?? this.lists,
    );
  }

  @override
  List<Object> get props => [
        {
          lists,
          hasData,
          loading,
          error,
        }
      ];
}
