import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lavender/presentation/pages/series/season_detail_page.dart';

import '../../../data/series/series.dart';
import '../../../utils/constants.dart';
import '../../widgets/series_season_display_card.dart';
import '../../widgets/widget_information_box.dart';

class SeriesDetailPage extends StatefulWidget {
  final Series series;
  const SeriesDetailPage({Key key, @required this.series}) : super(key: key);

  @override
  _SeriesDetailPageState createState() => _SeriesDetailPageState();
}

class _SeriesDetailPageState extends State<SeriesDetailPage> {
  static const String language = 'Language: ';
  static const String description = 'Description: ';
  static const String seasons = 'Seasons';

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
                    image: NetworkImage(widget.series.logo),
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
                              widget.series.name,
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
                text: widget.series.language,
                title: language,
              ),
              sized10,
              WidgetInformationBox(
                width: width,
                text: widget.series.description,
                title: description,
              ),
              sized30,
              Center(
                child: const Text(
                  seasons,
                  style: commingSoonTitleStyle,
                ),
              ),
              ...widget.series.seasons.map((item) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SeasonDetailPage(season: item);
                    }));
                  },
                  child: SeriesSeasonDisplayCard(
                    seasons: item,
                  ),
                );
              }).toList()
            ],
          ),
        ),
      ),
    );
  }
}
