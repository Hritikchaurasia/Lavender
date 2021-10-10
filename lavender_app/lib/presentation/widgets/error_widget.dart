import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomeErrorWidget extends StatelessWidget {
  static const Padding errorButtonChild = const Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text('Retry',
          style: TextStyle(
              color: whiteColor, fontSize: 20.0, fontWeight: FontWeight.w400)));

  final Function retryFunction;
  final String errorTitle;

  const CustomeErrorWidget(
      {Key key, @required this.retryFunction, @required this.errorTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Center(

      child: Container(
        decoration: BoxDecoration(
            color: darkGreyColor, borderRadius: BorderRadius.circular(20.0)),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: size.width *0.7,
            maxWidth: size.width *0.7,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              sized30,
              Container(
               
                child: Text(
                  errorTitle,
                  style: TextStyle(
                      color: whiteColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.w500),
                ),
              ),
              sized30,
              ElevatedButton(
                onPressed: retryFunction,
                child: errorButtonChild,
              ),
              sized30,
            ],
          ),
        ),
      ),
    );
  }
}
