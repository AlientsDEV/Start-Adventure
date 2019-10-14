import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/modal_item.dart';
import 'package:travel_now/screens/second_page.dart';
import 'package:cached_network_image/cached_network_image.dart';


class BuildGridItem extends StatelessWidget{

  final ModalItem item;
  final int index;
  BuildGridItem({this.item,this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SecondScreen(item,index)
              )
          );
        },
        child: Stack(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ClipRRect(
                    child: Hero(
                      tag: index,
                      child: CachedNetworkImage(
                        imageUrl: item.photoUrl,
                        placeholder: (context, url) => Center(child:CircularProgressIndicator()),
                        errorWidget: (context, url, error) => new Icon(Icons.error),
                        fit: BoxFit.cover,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        colorBlendMode: BlendMode.darken,
                        color: Colors.black26,
                        fadeInDuration: Duration(milliseconds: 1000),
                        fadeInCurve: Curves.easeIn,
                      ),/*Image.network(
                        item.photoUrl,
                        fit: BoxFit.cover,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        colorBlendMode: BlendMode.darken,
                        color: Colors.black26,
                      ),*/
                    ),
                    borderRadius: BorderRadius.circular(5.0)
                ),
              ],
            ),
            Positioned(
              top: 10.0,
              right: 10.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 2.0),
                decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(8.0)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.star,size: 15.0,color: Colors.white,),
                    Text('${item.rating}',style: TextStyle(color: Colors.white),)
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }

}