import 'package:client_update/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class HeaderCategories extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.vertical(bottom: Radius.circular(50.0)),
              color: Constants.blueLight,
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                  child: Image.asset("assets/images/blob_2.png",
                      width: 342,
                      height: 303,
                      color: Constants.blueDark),
                  top: -100,
                  right: -100,
                ),
                Positioned(
                  child: Image.asset("assets/images/blob_1.png",
                      width: 352,
                      height: 343,
                      color: Constants.blueMain),
                  top: 40,
                  left: -140,
                ),
              ],
            ),
          ),
          flex: 1,
        ),
      ],
    );
  }
}