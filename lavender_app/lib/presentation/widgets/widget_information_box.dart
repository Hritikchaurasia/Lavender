import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class WidgetInformationBox extends StatelessWidget {
  const WidgetInformationBox({
    Key key,
    @required this.width,
    @required this.text,
    @required this.title,
  }) : super(key: key);

  final double width;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
      ),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 15.0,
            color: whiteColor,
          ),
          children: <TextSpan>[
            TextSpan(text: title),
            TextSpan(
              text: text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
