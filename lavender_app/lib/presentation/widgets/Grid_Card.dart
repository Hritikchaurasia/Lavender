import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/constants.dart';

class GridCard extends StatelessWidget {
  final String name;
  
  final String logoUrl;

  const GridCard(
      {Key key,
      @required this.name,
  
      @required this.logoUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        
        gradient: 
            LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [darkBlueColor , darkGreyColor]),
      ),
      child: Column(children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0)),
                image: DecorationImage(
                  image: NetworkImage(
                    logoUrl,
                  ),
                  fit: BoxFit.cover,
                )),
          ),
        ),
        sized5,
       RichText(
         
         text: TextSpan(
         text: name,
         style: listTitleStyle
       )),
        sized5
      ]),
    );
  }
}
