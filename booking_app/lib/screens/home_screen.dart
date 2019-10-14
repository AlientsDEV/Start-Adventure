import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';



class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

  Size size;

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assets/rivers.jpg',
               width: size.width,
               height: size.height,
               fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0.0,
              right: 0.0,
              left: 0.0,
              child: Container(
                height: 350.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: FractionalOffset.topCenter,
                    end: FractionalOffset.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.5),
                      Colors.black,
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50.0,
              right: 0.0,
              left: 0.0,
              child: Column(
                children: <Widget>[
                  Text(
                    'Enjoy the world',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  SizedBox(height: 15.0,),
                  Text(
                    'We\'ll help you to find the best\nexperiences & adventures.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                  SizedBox(height: 25.0,),
                  Container(
                    width: size.width* 0.18,
                    padding: EdgeInsets.all(15.0),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.pink,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                ],
              ),
            )
          ]
        ),
      ),
    );
  }
}