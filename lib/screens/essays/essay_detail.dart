import 'package:client_update/models/models.dart';
import 'package:client_update/utils/constants.dart';
import 'package:client_update/widgets/headers/lessons_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class EssayDetail extends StatelessWidget {

  final Essay essay;

  const EssayDetail({Key key, this.essay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: new EdgeInsets.symmetric(
                    horizontal: Constants.mainPadding,
                    vertical: Constants.mainPadding
                ),
                height: 44,
                width: 44,
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  color: Colors.white.withOpacity(0.3),
                  child: Icon(
                      Icons.keyboard_backspace,
                      color: Colors.white
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
          children:[
            HeaderCategories(),
            Padding(
              padding: EdgeInsets.all(Constants.mainPadding),
              child: ListView(

                scrollDirection: Axis.vertical,
                children: <Widget>[

                  Text(
                    this.essay.title,
                    style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                  ),

                  SizedBox(height: Constants.mainPadding * 2),

                  HtmlWidget(this.essay.content,
                    textStyle: TextStyle(color: Colors.white),
                  ),

                ],
              ),
            ),
          ]
      ),
    );
  }
}