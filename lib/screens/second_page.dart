import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travel_now/models/modal_item.dart';
import 'package:auto_size_text/auto_size_text.dart';


class SecondScreen extends StatelessWidget{

  final ModalItem item;
  final int index;
  SecondScreen(this.item,this.index);

  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil.getInstance()..init(context);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Hero(
              tag: index,
              child: CachedNetworkImage(
                imageUrl: item.photoUrl,
                placeholder: (context, url) => Center(child:CircularProgressIndicator()),
                errorWidget: (context, url, error) => new Icon(Icons.error),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                colorBlendMode: BlendMode.darken,
                color: Colors.black45,
              ),
            ),Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 32.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Spacer(),
                    Container(
                      width: ScreenUtil.getInstance().width,
                      child: AutoSizeText(
                        item.title,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.1,
                            fontSize: ScreenUtil.getInstance().setSp(126.0)
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Row(
                      children: <Widget>[
                        FlutterRatingBar(
                          initialRating: double.parse(item.rating),
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 16,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          '(${item.nbrRating})',
                          style: TextStyle(
                              color: Colors.white70,
                              fontSize: ScreenUtil.getInstance().setSp(42)
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      child: AutoSizeText(
                        item.text,
                        maxLines: 5,
                        style: TextStyle(
                          color: Colors.white54,
                          height: 1.4,
                          fontSize: ScreenUtil.getInstance().setSp(42)
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: 4.0,
                                  height: 4.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white54,
                                      borderRadius: BorderRadius.circular(50.0)),
                                ),
                                SizedBox(width: 4.0),
                                Container(
                                  width: 18.0,
                                  height: 2.0,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 4.0),
                                Container(
                                  width: 4.0,
                                  height: 4.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white54,
                                      borderRadius: BorderRadius.circular(50.0)),
                                ),
                                SizedBox(width: 4.0),
                                Container(
                                  width: 4.0,
                                  height: 4.0,
                                  decoration: BoxDecoration(
                                      color: Colors.white54,
                                      borderRadius: BorderRadius.circular(50.0)),
                                ),
                              ],
                            )),

                      ],
                    ),
                    SizedBox(
                      height: 32.0,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }



}