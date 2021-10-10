import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import '../../../data/channels/channel.dart';
import '../../../domain/repositories/network_repo.dart';

part 'channelpage_event.dart';
part 'channelpage_state.dart';

class ChannelPageBloc extends Bloc<ChannelPageEvent, ChannelPageState> {
  ChannelPageBloc() : super(ChannelPageLoadingState());

  @override
  Stream<ChannelPageState> mapEventToState(
    ChannelPageEvent event,
  ) async* {
    if (event is GetChannelListData) {
      yield ChannelPageLoadingState();
      try {
        final List<Channel> channelList =
            await NetworkRepo().indianChannelList();
        yield ChannelPageLoadedState(channelList: channelList);
      } on IOException {
        yield ChannelPageNoInternetState();
      } catch (e) {
        print(e.toString());
        yield ChannelPageErrorState();
      }
    }
  }
}
