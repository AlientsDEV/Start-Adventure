import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../slivers/first_sliver.dart';
import 'package:travel_now/widgets/build_grid_item.dart';
import 'package:travel_now/models/modal_item.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


final summerRef = Firestore.instance.collection('summer');
final winterRef = Firestore.instance.collection('winter');
final autumnRef = Firestore.instance.collection('autumn');
final springRef = Firestore.instance.collection('spring');

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  bool isAutumn = true;
  bool isSummer = false;
  bool isWinter = false;
  bool isSpring = false;
  bool isExist = true;
  CollectionReference season = Firestore.instance.collection('autumn');


  List<ModalItem> modalItems = [];


  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);


    TextStyle selectedStyle = TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: ScreenUtil.getInstance().setSp(51)
    );

    TextStyle unselectedStyle = TextStyle(
        color: Colors.grey.withOpacity(0.6),
        fontSize: ScreenUtil.getInstance().setSp(42)
    );

    print('HomePage');
    print('season : ${season.path}');
    //modalItems = [];
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          FirstSliver(),
          SliverAppBar(
            expandedHeight: 0.0,
            backgroundColor: Colors.white,
            floating: true,
            pinned: true,
            elevation: 2.0,
            centerTitle: true,
            title:Container(
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  FlatButton(
                    onPressed: (){
                      setState(() {
                        isAutumn = true;
                        isWinter = isSpring = isSummer = false;
                        isExist = true;
                        modalItems = [];
                        season = autumnRef;
                      });
                    },
                    child: Container(
                        child: Text(
                          'Autom',
                          style: isAutumn ? selectedStyle : unselectedStyle,
                        )
                    ),
                  ),
                  FlatButton(
                      onPressed: (){
                        setState(() {
                          isSummer = true;
                          isWinter = isSpring = isAutumn = false;
                          isExist = true;
                          modalItems = [];
                          season = summerRef;
                        });
                      },
                      child: Container(
                          child: Text(
                            'Summer',
                            style: isSummer ? selectedStyle : unselectedStyle,
                          )
                      )
                  ),
                  FlatButton(
                    onPressed: (){
                      setState(() {
                        isWinter = true;
                        isSummer = isSpring = isAutumn = false;
                        isExist = true;
                        modalItems = [];
                        season = winterRef;
                      });
                      // her
                    },
                    child: Container(
                        child: Text(
                          'Winter',
                          style: isWinter ? selectedStyle : unselectedStyle,
                        )
                    ),
                  ),
                  FlatButton(
                    child: Container(
                      child: Text(
                        'Spring',
                        style: isSpring ? selectedStyle : unselectedStyle,
                      ),
                    ),
                    onPressed: (){
                      setState(() {
                        isSpring = true;
                        isSummer = isWinter = isAutumn = false;
                        isExist =true;
                        modalItems = [];
                        season = springRef;
                      });
                      // her
                    },
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.only(left: 10.0,right: 10.0),
            sliver: SliverToBoxAdapter(
              child: FutureBuilder(
                future: season.getDocuments(),
                builder: (context,snapShot) {
                  if(snapShot.connectionState == ConnectionState.waiting)
                    return Container();
                  else{
                    if(isExist){
                      snapShot.data.documents.forEach((doc){
                        ModalItem item = ModalItem.fromDocument(doc);
                        modalItems.add(item);
                      });
                      isExist = false;
                    }
                    return GridView.builder(
                      itemBuilder : (context,index)=>BuildGridItem(item: modalItems[index], index:index),
                      itemCount: modalItems.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          childAspectRatio: 0.8,
                          mainAxisSpacing: 15.0,
                          crossAxisSpacing: 15.0
                      ),
                    );
                  }
                },
              ),
            ),
          )
        ],
      ),
    );

  }
}
