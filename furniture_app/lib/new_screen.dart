import 'package:flutter/material.dart';



class NewScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(

            )
          ),
        )
      ),
    );
  }


  List<Widget> _buildBackgroundWidget(BuildContext context){
    return [
      Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        child: Container(
          height: MediaQuery.of(context).size.height / 2.1,
          decoration: BoxDecoration(
            color: Color(0xffffcc1e),
          ),
        ),
      ),
      Positioned(
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            color: Color(0xfffcf8e7),
          ),
        ),
      ),
    ];
  }

}