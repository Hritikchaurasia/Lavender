import 'package:flutter/material.dart';
import 'package:lavender/data/comming_soon/comming_soon.dart';

class CommingSoonBanner extends StatelessWidget {
  final Size size;
  final List<CommingSoon> commingSoonList;
  const CommingSoonBanner(
      {Key key, @required this.size, @required this.commingSoonList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.25,
      child: Center(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: commingSoonList.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal:10.0),
                width: size.width * 0.8,
                height: size.height * 0.25,
                child: Center(
                  child: Text(commingSoonList[index].name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 24.0)),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: NetworkImage(commingSoonList[index].logo),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
