import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/comming_soon/comming_soon.dart';
import '../widgets/comming_soon_banner.dart';

import '../../utils/constants.dart';
import '../bloc/home_page_bloc/homepage_bloc.dart';
import '../widgets/error_widget.dart';
import '../widgets/home_screen_banner.dart';
import '../widgets/horizontal_items_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const titleGeneralError = 'Error occure';
  static const titleNetworkError = 'No Internet Connection';

  HomePageBloc _homePageBloc = HomePageBloc();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _homePageBloc.add(GetHomePageData());
  }

  @override
  void dispose() {
    _homePageBloc.close();
    super.dispose();
  }

  void retryFunction() async {
    _homePageBloc.add(GetHomePageData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomePageBloc, HomePageState>(
        bloc: _homePageBloc,
        builder: (context, state) {
          if (state is HomePageLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is HomePageLoadedState) {
            return WidgetHomePageLoadedState(
              newArrive: state.newArrivals,
              trendingList: state.trendingList,
              featuredBanner: state.featuredBanner,
              commingSoonList: state.commingSoonList,
            );
          } else if (state is HomePageNoInternetState) {
            return CustomeErrorWidget(
              retryFunction: retryFunction,
              errorTitle: titleNetworkError,
            );
          } else {
            return CustomeErrorWidget(
              retryFunction: retryFunction,
              errorTitle: titleGeneralError,
            );
          }
        },
      ),
    );
  }
}

class WidgetHomePageLoadedState extends StatelessWidget {
  static const String titleNewArrive = 'New Arrive';
  static const String titleTrending = 'Trending';
  static const String appTitle = 'LAVENDER';

  const WidgetHomePageLoadedState({
    Key key,
    @required this.newArrive,
    @required this.trendingList,
    @required this.featuredBanner,
    @required this.commingSoonList,
  }) : super(key: key);

  final List newArrive;
  final List trendingList;
  final featuredBanner;
  final List<CommingSoon> commingSoonList;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: NestedScrollView(
          physics: NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                pinned: true,
                floating: true,
                centerTitle: true,
                expandedHeight: size.height * 0.8,
                title: const Text(
                  appTitle,
                  style: logoTextStyle,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  background: HomeScreenBanner(
                    size: size,
                    featuredBanner: featuredBanner,
                  ),
                ),
              ),
            ];
          },
          body: ListView(
            shrinkWrap: true,
            children: [
              sized10,
              HorizontalItemsList(listTitle: titleTrending, list: trendingList),
              sized10,
              HorizontalItemsList(listTitle: titleNewArrive, list: newArrive),
              sized10,
              Container(
                  child: Center(
                      child: const Text(
                'Comming Soon',
                style: commingSoonTitleStyle,
              ))),
              sized20,
              CommingSoonBanner(size: size, commingSoonList: commingSoonList),
              sized20
            ],
          )),
    );
  }
}
