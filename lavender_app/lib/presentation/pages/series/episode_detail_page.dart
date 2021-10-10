import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/series/episode.dart';
import '../../../utils/constants.dart';
import '../../widgets/widget_information_box.dart';
import '../view_media_page.dart';

class EpisodeDetailPage extends StatefulWidget {
  final Episode episode;
  const EpisodeDetailPage({Key key, @required this.episode}) : super(key: key);

  @override
  _EpisodeDetailPageState createState() => _EpisodeDetailPageState();
}

class _EpisodeDetailPageState extends State<EpisodeDetailPage> {
  static const String language = 'Language: ';
  static const String play = 'Play';

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: width,
                height: height * 0.4,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.episode.episodeLogo),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          CupertinoIcons.back,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    sized50,
                    Column(
                      children: [
                        Container(
                          width: width,
                          child: Center(
                            child: Text(
                              widget.episode.episodeName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                    height < 680 ? sized40 : sized50,
                    Container(
                      width: width,
                      child: Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return ViewMediaPage(
                                  source: widget.episode.episodeUrl);
                            }));
                          },
                          child: Container(
                            width: width * 0.5,
                            height: height * 0.05,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                color: Colors.redAccent),
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: const [
                                  sized50,
                                  const Icon(CupertinoIcons.play),
                                  sized50,
                                  const Text(
                                    play,
                                  ),
                                  sized50
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              sized30,
              WidgetInformationBox(
                width: width,
                text: widget.episode.episodeDescription,
                title: language,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
