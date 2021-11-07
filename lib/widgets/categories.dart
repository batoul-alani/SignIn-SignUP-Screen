import 'package:ecommerancy/routes/router.gr.dart';
import 'package:ecommerancy/widgets/textWidget.dart';
import 'package:flutter/material.dart';
import 'package:ecommerancy/viewModel/providerData.dart';
import 'package:provider/provider.dart';
import 'package:ecommerancy/services/api_service.dart';
import 'package:ecommerancy/services/getSizes.dart';
import 'package:auto_route/auto_route.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderData>(
        builder:(context,providerData,child) {
          if (categories.length==0){
            return Center(child: TextWidget(textContent: 'Waiting ..',textColor: Colors.black,weight: FontWeight.w700,));
          }

          return  ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context,index){
                return Container(
                    width: displyWidth(context)*0.25,
                      child: InkWell(
                        onTap: (){
                          categoriesProduct={};
                          AutoRouter.of(context).push(ProductsByCategories(PBC:categories[index]['id']));
                        },
                        child: Card(
                        color: Colors.white,
                        elevation: 0.2,
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                            children:[
                              SizedBox(
                                height:displyHeight(context)*0.06,
                                child: Image.network(
                                  categories[index]['image'],
                                  ),
                                ),
                              SizedBox(height: displyHeight(context)*0.01,),
                              TextWidget(textColor: Colors.black,textContent: categories[index]['name'],textSize: 12.0,),],),),
                      ),
                    );
            }
            );
        });
  }
}