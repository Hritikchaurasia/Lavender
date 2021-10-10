import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../data/series/series.dart';
import '../../../domain/repositories/network_repo.dart';

part 'serieslistpage_event.dart';
part 'serieslistpage_state.dart';

class SeriesListPageBloc
    extends Bloc<SeriesListPageEvent, SeriesListPageState> {
  SeriesListPageBloc() : super(SeriesListPageLoadingState());

  @override
  Stream<SeriesListPageState> mapEventToState(
    SeriesListPageEvent event,
  ) async* {
    yield SeriesListPageLoadingState();
    if (event is GetSeriesListBaseOnCategory) {
      try {
        final List<Series> seriesList =
            await NetworkRepo().getSeriesCategoryList(event.categoryUrl);
        yield SeriesListPageLoadedState(seriesList: seriesList);
      } on IOException {
        yield SeriesListPageNoInternetState();
      } catch (e) {
        yield SeriesListPageErrorState();
      }
    }
  }
}
