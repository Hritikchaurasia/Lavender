import 'package:flutter/material.dart';

class ChannelCard extends StatelessWidget {
  final String channelName;
  final String channelLogo;
  final Size size;

  const ChannelCard(
      {Key key,
      @required this.channelName,
      @required this.channelLogo,
      @required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                      image: NetworkImage(channelLogo), fit: BoxFit.fill)),
            ),
          ),
        ],
      ),
    );
  }
}
