import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../pages/view_media_page.dart';

class HorizontalItemsList extends StatelessWidget {
  final String listTitle;
  final List list;
  const HorizontalItemsList(
      {Key key, @required this.listTitle, @required this.list})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  listTitle,
                  style: listTitleStyle,
                ),
              ),
              Container(
                child: Text(
                  '(${list.length})',
                  style: listTitleStyle,
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 5.0),
            height: 170.0,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ViewMediaPage(source: list[index].url);
                      }));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      height: 150.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(list[index].logo),
                            fit: BoxFit.contain,
                          ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
