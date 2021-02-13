import 'package:client_update/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class ErrorHeader extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color:Constants.redMain ,
            ),
            child: Stack(
              children: <Widget>[

              ],
            ),
          ),
        ),
      ],
    );
  }
}