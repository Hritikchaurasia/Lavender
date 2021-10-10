part of 'channelpage_bloc.dart';

abstract class ChannelPageState extends Equatable {
  const ChannelPageState();

  @override
  List<Object> get props => [];
}

class ChannelPageLoadingState extends ChannelPageState {
  const ChannelPageLoadingState();

  @override
  List<Object> get props => [];
}

class ChannelPageLoadedState extends ChannelPageState {
  final List<Channel> channelList;
  const ChannelPageLoadedState({@required this.channelList});

  @override
  List<Object> get props => [channelList];
}

class ChannelPageNoInternetState extends ChannelPageState {
  const ChannelPageNoInternetState();

  @override
  List<Object> get props => [];
}

class ChannelPageErrorState extends ChannelPageState {
  const ChannelPageErrorState();

  @override
  List<Object> get props => [];
}
