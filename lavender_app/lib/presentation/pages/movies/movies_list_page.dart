import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants.dart';
import '../../bloc/movie_list_page_bloc/movielistpage_bloc.dart';
import '../../widgets/error_widget.dart';
import '../../widgets/list_screen.dart';
import 'movie_detail_page.dart';

class MovieListPage extends StatefulWidget {
  final String categoryUrl;
  final String categoryName;
  const MovieListPage({
    Key key,
    @required this.categoryUrl,
    @required this.categoryName,
  }) : super(key: key);

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  static const titleGeneralError = 'Error occure';
  static const titleNetworkError = 'No Internet Connection';
   static const searchHint = 'Enter Movie Name';

  MovieListPageBloc _movieListPageBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _movieListPageBloc = MovieListPageBloc()
      ..add(GetMovieListBaseOnCategory(categoryUrl: widget.categoryUrl));
  }

  @override
  void dispose() {
    _movieListPageBloc.close();
    super.dispose();
  }

  void retryFunction() async {
    _movieListPageBloc
        .add(GetMovieListBaseOnCategory(categoryUrl: widget.categoryUrl));
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
      body: BlocConsumer<MovieListPageBloc, MovieListPageState>(
        bloc: _movieListPageBloc,
        listener: (context, state) {},
        builder: (context, state) {
          if (state is MovieListPageLoadingState) {
            return const Center(
              child: const CircularProgressIndicator(),
            );
          } else if (state is MovieListPageLoadedState) {
            return ListScreen(
              list: state.moviesList,
              searchHint: searchHint,
              navigationFunction: (movie) {
               return Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MovieDetailPage(
                        movie: movie,
                      );
                    },
                  ),
                );
              },
            );
          } else if (state is MovieListPageNoInternetState) {
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
