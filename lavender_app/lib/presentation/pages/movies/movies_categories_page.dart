import 'package:flutter/material.dart';
import 'package:lavender/presentation/pages/movies/movies_list_page.dart';

import '../../../data/movies/movies_categories.dart';
import '../../../utils/constants.dart';
import '../../widgets/categories_widget.dart';

class MoviesCategoriesPage extends StatefulWidget {
  const MoviesCategoriesPage({Key key}) : super(key: key);

  @override
  _MoviesCategoriesPageState createState() => _MoviesCategoriesPageState();
}

class _MoviesCategoriesPageState extends State<MoviesCategoriesPage> {
  var movieCateroiesList = movieCategories;

  @override
  void initState() {
    super.initState();
  }

  void onSearchBarValueChangeFunction(String searchText) {
    final searchedChannels = movieCategories.where((category) {
      final categoryNameToLowerCase = category.categoryName.toLowerCase();
      final searchTextToLowerCase = searchText.toLowerCase();

      return categoryNameToLowerCase.contains(searchTextToLowerCase);
    }).toList();

    setState(() {
      this.movieCateroiesList = searchedChannels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Movies Categories',
            style: logoTextStyle,
          ),
        ),
        body: CategoriesWidget(
          onSearchBarValueChangeFunction: onSearchBarValueChangeFunction,
          categoriesList: movieCateroiesList,
          onTapNavigate: (categoryUrl, categoryName) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return MovieListPage(
                  categoryUrl: categoryUrl, categoryName: categoryName);
            }));
          },
        ));
  }
}
