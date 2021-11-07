import 'package:ecommerancy/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerancy/viewModel/providerData.dart';
import 'package:provider/provider.dart';
import 'package:ecommerancy/services/api_service.dart';
import 'package:ecommerancy/services/getSizes.dart';
import 'package:ecommerancy/main.dart';

class Products extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderData>(
        builder:(context,providerData,child) {
          if (products.length==0){
            return Center(child: TextWidget(textContent: 'Waiting ..',textColor: Colors.black,weight: FontWeight.w700,));
          }

          return  ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context,index){
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child: InkWell(
                    onTap: (){print(products[index]['id']);},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Expanded(
                          child: Image.network(products[index]['image'],fit: BoxFit.fill,width: displyWidth(context)*0.4,),
                        ),
                        TextWidget(textColor: Colors.black,textContent: products[index]['name'],textSize: 15.0,),
                        TextWidget(textColor: Color(0xFF929292),textContent: products[index]['description'],textSize: 12.0,),
                        TextWidget(textColor: basicColor,textContent: '\$${products[index]['price']}',textSize: 18.0,weight: FontWeight.bold,),
                      ],),
                  ),
                );
              }
          );
        });
  }
}