part of 'serieslistpage_bloc.dart';

abstract class SeriesListPageEvent extends Equatable {
  const SeriesListPageEvent();

  @override
  List<Object> get props => [];
}


class GetSeriesListBaseOnCategory extends SeriesListPageEvent {
  final String categoryUrl;

  const GetSeriesListBaseOnCategory({@required this.categoryUrl});

  @override
  List<Object> get props => [categoryUrl];
}
