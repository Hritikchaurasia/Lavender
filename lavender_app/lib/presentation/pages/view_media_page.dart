import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lavender/utils/constants.dart';
import 'package:yoyo_player/yoyo_player.dart';

class ViewMediaPage extends StatefulWidget {
  final String source;
  const ViewMediaPage({Key key, @required this.source}) : super(key: key);

  @override
  _ViewMediaPageState createState() => _ViewMediaPageState();
}

class _ViewMediaPageState extends State<ViewMediaPage> {
  
  

 

  @override
  Widget build(BuildContext context) {
   var aspectRatio =   MediaQuery.of(context).orientation == Orientation.portrait ? 16/9 : 1.0  ;
    return Scaffold(
      body: widget.source.isNotEmpty
          ? Container(
              child: Center(
                child: YoYoPlayer(
                  
                  aspectRatio: aspectRatio,
                  url: widget.source,
                  videoStyle: VideoStyle(
                    play:  Icon(CupertinoIcons.play_circle),
                    pause:  Icon(CupertinoIcons.play_circle),
                  ),
                  videoLoadingStyle: VideoLoadingStyle(
                    loading: Center(
                        child: Column(
                      children: const [
                        const CircularProgressIndicator(
                          backgroundColor: whiteColor,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const Text(
                          "Loading video",
                          style: TextStyle(color: whiteColor),
                        ),
                      ],
                    )),
                  ),
                ),
              ),
            )
          : Center(
              child: Container(
                child: Text(
                  'Source down',
                  style: TextStyle(color: whiteColor),
                ),
              ),
            ),
    );
  }
}
