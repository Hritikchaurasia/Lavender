import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../data/channels/channel.dart';
import '../../data/comming_soon/comming_soon.dart';
import '../../data/movies/movies.dart';
import '../../data/series/series.dart';
import '../../utils/network_constants.dart';

class NetworkRepo {
  static final client = http.Client();
  static const Map<String, String> tokenData = {
    "Content-type": "application/x-www-form-urlencoded",
    "Authorization": NetworkConstants.token
  };

  /// This is for channel section

  //get indian channel list
  Future<List<Channel>> indianChannelList() async {
    List<Channel> channelList = [];
    try {
      final response = await client.get(
          Uri.parse('${NetworkConstants.baseUrl}indianChannelList'),
          headers: tokenData);
      List parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      parsed.forEach((_mapElement) {
        channelList.add(Channel.fromMap(_mapElement));
      });

      return channelList;
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  ///this is for home page section

  //get featured banner
  Future<Movie> getFeaturedBanner() async {
    try {
      final response = await client.get(
          Uri.parse('${NetworkConstants.baseUrl}featuredBanner'),
          headers: tokenData);

      final movie = Movie.fromJson(response.body);

      return movie;
    } catch (e) {
      throw (e);
    }
  }

  //get trending list
  Future<List<Movie>> trendingList() async {
    List<Movie> trendingList = [];
    try {
      final response = await client.get(
          Uri.parse('${NetworkConstants.baseUrl}trendingList'),
          headers: tokenData);
      List parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      parsed.forEach((_mapElement) {
        trendingList.add(Movie.fromMap(_mapElement));
      });

      return trendingList;
    } catch (e) {
      throw (e);
    }
  }

  //new arrivals list
  Future<List<Movie>> newArrivalList() async {
    List<Movie> newArrivals = [];
    try {
      final response = await client.get(
          Uri.parse('${NetworkConstants.baseUrl}newarrivals'),
          headers: tokenData);
      List parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      parsed.forEach((_mapElement) {
        newArrivals.add(Movie.fromMap(_mapElement));
      });

      return newArrivals;
    } catch (e) {
      throw (e);
    }
  }

  //comming_soon
  Future<List<CommingSoon>> getCommingSoonList() async {
    List<CommingSoon> commingsoonList = [];

    try {
      final response = await client.get(
          Uri.parse('${NetworkConstants.baseUrl}commingsoon'),
          headers: tokenData);
      List parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      parsed.forEach((commingsoonElement) {
        commingsoonList.add(CommingSoon.fromMap(commingsoonElement));
      });

      return commingsoonList;
    } catch (e) {
      print(e.toString());
      throw (e);
    }
  }

  /// movie page

  //get movie list according to category
  Future<List<Movie>> getMovieCategoryList(String categoryUrl) async {
    List<Movie> movieList = [];
    try {
      final response = await client.get(
          Uri.parse('${NetworkConstants.baseUrl}$categoryUrl'),
          headers: tokenData);
      List parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      parsed.forEach((_mapElement) {
        movieList.add(Movie.fromMap(_mapElement));
      });
      return movieList;
    } catch (e) {
      throw (e);
    }
  }

  ///series page

  //get series list according to category
  Future<List<Series>> getSeriesCategoryList(String categoryUrl) async {
    List<Series> seriesList = [];
    try {
      final response = await client.get(
          Uri.parse('${NetworkConstants.baseUrl}$categoryUrl'),
          headers: tokenData);
      List parsed = jsonDecode(response.body).cast<Map<String, dynamic>>();

      parsed.forEach((_mapElement) {
        seriesList.add(Series.fromMap(_mapElement));
      });
      return seriesList;
    } catch (e) {
      throw (e);
    }
  }
}
