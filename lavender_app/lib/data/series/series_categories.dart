import 'package:flutter/foundation.dart';

class SeriesCategories {
  final String categoryName;
  final String categoryUrl;
  final String categoryLogo;
  const SeriesCategories(
      {@required this.categoryUrl,
      @required this.categoryLogo,
      @required this.categoryName});
}

const List<SeriesCategories> seriesCategories = const [
  SeriesCategories(
      categoryName: 'Action',
      categoryUrl: 'actionSeries',
      categoryLogo:
          'https://t3.gstatic.com/images?q=tbn:ANd9GcQzBPeJBL1nrbE44py9eA0PFWzRQjQlW4NwjIBKuOMjVi4ou8UR'),
  SeriesCategories(
      categoryName: 'Adventure',
      categoryUrl: 'adventureSeries',
      categoryLogo:
          'https://t3.gstatic.com/images?q=tbn:ANd9GcQzBPeJBL1nrbE44py9eA0PFWzRQjQlW4NwjIBKuOMjVi4ou8UR'),
  SeriesCategories(
      categoryName: 'Animated',
      categoryUrl: 'animatedSeries',
      categoryLogo:
          'https://t3.gstatic.com/images?q=tbn:ANd9GcQzBPeJBL1nrbE44py9eA0PFWzRQjQlW4NwjIBKuOMjVi4ou8UR'),
  SeriesCategories(
      categoryName: 'Comedies',
      categoryUrl: 'comediesSeries',
      categoryLogo:
          'https://images.unsplash.com/photo-1509248961158-e54f6934749c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&q=80'),
  SeriesCategories(
      categoryName: 'Dramas',
      categoryUrl: 'dramasSeries',
      categoryLogo:
          'https://images.unsplash.com/photo-1509248961158-e54f6934749c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&q=80'),
  SeriesCategories(
      categoryName: 'Horror',
      categoryUrl: 'horrorSeries',
      categoryLogo:
          'https://images.unsplash.com/photo-1509248961158-e54f6934749c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&q=80'),
  SeriesCategories(
      categoryName: 'Musical',
      categoryUrl: 'musicalSeries',
      categoryLogo:
          'https://images.unsplash.com/photo-1509248961158-e54f6934749c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&q=80'),
  SeriesCategories(
      categoryName: 'Other',
      categoryUrl: 'otherSeries',
      categoryLogo:
          'https://images.unsplash.com/photo-1509248961158-e54f6934749c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&q=80'),
  SeriesCategories(
      categoryName: 'RealLife',
      categoryUrl: 'reallifeSeries',
      categoryLogo:
          'https://images.unsplash.com/photo-1509248961158-e54f6934749c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&q=80'),
  SeriesCategories(
      categoryName: 'Romantic',
      categoryUrl: 'romanticSeries',
      categoryLogo:
          'https://images.unsplash.com/photo-1509248961158-e54f6934749c?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&q=80'),
];
