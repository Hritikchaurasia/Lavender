import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import '../pages/view_media_page.dart';

class HomeScreenBanner extends StatelessWidget {
  static const String watch = 'Watch';
  final Size size;
  final featuredBanner;
  const HomeScreenBanner({
    Key key,
    @required this.size,
    @required this.featuredBanner,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.7,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            height: size.height,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(featuredBanner.logo),
              fit: BoxFit.fill,
            )),
          ),
          Positioned(
              left: 0.0,
              top: size.height * 0.7,
              child: Container(
                width: size.width,
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return ViewMediaPage(source: featuredBanner.url);
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: whiteColor,
                          border: Border.all(
                            color: Colors.black,
                            style: BorderStyle.solid,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.7),
                                blurRadius: 3.0,
                                spreadRadius: 0.5)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            const Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: const Icon(
                                CupertinoIcons.play,
                                color: Colors.black,
                              ),
                            ),
                            const Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: const Text(
                                watch,
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
