import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'Grid_Card.dart';
import 'search_bar.dart';

class ListScreen extends StatefulWidget {
  final List list;
  final Function(Object) navigationFunction;
  final searchHint;
  const ListScreen({
    Key key,
    @required this.list,
    @required this.navigationFunction,
    @required this.searchHint
  }) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List itemList = [];
  @override
  void initState() {
    super.initState();
    itemList = widget.list;
  }

  void onSearchBarValueChangeFunction(String searchText) {
    final searched = widget.list.where((item) {
      final listItemNameToLowerCase = item.name.toLowerCase();
      final searchTextToLowerCase = searchText.toLowerCase();

      return listItemNameToLowerCase.contains(searchTextToLowerCase);
    }).toList();

    setState(() {
      this.itemList = searched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      const SliverToBoxAdapter(
        child: SizedBox(
          height: 10.0,
        ),
      ),
      SliverToBoxAdapter(
          child: SearchBar(
              searchHint: widget.searchHint,
              onchangeFunction: onSearchBarValueChangeFunction)),
      const SliverToBoxAdapter(
        child: SizedBox(
          height: 10.0,
        ),
      ),
      SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 20.0, mainAxisSpacing: 20.0),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return GestureDetector(
              onTap: () => widget.navigationFunction(itemList[index]),
              child: GridCard(
                name: itemList[index].name,
                logoUrl: itemList[index].logo,
              ),
            );
          },
          childCount: itemList.length,
        ),
      ),
    ]);
  }
}
