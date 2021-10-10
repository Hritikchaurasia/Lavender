import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lavender/presentation/pages/series/series_detail_page.dart';

import '../../../utils/constants.dart';
import '../../bloc/series_list_page/serieslistpage_bloc.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/list_screen.dart';

class SeriesListPage extends StatefulWidget {
  final String categoryUrl;
  final String categoryName;
  const SeriesListPage({
    Key key,
    @required this.categoryUrl,
    @required this.categoryName,
  }) : super(key: key);

  @override
  _SeriesListPageState createState() => _SeriesListPageState();
}

class _SeriesListPageState extends State<SeriesListPage> {
  static const titleGeneralError = 'Error occure';
  static const titleNetworkError = 'No Internet Connection';
  static const searchHint = 'Enter Series Name';

  SeriesListPageBloc _seriesListPageBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _seriesListPageBloc = SeriesListPageBloc()
      ..add(GetSeriesListBaseOnCategory(categoryUrl: widget.categoryUrl));
  }

  @override
  void dispose() {
    _seriesListPageBloc.close();
    super.dispose();
  }

  void retryFunction() async {
    _seriesListPageBloc
        .add(GetSeriesListBaseOnCategory(categoryUrl: widget.categoryUrl));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.categoryName,
          style: logoTextStyle,
        ),
      ),
      body: BlocConsumer<SeriesListPageBloc, SeriesListPageState>(
        bloc: _seriesListPageBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is SeriesListPageLoadingState) {
            return const Center(
              child: const CircularProgressIndicator(),
            );
          } else if (state is SeriesListPageLoadedState) {
            return ListScreen(
              list: state.seriesList,
              searchHint: searchHint,
              navigationFunction: (series) {
                return Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SeriesDetailPage(
                        series: series,
                      );
                    },
                  ),
                );
              },
            );
          } else if (state is SeriesListPageNoInternetState) {
            return CustomeErrorWidget(
                retryFunction: retryFunction, errorTitle: titleNetworkError);
          } else {
            return CustomeErrorWidget(
              retryFunction: retryFunction,
              errorTitle: titleGeneralError,
            );
          }
        },
      ),
    );
  }
}
