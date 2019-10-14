import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/top_card_list.dart';

class HomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<HomePage> {

  Size size;

  @override
  Widget build(BuildContext context) {

    size = MediaQuery.of(context).size;
    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFillRemaining(
            child: IntrinsicHeight(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        ..._buildBackgroundWidget(context).map((m) => m),
                        Positioned(
                          top: 38.0,
                          left: 24.0,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Hi Oussama',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: ScreenUtil.getInstance().setSp(73),
                                ),
                              ),
                              SizedBox(height: ScreenUtil.getInstance().setHeight(60.0),),
                              Container(
                                width : MediaQuery.of(context).size.width,
                                height : MediaQuery.of(context).size.height / 2,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 5,
                                  itemBuilder: (context,index){
                                    return TopCardList();
                                  },
                                ),
                              ),
                              SizedBox(height: ScreenUtil.getInstance().setHeight(30.0),),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Popular',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: ScreenUtil.getInstance().setSp(50.0),
                                    ),
                                  ),
                                  SizedBox(width: ScreenUtil.getInstance().setHeight(30.0),),
                                  Text(
                                    '.',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: ScreenUtil.getInstance().setSp(100.0)
                                    ),
                                  ),
                                  SizedBox(width: ScreenUtil.getInstance().setHeight(30.0),),
                                  Text(
                                    'Update 24',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                      fontSize: ScreenUtil.getInstance().setSp(50.0),
                                    ),
                                  ),

                                ],
                              ),
                              SizedBox(height: ScreenUtil.getInstance().setHeight(500.0),),
                              SizedBox(height: ScreenUtil.getInstance().setHeight(30.0),),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
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