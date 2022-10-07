import 'package:flutter/material.dart';
import 'package:ninja_trips/shared/screenTitle.dart';
import 'package:ninja_trips/shared/tripList.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pos = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg.png"),
              fit: BoxFit.fitWidth,
              alignment: Alignment.topLeft),
        ),
        child: TweenAnimationBuilder(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30),
              // AnimatedPositioned(

              //   child: GestureDetector(
              //     onTap: () {
              //       setState(() {
              //         pos = pos + 1;
              //         if (pos > 3) pos = 0;
              //       });
              //     },
              SizedBox(
                height: 160,
                child: ScreenTitle(text: 'Ninja Trips'),
              ),
              //   ),
              // ),
              Flexible(
                child: TripList(),
              )
              //Sandbox(),
            ],
          ),
          tween: Tween<double>(begin: 0, end: 1),
          duration: Duration(milliseconds: 1000),
          builder: (BuildContext context, double _val, Widget child) {
            return Opacity(
                opacity: _val,
                child: Padding(
                  child: child,
                  padding: EdgeInsets.only(left: _val * 20),
                ));
          },
        ),
      ),
    );
  }
}
