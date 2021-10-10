import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../data/comming_soon/comming_soon.dart';
import '../../../data/movies/movies.dart';
import '../../../domain/repositories/network_repo.dart';

part 'homepage_event.dart';
part 'homepage_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  static final networkRepo = NetworkRepo();
  HomePageBloc() : super(HomePageLoadingState());

  @override
  Stream<HomePageState> mapEventToState(
    HomePageEvent event,
  ) async* {
    if (event is GetHomePageData) {
      yield HomePageLoadingState();
      try {
        // print(DateTime.now().toString());
        // final value = await Future.wait(
        //     [networkRepo.trendingList(), networkRepo.getFeaturedBanner(),networkRepo.newArrivalList() , networkRepo.getCommingSoonList()]);

        // value.forEach((element) {
        //   print(element.toString());
        //   element.forEach((subelement) {
        //     print(subelement.toString());
        //   });
        // });
        // print(DateTime.now().toString());
        final List trendingList = await networkRepo.trendingList();
        final Movie featuredBanner = await networkRepo.getFeaturedBanner();
        final List newArrivals = await networkRepo.newArrivalList();
        final List<CommingSoon> commingSoonList =
            await networkRepo.getCommingSoonList();
        // print(DateTime.now().toString());
        yield HomePageLoadedState(
            trendingList: trendingList,
            featuredBanner: featuredBanner,
            newArrivals: newArrivals,
            commingSoonList: commingSoonList);
      } on IOException {
        yield HomePageNoInternetState();
      } catch (e) {
        print(e.toString());
        yield HomePageErrorState();
      }
    }
  }
}
