import 'package:flutter/material.dart';
import 'constants.dart';
import 'home_screen.dart';

void main() => runApp(MyDiaryApp());

final appTheme = ThemeData(
  fontFamily: 'Quicksand',
  accentColor: primaryColor,
);

class MyDiaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Diary App',
      theme: appTheme,
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height *.25,),
          Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Welcome.',
                      style: TextStyle(fontSize: 54.0, fontFamily: 'Quicksand'),
                    ),
                    SizedBox(height: 10.0,),
                    Text(
                      'Get started by logging into\nyour account.',
                      style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: primaryColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 80.0,),
          Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SocialSitesLoginButton('assets/images/fb.png', 'Facebook'),
                    SizedBox(width: 20.0,),
                    SocialSitesLoginButton('assets/images/google.png', 'Google'),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomPaint(painter: DrawHorizontalLine(true)),
                  Text('or'),
                  CustomPaint(painter: DrawHorizontalLine(false)),
                ],
              ),
              Container(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      height: 50.0,
                      width: 350.0,
                      child: Center(child: Text('Signup with Email', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: Colors.white),)),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Existing user?', style: TextStyle(fontSize: 14.0, color: Colors.black),),
                      RaisedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        },
                        color: backgroundColor,
                        elevation: 0.0,
                        child: Text('Login now', style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: primaryColor),),
                      ),
                    ],
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SocialSitesLoginButton extends StatelessWidget {
  
  final String image;
  final String buttonText;
  
  SocialSitesLoginButton(this.image, this.buttonText);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      height: 50.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(image, width: 40.0, height: 40.0,),
          Text(buttonText, style: TextStyle(fontSize: 14.0, color: Colors.black),),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        border: Border.all(color: Colors.black26)
      ),
    );
  }
}

class DrawHorizontalLine extends CustomPainter {
  
  Paint _paint;
  bool reverse;
  
  DrawHorizontalLine(this.reverse) {
    _paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 0.5
      ..strokeCap = StrokeCap.round;
  }
  
  @override
  void paint(Canvas canvas, Size size) {
    if(!reverse){
      canvas.drawLine(Offset(10.0, 0.0), Offset(90.0, 0.0), _paint);
    }
    else
    {
      canvas.drawLine(Offset(-90.0, 0.0), Offset(-10.0, 0.0), _paint);
    }
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
