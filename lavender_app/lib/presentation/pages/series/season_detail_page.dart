import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../data/series/seasons.dart';
import '../../../utils/constants.dart';
import '../../widgets/series_season_display_card.dart';
import '../../widgets/widget_information_box.dart';
import 'episode_detail_page.dart';

class SeasonDetailPage extends StatefulWidget {
  final Seasons season;
  const SeasonDetailPage({
    Key key,
    @required this.season,
  }) : super(key: key);

  @override
  _SeasonDetailPageState createState() => _SeasonDetailPageState();
}

class _SeasonDetailPageState extends State<SeasonDetailPage> {
  static const String description = 'Description: ';
  static const String episodes = 'Episodes';

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
                height: height * 0.3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(widget.season.seasonLogo),
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
                    sized40,
                    Column(
                      children: [
                        Container(
                          width: width,
                          child: Center(
                            child: Text(
                              widget.season.seasonName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              sized30,
              WidgetInformationBox(
                width: width,
                text: widget.season.seasonDescription,
                title: description,
              ),
              sized30,
              Center(
                child: const Text(
                  episodes,
                  style: commingSoonTitleStyle,
                ),
              ),
              ...widget.season.episodes.map((item) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return EpisodeDetailPage(episode: item);
                    }));
                  },
                  child: SeriesSeasonDisplayCard(episode: item),
                );
              }).toList()
            ],
          ),
        ),
      ),
    );
  }
}
