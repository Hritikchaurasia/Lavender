part of 'movielistpage_bloc.dart';

abstract class MovieListPageEvent extends Equatable {
  const MovieListPageEvent();

  @override
  List<Object> get props => [];
}

class GetMovieListBaseOnCategory extends MovieListPageEvent {
  final String categoryUrl;

  const GetMovieListBaseOnCategory({@required this.categoryUrl});

  @override
  List<Object> get props => [categoryUrl];
}
