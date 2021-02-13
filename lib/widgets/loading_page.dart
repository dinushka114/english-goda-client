import 'dart:async';
import 'package:client_update/screens/grammer_lessons/home_page.dart';
import 'package:client_update/utils/constants.dart';
import 'package:client_update/widgets/headers/loading_header.dart';
import 'package:client_update/widgets/spinner.dart';
import 'package:flutter/material.dart';

class LoadingApp extends StatefulWidget {
  @override
  _LoadingAppState createState() => _LoadingAppState();
}

class _LoadingAppState extends State<LoadingApp> {
  final delay = 3;

  @override
  void initState() {
    super.initState();

    loadWidget();
  }

  loadWidget() async {
    var _duration = Duration(seconds: delay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 100),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[


            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          LoadingHeader(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Material(
                  color: Constants.lightViolet,
                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                  elevation: 10,
                  child: Image.asset("assets/images/logo.png",
                    width: 152,
                    height: 152,
                  ),
                ),
              ),
              SizedBox(height: Constants.mainPadding,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Your personal O/L English Tutor",
                style: TextStyle(
                    color: Constants.lightViolet,
                  fontWeight: FontWeight.w900,fontSize: 22
                  ),
                ),
              ),
              SizedBox(height: Constants.mainPadding*4,),
              loadingSpinKit(context)
            ],
          ),
        ],
      ),
    );
  }
}
