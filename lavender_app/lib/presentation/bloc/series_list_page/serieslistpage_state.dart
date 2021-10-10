part of 'serieslistpage_bloc.dart';

abstract class SeriesListPageState extends Equatable {
  const SeriesListPageState();

  @override
  List<Object> get props => [];
}


class SeriesListPageLoadingState extends SeriesListPageState {
  const SeriesListPageLoadingState();

  @override
  List<Object> get props => [];
}

class SeriesListPageLoadedState extends SeriesListPageState {
  final List<Series> seriesList;
  const SeriesListPageLoadedState({@required this.seriesList});

  @override
  List<Object> get props => [seriesList];
}

class SeriesListPageNoInternetState extends SeriesListPageState {
  const SeriesListPageNoInternetState();

  @override
  List<Object> get props => [];
}

class SeriesListPageErrorState extends SeriesListPageState {
  const SeriesListPageErrorState();

  @override
  List<Object> get props => [];
}
