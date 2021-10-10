import 'package:flutter/material.dart';
import 'package:lavender/data/series/episode.dart';

import '../../data/series/seasons.dart';
import '../../utils/constants.dart';

class SeriesSeasonDisplayCard extends StatelessWidget {
  final Seasons seasons;
  final Episode episode;
  const SeriesSeasonDisplayCard({
     this.seasons,
     this.episode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: darkGreyColor,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                    image: NetworkImage(seasons!=null ? seasons.seasonLogo: episode.episodeLogo),
                    fit: BoxFit.cover)),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                seasons!=null ? seasons.seasonName: episode.episodeName,
                style: TextStyle(
                    color: whiteColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 26.0),
              ),
              Text(
                seasons!=null ? seasons.seasonDescription: episode.episodeDescription,
                style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.w300,
                    fontSize: 20.0),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
