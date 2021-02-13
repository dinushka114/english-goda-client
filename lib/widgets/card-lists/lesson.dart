import 'package:client_update/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Lesson extends StatelessWidget {
  final String title;

  Lesson({
    Key key,
    @required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30.0),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Constants.lightViolet,
      ),
      child: Row(
        children: <Widget>[
          SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Constants.textDark
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}