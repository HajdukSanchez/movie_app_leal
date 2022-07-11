import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies_app_leal/core/widgets/list_separator.dart';
import 'package:movies_app_leal/features/tv_show/presentation/bloc/tv_show/tv_show_bloc.dart';
import 'package:movies_app_leal/features/tv_show/presentation/widgets/movie_view.dart';

class RecentPage extends StatelessWidget {
  const RecentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: BlocBuilder<TvShowBloc, TvShowState>(
        builder: (BuildContext context, state) {
          final list = state.lists?[TvShowListType.airingToday] ?? [];

          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return MovieView(
                  tvShow: list[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) => const ListSeparator(
                margin: EdgeInsets.symmetric(vertical: 40, horizontal: 50),
              ),
            ),
          );
        },
      ),
    );
  }
}
