import 'package:client_update/http_services/http_service.dart';
import 'package:client_update/screens/grammer_lessons/grammer_lesson_categories.dart';
import 'package:client_update/screens/vocabulary_lessons/vocabulary_lesson_categories.dart';
import 'package:client_update/screens/vocabulary_lessons/vocabulary_lesson_detail.dart';
import 'package:client_update/utils/constants.dart';
import 'package:client_update/widgets/card-lists/latest_lesson_card.dart';
import 'package:client_update/widgets/drawer.dart';
import 'package:client_update/widgets/headers/home_page_header.dart';
import 'package:client_update/widgets/spinner.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class VocabularyHomePage extends StatelessWidget {

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
                  "Learn English",
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),

                SizedBox(height: Constants.mainPadding),

                // 3. Start Learning Button Section
                Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(30.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Color(0xFFFEF3F3),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Start Learning \nNew Vocabulary Lessons!",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Constants.textDark),
                          ),

                          SizedBox(height: 10.0),

                          // Categories Button
                          Container(
                            width: 150,
                            child: FlatButton(
                              padding: EdgeInsets.all(10.0),
                              color: Constants.salmonMain,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                    child: Center(
                                      child: Text(
                                        "Categories",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Icon(Icons.arrow_forward,
                                      color: Colors.white, size: 16),
                                ],
                              ),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(13.0),
                              ),
                              onPressed: () {
                                // Navigate to Learning
                                debugPrint("Pressed here");
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => VocabularyLessonCategories()),
                                );
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.0),

                Text("Latest Vocabulary Lessons",
                    style: TextStyle(
                      color: Constants.textDark,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),

                SizedBox(height: 20.0),

                FutureBuilder(
                    future: httpService.fetchVocabularyLessons(),
                    builder: (BuildContext context , AsyncSnapshot snap){
                      if(snap.hasData){
                        if(snap.data.length>4){
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: 4,
                              itemBuilder: (BuildContext context , int index){
                                return   GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: VocabularyLesson(
                                              lesson: snap.data[index],
                                            ),
                                            type: PageTransitionType.rightToLeft));
                                  },
                                  child: MixGrammarLesson(
                                    color: Constants.lightViolet,
                                    title: snap.data[index].title,
                                    progress: "75%",
                                    percentage: 0.75,
                                  ),
                                );
                              }
                          );
                        }else if(snap.data.length <= 4 && snap.data.length > 0){
                          return ListView.builder(
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: snap.data.length,
                              itemBuilder: (BuildContext context , int index){
                                return   GestureDetector(
                                  onTap: (){
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            child: VocabularyLesson(
                                              lesson: snap.data[index],
                                            ),
                                            type: PageTransitionType.rightToLeft));
                                  },
                                  child: MixGrammarLesson(
                                    color: Constants.lightViolet,
                                    title: snap.data[index].title,
                                    progress: "75%",
                                    percentage: 0.75,
                                  ),
                                );
                              }
                          );
                        }
                      }
                      return Center(child: loadingSpinKit(context),);
                    }
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
