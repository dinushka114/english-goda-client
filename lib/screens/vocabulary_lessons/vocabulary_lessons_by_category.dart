import 'package:client_update/http_services/http_service.dart';
import 'package:client_update/screens/grammer_lessons/grammer_lesson_detail.dart';
import 'package:client_update/screens/vocabulary_lessons/vocabulary_lesson_detail.dart';
import 'package:client_update/utils/constants.dart';
import 'package:client_update/widgets/card-lists/latest_lesson_card.dart';
import 'package:client_update/widgets/card-lists/lesson.dart';
import 'package:client_update/widgets/headers/lessons_header.dart';
import 'package:client_update/widgets/spinner.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class VocbularyLessonsByCategory extends StatelessWidget {

  final String name;

  final TextEditingController _searchControl = new TextEditingController();

  HttpService httpService = HttpService();

  VocbularyLessonsByCategory({Key key, this.name}) : super(key: key);

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
        children: [
          HeaderCategories(),
          Padding(
            padding: EdgeInsets.all(Constants.mainPadding),
            child: ListView(

              scrollDirection: Axis.vertical,
              children: <Widget>[

                SizedBox(height: Constants.mainPadding * 2),

                // 1. Welcome User
                Text(this.name,
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                  ),
                ),

                SizedBox(height: Constants.mainPadding),
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.all(
                //       Radius.circular(20.0),
                //     ),
                //   ),
                //   child: TextField(
                //     style: TextStyle(
                //       fontSize: 12.0,
                //       color: Constants.textDark,
                //     ),
                //     decoration: InputDecoration(
                //       contentPadding: EdgeInsets.all(20.0),
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20.0),
                //         borderSide: BorderSide(color: Colors.white),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.white),
                //         borderRadius: BorderRadius.circular(20.0),
                //       ),
                //       hintText: "Search lessons",
                //       suffixIcon: IconButton(
                //         icon: Icon(
                //           Icons.search,
                //           color: Constants.textDark,
                //         ),
                //         onPressed: () {
                //           debugPrint("Search pressed");
                //         },
                //       ),
                //       hintStyle: TextStyle(
                //         fontSize: 15.0,
                //       ),
                //     ),
                //     maxLines: 1,
                //     controller: _searchControl,
                //   ),
                // ),

                // SizedBox(height: Constants.mainPadding),

                Text("Pick a lesson",
                    style: TextStyle(
                      color: Constants.textDark,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )
                ),

                SizedBox(height: 20.0),

                // List of courses
                FutureBuilder(
                  future:httpService.fetchVocabularyLessonsByCategory(this.name),
                  builder: (BuildContext context , AsyncSnapshot snap){
                    if(snap.hasData){
                      return ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snap.data.length,
                          itemBuilder:(BuildContext context , int index){
                            return GestureDetector(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: VocabularyLesson(
                                            lesson: snap.data[index],
                                          ),
                                          type: PageTransitionType.rightToLeft));
                                },
                                child: Lesson(title:snap.data[index].title));
                          }
                      );
                    }
                    return Center(child:loadingSpinKit(context));
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
