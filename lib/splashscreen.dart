import 'package:flutter/material.dart';

import 'loginscreen.dart';

void main() => runApp(SplashScreen());

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(primarySwatch: MaterialColor(0xFF33691E, color)),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/images/splash.png',
                scale: 0.8,
              ),
              SizedBox(
                height: 20,
              ),
              new ProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProgressIndicator extends StatefulWidget {
  @override
  _ProgressIndicatorState createState() => new _ProgressIndicatorState();
}

class _ProgressIndicatorState extends State<ProgressIndicator>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 2500), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          if (animation.value > 0.99) {
            print('Sucess Login');
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage()));
          }
        });
      });
    controller.repeat();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Container(
      width: 200,
      color: Colors.green,
      child: LinearProgressIndicator(
        value: animation.value,
        backgroundColor: Colors.black,
        valueColor:
            new AlwaysStoppedAnimation<Color>(Color.fromRGBO(12, 130, 9, 1)),
      ),
    ));
  }
}

Map<int, Color> color = {
  50: Color.fromRGBO(12, 130, 9, .1),
  100: Color.fromRGBO(12, 130, 9, .2),
  200: Color.fromRGBO(12, 130, 9, .3),
  300: Color.fromRGBO(12, 130, 9, .4),
  400: Color.fromRGBO(12, 130, 9, .5),
  500: Color.fromRGBO(12, 130, 9, .6),
  600: Color.fromRGBO(12, 130, 9, .7),
  700: Color.fromRGBO(12, 130, 9, .8),
  800: Color.fromRGBO(12, 130, 9, .9),
  900: Color.fromRGBO(12, 130, 9, 1),
};