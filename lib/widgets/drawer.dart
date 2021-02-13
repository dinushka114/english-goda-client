import 'package:client_update/utils/constants.dart';
import 'package:client_update/widgets/card-lists/drawer-tiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String currentRoute = "/grammarHomePage";

Widget drawer(BuildContext context) {
  return Container(
    child: Drawer(
      elevation: 5,
      child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.blueMain,
                ),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      child: Image.asset("assets/images/blob_2.png",
                          width: 352,
                          height: 343,
                          color: Constants.blueDark
                      ),
                      top: -100,
                      right: -130,
                    ),
                    Positioned(
                      child: Image.asset("assets/images/blob_1.png",
                          width: 252,
                          height: 303,
                          color: Constants.blueLight
                      ),
                      top: 15,
                      left: -100,
                    ),
                    Positioned(
                      child: Material(
                        color: Constants.lightViolet,
                        borderRadius: BorderRadius.all(Radius.circular(100.0)),
                        elevation: 10,
                        child: Image.asset("assets/images/logo.png",
                            width: 152,

                        ),
                      ),
                      top: 40,
                      left: 75,
                    ),
                    Positioned(
                      child: Text("Your Personal O/L English Tutor",
                        style: TextStyle(color: Constants.lightViolet,
                          fontWeight: FontWeight.w900,
                          fontSize: 18
                        ),

                      ),
                      top: 210,
                      left: 18,

                    ),
                    Padding(
                      padding: EdgeInsets.all(Constants.mainPadding),
                      child: ListView(
                        scrollDirection: Axis.vertical,
                        children: [
                          SizedBox(height: Constants.mainPadding * 11),
                         GestureDetector(
                           onTap: (){
                             doRoute(context, '/grammarHomePage');
                           },
                             child: DrawerTile(title: "Grammar ")
                         ),
                          GestureDetector(
                              onTap: (){
                                doRoute(context, '/vocabularyHomePage');
                              },
                              child: DrawerTile(title: "Vocabulary & Writing")),
                          GestureDetector(
                              onTap: (){
                                doRoute(context, '/essayHomePage');
                              },
                              child: DrawerTile(title: "Essays")),
                          GestureDetector(
                              onTap: (){
                                doRoute(context, '/pastPaperHome');
                              },
                              child: DrawerTile(title: "Past Papers")),


                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListTile(
              tileColor: Constants.blueMain,
              title: Text("By one0 Apps",textAlign: TextAlign.center,style: TextStyle(color: Constants.lightViolet),),
              subtitle:Text("one0apps.online@gmail.com",textAlign: TextAlign.center,style: TextStyle(color: Constants.lightViolet)) ,
            )
          ],
      ),
    ),
  );
}

void doRoute(BuildContext context, String name) {
  if (currentRoute != name)
    Navigator.pushReplacementNamed(context, name);
  else
    Navigator.pop(context);

  currentRoute = name;
}