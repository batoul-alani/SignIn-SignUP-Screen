import 'package:flutter/material.dart';
import 'package:ecommerancy/widgets/categories.dart';
import 'package:provider/provider.dart';
import 'package:ecommerancy/viewModel/providerData.dart';
import 'package:ecommerancy/widgets/textWidget.dart';
import 'package:ecommerancy/services/getSizes.dart';
import 'package:ecommerancy/widgets/textButton.dart';
import 'package:ecommerancy/widgets/products.dart';
import 'package:ecommerancy/widgets/listView.dart';

class ExplorePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderData>(
      builder: (context,providerData,child){
        Provider.of<ProviderData>(context,listen: false).getCategories();
        Provider.of<ProviderData>(context,listen: false).getProducts();
        return ListView(
          padding: EdgeInsets.all(15.0),
          children: [

            TextWidget(textSize: 16.0,textContent: 'Categories',textColor: Colors.black,weight: FontWeight.w900,),
            Container(
              width: displyWidth(context),
              height: displyHeight(context)*0.15,
              child: Categories(),
              ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              TextWidget(textSize: 16.0,textContent: 'Best Selling',textColor: Colors.black,weight: FontWeight.w900,),
              textButton(onPressed: (){},buttonColor: Colors.transparent,childy: TextWidget(textContent: 'See All',textSize: 15.0,weight: FontWeight.w100,textColor: Colors.black,alignMethode: TextAlign.center,),),
            ],),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              width: displyWidth(context),
              height: displyHeight(context)*0.40,
              child: Products(),
            ),

            SizedBox(height: displyHeight(context)*0.02,),

            TextWidget(textSize: 16.0,textContent: 'Featured Brands',textColor: Colors.black,weight: FontWeight.w900,),
            Container(
               padding: EdgeInsets.symmetric(vertical: 12.0),
               width: displyWidth(context),
               height: displyHeight(context)*0.15,
               child: ListViewSample()),

            SizedBox(height: displyHeight(context)*0.01,),
            Image(image: AssetImage('images/ads.jpg'),width: displyWidth(context),height: displyHeight(context)*0.25,fit: BoxFit.fill,),
            SizedBox(height: displyHeight(context)*0.04,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextWidget(textSize: 16.0,textContent: 'Best Selling',textColor: Colors.black,weight: FontWeight.w900,),
                textButton(onPressed: (){},buttonColor: Colors.transparent,childy: TextWidget(textContent: 'See All',textSize: 15.0,weight: FontWeight.w100,textColor: Colors.black,alignMethode: TextAlign.center,),),
              ],),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              width: displyWidth(context),
              height: displyHeight(context)*0.40,
              child: Products(),
            ),
          ],
        );
      },
    );
  }
}
