import 'package:client_update/http_services/http_service.dart';
import 'package:client_update/utils/constants.dart';
import 'package:client_update/widgets/card-lists/category_card.dart';
import 'package:client_update/widgets/headers/category_header.dart';
import 'package:client_update/widgets/spinner.dart';
import 'package:flutter/material.dart';

class VocabularyLessonCategories extends StatelessWidget {

  HttpService httpService = HttpService();

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
                    debugPrint("Menu pressed");
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          CategoryHeader(),
          Padding(
            padding: EdgeInsets.all(Constants.mainPadding),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[

                SizedBox(height: Constants.mainPadding * 2),

                // 1. Welcome User
                Text("Categories",
                  style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: Colors.white
                  ),
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

                          Text("Learn English \nZero to Hero!",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Constants.textDark
                            ),
                          ),

                          SizedBox(height: 10.0),

                          // Categories Button

                        ],
                      ),
                    ),

                    // Image Researching Girl
                    Positioned(
                      right: 0,
                      bottom: -28,
                      child: Image.asset("assets/images/category.png",
                        width: 150,
                        height: 140,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20.0),

                Text("Select Category",
                    style: TextStyle(
                      color: Constants.textDark,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    )
                ),

                SizedBox(height: 20.0),

                // List of courses
                FutureBuilder(
                  future:httpService.fetchVocabularyCategories(),
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
                                  Navigator.pushNamed(
                                      context, '/vocabularyByCategory',
                                      arguments: snap.data[index].name
                                  );
                                },
                                child: CategoryCard(title: snap.data[index].name, subtitle: snap.data[index].description));
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
