import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'Grid_Card.dart';
import 'search_bar.dart';

class CategoriesWidget extends StatelessWidget {
  final Function onSearchBarValueChangeFunction;
  final Function(String, String) onTapNavigate;
  final List categoriesList;

  const CategoriesWidget(
      {Key key,
      @required this.onSearchBarValueChangeFunction,
      @required this.categoriesList,
      @required this.onTapNavigate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        sized10,
        SearchBar(
          searchHint: searchCategories,
          onchangeFunction: onSearchBarValueChangeFunction,
        ),
        sized10,
        GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: categoriesList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => onTapNavigate(categoriesList[index].categoryUrl,
                    categoriesList[index].categoryName),
                child: GridCard(
                  name: categoriesList[index].categoryName,
                  logoUrl: categoriesList[index].categoryLogo,
                ),
              );
            }),
      ],
    );
  }
}
