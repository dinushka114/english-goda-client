import 'package:client_update/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class HomeHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Constants.salmonMain,
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Image.asset("assets/images/blob_2.png",
                      width: 352,
                      height: 343,
                      color: Constants.salmonDark
                  ),
                  top: -100,
                  right: -130,
                ),
                Positioned(
                  child: Image.asset("assets/images/blob_1.png",
                      width: 252,
                      height: 303,
                      color: Constants.salmonLight
                  ),
                  top: 15,
                  left: -100,
                ),
                Positioned(
                  child: Image.asset("assets/images/boy_illustration.png",
                      width: 160,
                      height: 360),
                  bottom: 0,
                  right: 0,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}