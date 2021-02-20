import 'dart:convert';

import 'package:client_update/models/models.dart';
import 'package:client_update/screens/grammer_lessons/grammer_lesson_categories.dart';
import 'package:client_update/screens/vocabulary_lessons/vocabulary_lesson_categories.dart';
import 'package:client_update/screens/vocabulary_lessons/vocabulary_lesson_detail.dart';
import 'package:client_update/utils/constants.dart';
import 'package:client_update/widgets/card-lists/lesson.dart';
import 'package:client_update/widgets/drawer.dart';
import 'package:client_update/widgets/headers/home_page_header.dart';
import 'package:client_update/widgets/spinner.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:page_transition/page_transition.dart';


class VocabularyHomePage extends StatefulWidget {


  @override
  _VocabularyHomePageState createState() => _VocabularyHomePageState();
}

class _VocabularyHomePageState extends State<VocabularyHomePage> {
  final TextEditingController _searchControl = new TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  bool isLoading = true;
  bool isSearching = false;

  List<VocabularyLessonByTitle>   vocLessons=[];
  List<VocabularyLessonByTitle> searchListItems = [];

  void fetchVocabularyLessons() async {

    var response =  await get("https://nestjs-now-inky.vercel.app/api/users/vocabularies");
    var lessonModel = json.decode(response.body);
    for(var d in lessonModel){
      VocabularyLessonByTitle lesson = VocabularyLessonByTitle(d["title"],d["content"]);
      setState(() {
        isLoading = false;
        vocLessons.add(lesson);
      });
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    fetchVocabularyLessons();
    searchListItems = vocLessons;
    super.initState();


  }


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
                Container(
                  decoration: BoxDecoration(
                    color: Constants.lightViolet,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  child: TextField(
                    onChanged: (text){
                      text = text.toLowerCase();
                      setState(() {
                        isSearching = true;
                        searchListItems = vocLessons.where((lesson){
                         var lessonContent = lesson.content.toLowerCase();
                         return lessonContent.contains(text);
                       }).toList();

                      });
                    },
                    style: TextStyle(
                      fontSize: 12.0,
                      color: Constants.textDark,
                    ),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.all(20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: "Search lessons",
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.search,
                          color: Constants.textDark,
                        ),
                        onPressed: () {
                          debugPrint("Search pressed");
                        },
                      ),
                      hintStyle: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    maxLines: 1,

                  ),
                ),

                SizedBox(height: Constants.mainPadding,),

                Text("Mix Vocabulary Lessons",
                    style: TextStyle(
                      color: Constants.textDark,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )),

                SizedBox(height: 20.0),

                 isLoading==false ?  ListView.builder(
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                      itemCount:searchListItems.length > 4 ? 4 : searchListItems.length ,
                      itemBuilder: (BuildContext context , int index){
                       return GestureDetector(
                         onTap: (){
                           Navigator.push(
                               context,
                               PageTransition(
                                   child: VocabularyLesson(
                                     lesson: searchListItems[index],
                                   ),
                                   type: PageTransitionType.rightToLeft));
                         },
                           child: Lesson(title: searchListItems[index].title));
                    }
                )  : Center(child: loadingSpinKit(context),)

              ],
            ),
          ),
        ],
      ),
    );
  }
}
