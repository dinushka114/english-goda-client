import 'package:client_update/models/models.dart';
import 'package:client_update/screens/past-papers/view_answers.dart';
import 'package:client_update/screens/past-papers/view_paper.dart';
import 'package:client_update/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class PastPaperCard extends StatelessWidget {
  final PastPaper paper;

  PastPaperCard({
    Key key,
    @required this.paper,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom:8.0),
      width: double.infinity,
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Color(0xFFFEF3F3),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            this.paper.name,
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
                        "View Paper",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Icon(Icons.zoom_in_sharp,
                      color: Colors.white, size: 16),
                ],
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(13.0),
              ),
              onPressed: () {
                // Navigate to Learning
                Navigator.push(
                    context,
                    PageTransition(
                        child: ViewPaper(
                          paper: this.paper,
                        ),
                        type:
                        PageTransitionType.rightToLeft));
              },
            ),
          ),
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
                        "View Answers",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  Icon(Icons.my_library_books,
                      color: Colors.white, size: 16),
                ],
              ),
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(13.0),
              ),
              onPressed: () {
                // Navigate to Learning
                // debugPrint("View Paper");
                Navigator.push(
                    context,
                    PageTransition(
                        child: ViewAnswers(
                          paper: this.paper,
                        ),
                        type:
                        PageTransitionType.rightToLeft));

              },
            ),
          )
        ],
      ),
    );
  }
}