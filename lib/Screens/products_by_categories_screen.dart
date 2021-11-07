import 'package:flutter/material.dart';
import 'package:ecommerancy/widgets/textWidget.dart';
import 'package:ecommerancy/main.dart';
import 'package:ecommerancy/services/getSizes.dart';
import 'package:ecommerancy/widgets/textButton.dart';
import 'package:ecommerancy/services/api_service.dart';
import 'package:provider/provider.dart';
import 'package:ecommerancy/viewModel/providerData.dart';
import 'package:auto_route/auto_route.dart';

class ProductsByCategories extends StatelessWidget with ChangeNotifier{
  dynamic PBC;
  ProductsByCategories({required this.PBC});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderData>(
        builder:(context,providerData,child) {
          Provider.of<ProviderData>(context,listen: false).getProductsByCategory(PBC);
          if(categoriesProduct.length==0){
            return Scaffold(body: Center(child: TextWidget(textContent: 'Waiting ..',textColor: Colors.black,weight: FontWeight.w700,)));}

          return Scaffold(
            appBar: AppBar(
          elevation: 0.2,
          centerTitle: true,
          backgroundColor: Colors.white,
            title: TextWidget(textContent: 'Gadgets',textColor: Colors.black,),
            leading: Padding(padding:EdgeInsets.symmetric(horizontal: 10.0,vertical: 7.0),child: IconButton(onPressed: (){AutoRouter.of(context).pop();categoriesProduct={};}, icon: Icon(Icons.keyboard_arrow_left),color: Colors.black,iconSize: 24.0,)),
            actions: [
            Padding(padding:EdgeInsets.symmetric(horizontal: 10.0,vertical: 7.0),child: CircleAvatar(radius:30,backgroundColor:basicColor,child: IconButton(onPressed: (){}, icon: Icon(Icons.search),color: Colors.white,iconSize: 24.0,)))],
        ),

            bottomNavigationBar: Row(
          children: [
            Expanded(child: textButton(buttonColor: Colors.white,onPressed: (){},childy: TextWidget(textColor: Colors.black,textContent: 'no Filters applied',),)),
            Expanded(child: textButton(buttonColor: basicColor,onPressed: (){},childy: TextWidget(textColor: Colors.white,textContent: 'FILTER',),)),
          ],
        ),

            body: ListView(
              padding: EdgeInsets.all(15.0),
              children: [
              TextWidget(textSize: 16.0,textContent: 'Top Brands',textColor: Colors.black,weight: FontWeight.w900,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                width: displyWidth(context),
                height: displyHeight(context),
                child: GridView.count(
                  crossAxisSpacing: 0.2,
                  childAspectRatio: ((displyWidth(context)/2)/((displyHeight(context)-kToolbarHeight-24)/2)),
                  crossAxisCount: 2,
                  children: List.generate(categoriesProduct.length, (index) {
                    return InkWell(
                      onTap: (){
                        print(categoriesProduct[index]['id']);},
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                           Expanded(
                             child: Image.network(categoriesProduct[index]['image'],fit: BoxFit.fill,width: displyWidth(context),),
                           ),
                          TextWidget(textColor: Colors.black,textContent: categoriesProduct[index]['name'],textSize: 15.0,),
                          TextWidget(textColor: Color(0xFF929292),textContent: categoriesProduct[index]['description'],textSize: 12.0,),
                          TextWidget(textColor: basicColor,textContent: '\$${categoriesProduct[index]['price']}',textSize: 18.0,weight: FontWeight.bold,),
                        ],),
                    );
                  }),
                )),
          ],
        ),
    );});
  }
}
