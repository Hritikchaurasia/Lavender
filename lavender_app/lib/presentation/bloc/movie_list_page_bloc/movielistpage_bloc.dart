import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../data/movies/movies.dart';
import '../../../domain/repositories/network_repo.dart';

part 'movielistpage_event.dart';
part 'movielistpage_state.dart';

class MovieListPageBloc extends Bloc<MovieListPageEvent, MovieListPageState> {
  MovieListPageBloc() : super(MovieListPageLoadingState());

  @override
  Stream<MovieListPageState> mapEventToState(
    MovieListPageEvent event,
  ) async* {
    yield MovieListPageLoadingState();
    if (event is GetMovieListBaseOnCategory) {
      try {
        final List<Movie> moviesList =
            await NetworkRepo().getMovieCategoryList(event.categoryUrl);
        yield MovieListPageLoadedState(moviesList: moviesList);
      } on IOException {
        yield MovieListPageNoInternetState();
      } catch (e) {
        yield MovieListPageErrorState();
      }
    }
  }
}
