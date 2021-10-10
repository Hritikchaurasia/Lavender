import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants.dart';
import '../../bloc/channel_page_bloc/channelpage_bloc.dart';
import '../../widgets/channel_screen.dart';
import '../../widgets/error_widget.dart';

class ChannelPage extends StatefulWidget {
  const ChannelPage({Key key}) : super(key: key);

  @override
  _ChannelPageState createState() => _ChannelPageState();
}

class _ChannelPageState extends State<ChannelPage> {
  static const titleGeneralError = 'Error occure';
  static const titleNetworkError = 'No Internet Connection';

  ChannelPageBloc _channelPageBloc;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _channelPageBloc = ChannelPageBloc()..add(GetChannelListData());
  }

  @override
  void dispose() {
    _channelPageBloc.close();
    super.dispose();
  }

  void retryFunction() async {
    _channelPageBloc.add(GetChannelListData());
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tv Channel',
            style: logoTextStyle,
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<ChannelPageBloc, ChannelPageState>(
          bloc: _channelPageBloc,
          listener: (context, state) {},
          builder: (context, state) {
            if (state is ChannelPageLoadingState) {
              return const Center(child: const CircularProgressIndicator());
            } else if (state is ChannelPageLoadedState) {
              return ChannelScreen(size: size, channelList: state.channelList);
            } else if (state is ChannelPageNoInternetState) {
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
        ));
  }
}
