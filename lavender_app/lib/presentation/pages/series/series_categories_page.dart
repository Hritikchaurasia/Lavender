import 'package:flutter/material.dart';

import '../../../data/series/series_categories.dart';
import '../../../utils/constants.dart';
import '../../widgets/categories_widget.dart';
import 'series_list_page.dart';

class SeriesCategoriesPage extends StatefulWidget {
  const SeriesCategoriesPage({Key key}) : super(key: key);

  @override
  _SeriesCategoriesPageState createState() => _SeriesCategoriesPageState();
}

class _SeriesCategoriesPageState extends State<SeriesCategoriesPage> {
  var seriesCateroiesList = seriesCategories;

  @override
  void initState() {
    super.initState();
  }

  void onSearchBarValueChangeFunction(String searchText) {
    final searchedChannels = seriesCategories.where((category) {
      final categoryNameToLowerCase = category.categoryName.toLowerCase();
      final searchTextToLowerCase = searchText.toLowerCase();

      return categoryNameToLowerCase.contains(searchTextToLowerCase);
    }).toList();

    setState(() {
      this.seriesCateroiesList = searchedChannels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Series Categories',
            style: logoTextStyle,
          ),
        ),
        body: CategoriesWidget(
          onSearchBarValueChangeFunction: onSearchBarValueChangeFunction,
          categoriesList: seriesCateroiesList,
           onTapNavigate: (categoryUrl, categoryName) {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return SeriesListPage(
                  categoryUrl: categoryUrl, categoryName: categoryName);
            }));
          },
        ));
  }
}
