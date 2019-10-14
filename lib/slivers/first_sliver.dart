import 'package:flutter/material.dart';


class FirstSliver extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    print('First Sliver');

    return SliverList(
      delegate: SliverChildBuilderDelegate(
              (context,index) => Stack(
            children: <Widget>[
              Image.asset(
                'assets/village.jpg',
                height: 300,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                colorBlendMode: BlendMode.darken,
                color: Colors.black12,
              ),
              Positioned(
                top: 35.0,
                left: 20.0,
                child: RichText(
                  text: TextSpan(
                    text: 'S',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold
                    ),
                    children: <TextSpan>[
                      TextSpan(text: 'tart your\n', style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold
                      ),),
                      TextSpan(
                        text: 'A',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      TextSpan(text: 'dventure\n',style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold
                      )),
                      TextSpan(
                        text: 'N',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 40.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      TextSpan(text: 'ow',style: TextStyle(
                          color: Colors.white,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold
                      )),
                    ],
                  ),
                ),
              )
            ],
          ),
          childCount: 1
      ),
    );
  }

}