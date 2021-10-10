import 'package:flutter/foundation.dart';

class MoviesCategories {
  final String categoryName;
  final String categoryUrl;
  final String categoryLogo;
  const MoviesCategories(
      {@required this.categoryUrl,
      @required this.categoryLogo,
      @required this.categoryName});
}

const List<MoviesCategories> movieCategories = const [
  MoviesCategories(
      categoryName: 'Action',
      categoryUrl: 'actionMovies',
      categoryLogo:
          'https://t3.gstatic.com/images?q=tbn:ANd9GcQzBPeJBL1nrbE44py9eA0PFWzRQjQlW4NwjIBKuOMjVi4ou8UR'),
  MoviesCategories(
      categoryName: 'Adventure',
      categoryUrl: 'adventureMovies',
      categoryLogo:
          'https://t3.gstatic.com/images?q=tbn:ANd9GcQzBPeJBL1nrbE44py9eA0PFWzRQjQlW4NwjIBKuOMjVi4ou8UR'),
  MoviesCategories(
      categoryName: 'Animated',
      categoryUrl: 'animatedMovies',
      categoryLogo:
          'https://t3.gstatic.com/images?q=tbn:ANd9GcQzBPeJBL1nrbE44py9eA0PFWzRQjQlW4NwjIBKuOMjVi4ou8UR'),
  MoviesCategories(
      categoryName: 'Comedies',
      categoryUrl: 'comediesMovies',
      categoryLogo:
          'https://images.unsplash.com/photo-1509248961158-e54f6934749c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&q=80'),
  MoviesCategories(
      categoryName: 'Dramas',
      categoryUrl: 'dramasMovies',
      categoryLogo:
          'https://images.unsplash.com/photo-1509248961158-e54f6934749c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&q=80'),
  MoviesCategories(
      categoryName: 'Horror',
      categoryUrl: 'horrorMovies',
      categoryLogo:
          'https://images.unsplash.com/photo-1509248961158-e54f6934749c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&q=80'),
  MoviesCategories(
      categoryName: 'Musical',
      categoryUrl: 'musicalMovies',
      categoryLogo:
          'https://images.unsplash.com/photo-1509248961158-e54f6934749c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&q=80'),
  MoviesCategories(
      categoryName: 'Other',
      categoryUrl: 'otherMovies',
      categoryLogo:
          'https://images.unsplash.com/photo-1509248961158-e54f6934749c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&q=80'),
  MoviesCategories(
      categoryName: 'RealLife',
      categoryUrl: 'reallifeMovies',
      categoryLogo:
          'https://images.unsplash.com/photo-1509248961158-e54f6934749c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&q=80'),
  MoviesCategories(
      categoryName: 'Romantic',
      categoryUrl: 'romanticMovies',
      categoryLogo:
          'https://images.unsplash.com/photo-1509248961158-e54f6934749c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&q=80'),
];
