import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class SearchBar extends StatefulWidget {
  final String searchHint;
  final Function onchangeFunction;
  const SearchBar({
    Key key,
    @required this.searchHint,
    @required this.onchangeFunction,
  }) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(50.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
      child: TextField(
        enableSuggestions: true,
        controller: textEditingController,
        cursorColor: darkBlueColor,
        style: TextStyle(color: Colors.white.withOpacity(.8)),
        decoration: InputDecoration(
            focusColor: darkBlueColor,
            border: InputBorder.none,
            hintText: widget.searchHint,
            prefixIcon: InkWell(
              child: Icon(CupertinoIcons.search, color: darkBlueColor),
              onTap: () {
                FocusScope.of(context).unfocus();
              },
            ),
            suffixIcon: textEditingController.text.isNotEmpty
                ? InkWell(
                    child: Icon(
                      CupertinoIcons.clear,
                      color: Colors.redAccent,
                    ),
                    onTap: () {
                      textEditingController.clear();
                      widget.onchangeFunction('');
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                  )
                : null),
        onChanged: widget.onchangeFunction,
      ),
    );
  }
}
