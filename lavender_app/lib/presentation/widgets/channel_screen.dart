import 'package:flutter/material.dart';

import '../../data/channels/channel.dart';
import '../../utils/constants.dart';
import '../pages/view_media_page.dart';
import 'channel_card.dart';
import 'search_bar.dart';

class ChannelScreen extends StatefulWidget {
  const ChannelScreen({
    Key key,
    @required this.size,
    @required this.channelList,
  }) : super(key: key);

  final Size size;
  final List<Channel> channelList;

  @override
  _ChannelScreenState createState() => _ChannelScreenState();
}

class _ChannelScreenState extends State<ChannelScreen> {
  List<Channel> channels = [];

  @override
  void initState() {
    super.initState();
    channels = widget.channelList;
  }

  void onSearchBarValueChangeFunction(String searchText) {
    final searchedChannels = widget.channelList.where((channel) {
      final channelNameToLowerCase = channel.name.toLowerCase();
      final searchTextToLowerCase = searchText.toLowerCase();

      return channelNameToLowerCase.contains(searchTextToLowerCase);
    }).toList();

    setState(() {
      this.channels = searchedChannels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          sized10,
          SearchBar(
            searchHint: searchChannels,
            onchangeFunction: onSearchBarValueChangeFunction,
          ),
          sized10,
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20.0,
                    mainAxisSpacing: 20.0),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: channels.length,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return ViewMediaPage(source: channels[index].url);
                        }));
                      },
                      child: ChannelCard(
                        channelName: channels[index].name,
                        channelLogo: channels[index].logo,
                        size: widget.size,
                      ));
                }),
          ),
        ],
      ),
    );
  }
}
