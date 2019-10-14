import 'package:flutter/material.dart';



class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 50.0,
            flexibleSpace: Container(
              color: Colors.deepPurple,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 2000,),
          )
        ],
      ),
    );

  }
}