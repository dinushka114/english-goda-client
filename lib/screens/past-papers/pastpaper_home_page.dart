import 'package:client_update/http_services/http_service.dart';
import 'package:client_update/screens/grammer_lessons/grammer_lesson_categories.dart';
import 'package:client_update/utils/constants.dart';
import 'package:client_update/widgets/card-lists/latest_lesson_card.dart';
import 'package:client_update/widgets/card-lists/pastpaper_card.dart';
import 'package:client_update/widgets/drawer.dart';
import 'package:client_update/widgets/headers/home_page_header.dart';
import 'package:client_update/widgets/spinner.dart';
import 'package:flutter/material.dart';

class PastPaperHomePage extends StatelessWidget {

  HttpService httpService = HttpService();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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

              ),
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
                  child: Icon(Icons.menu, color: Colors.white),
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    // debugPrint("Menu pressed");
                    _scaffoldKey.currentState.openDrawer();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: drawer(context),
      body: Stack(
        children: [
          HomeHeader(),
          Padding(
            padding: EdgeInsets.all(Constants.mainPadding),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                SizedBox(height: Constants.mainPadding * 2),

                // 1. Welcome User
                Text(
                  "Past Papers from 2010",
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),

                SizedBox(height: Constants.mainPadding),

                // 3. Start Learning Button Section
                Stack(
                  children: <Widget>[
                    FutureBuilder(
                        future : httpService.fetchPapers(),
                        builder: (BuildContext context , AsyncSnapshot snap){
                          if(snap.hasData){
                            return ListView.builder(
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snap.data.length,
                                itemBuilder: (BuildContext context , int index){
                                  return PastPaperCard(paper: snap.data[index]);

                                }
                            );
                          }
                          return Center(child:loadingSpinKit(context));
                        }
                    ),

                  ],
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
