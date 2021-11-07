import 'package:ecommerancy/services/getSizes.dart';
import 'package:flutter/material.dart';
import 'textWidget.dart';

class ListViewSample extends StatelessWidget {

  final Map brands={
      "image": ['images/DIOR.jpg','images/Manusia.jpg','images/LC_Waikiki.png','images/Zara.jpg'],
      'name': ['Dior','Manusia','LC Waikiki','Zara'],
      'count':['120','300','100','170'],
  };

  ListViewSample();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brands['name'].length,
        itemBuilder: (context, index) {
          return Container(
            width: displyWidth(context)*0.4,

            child: InkWell(
              onTap: () {},
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CircleAvatar(
                      backgroundImage: AssetImage(brands['image'][index]),
                    minRadius: displyWidth(context)*0.04,
                    maxRadius: displyWidth(context)*0.052,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextWidget(textContent: brands['name'][index],textColor: Colors.black,textSize: 14.0,weight: FontWeight.w900,),
                      TextWidget(textContent: '${brands['count'][index]} products',textColor: Color(0xFF929292),textSize: 10.0),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }
}
