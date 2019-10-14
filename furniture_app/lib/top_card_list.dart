import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class TopCardList extends StatelessWidget{



  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    return Container(
      width: MediaQuery.of(context).size.width / 1.7,
      margin: EdgeInsets.only(right: 4.0,left: 4.0),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2.45,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 10.0,
                  ),
                  image: DecorationImage(
                      image: NetworkImage(
                        'https://ii2.pepperfry.com/media/catalog/product/d/r/800x880/drapery-single-bed--in-wenge-colour-by-eros-drapery-single-bed--in-wenge-colour-by-eros-kirgmv.jpg',
                      ),
                      fit: BoxFit.cover
                  )
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            right: 60.0,
            left: 0.0,
            child: Container(
              height: MediaQuery.of(context).size.height / 5.0,
              margin: EdgeInsets.only(bottom: 8.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    blurRadius: 3,
                    spreadRadius: 1,
                  )]
              ),
              child: Padding(
                padding: EdgeInsets.only(
                    left: ScreenUtil.getInstance().setHeight(30.0),
                    right: ScreenUtil.getInstance().setHeight(30.0),
                    bottom: ScreenUtil.getInstance().setHeight(30.0),
                    top: ScreenUtil.getInstance().setHeight(45.0)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Tag stool'.toUpperCase(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: ScreenUtil.getInstance().setHeight(60.0),
                      ),
                    ),
                    Text(
                      'design by Molina'.toLowerCase(),
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: ScreenUtil.getInstance().setHeight(39.0),
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '129',
                          style: TextStyle(
                              color: Color(0xffd78b2e),
                              fontSize: ScreenUtil.getInstance().setSp(60.0),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          'USD',
                          style: TextStyle(
                              color: Color(0xffd78b2e),
                              fontSize: ScreenUtil.getInstance().setSp(30.0),
                              fontWeight: FontWeight.w600
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 18.0,
            right: 40.0,
            child: Container(
              color: Color(0xffd78b2e),
              height: 40.0,
              width: 40.0,
              child: Icon(Icons.arrow_forward,color: Colors.white ,),
            ),
          )
        ],
      ),
    );;
  }

}