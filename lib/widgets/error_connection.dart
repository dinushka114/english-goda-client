import 'package:client_update/utils/constants.dart';
import 'package:client_update/widgets/headers/error_header.dart';
import 'package:client_update/widgets/spinner.dart';
import 'package:flutter/material.dart';

class ErrorConnection extends StatelessWidget {
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
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ErrorHeader(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/error.png',width: 250,),
              Center(child: Text("Please check your \n internet connection..!!",
                textAlign: TextAlign.center,
                style: TextStyle(color: Constants.lightViolet,
                    fontSize: 20
                ),
              )),
              // Center(child: Text("No Internet Connection..!!",
              //   style: TextStyle(color: Constants.lightViolet,
              //     fontSize: 22
              //   ),
              // )),
              SizedBox(height: Constants.mainPadding,),
              Center(child: loadingSpinKit(context),)
            ],
          )
        ],
      ),
    );
  }
}
