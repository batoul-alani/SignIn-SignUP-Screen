import 'package:ecommerancy/widgets/providerData.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/textButton.dart';
import 'package:ecommerancy/widgets/textWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderData>(
        builder: (context,providerDate,child) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextWidget(textColor: Colors.black,textContent: 'Hello User, Welcome',textSize: 20.0,),
              textButton(buttonColor: basicColor,childy: TextWidget(textColor: Colors.black,textContent: 'Log out?',),onPressed: (){
                  Provider.of<ProviderData>(context,listen: false).logOut(context);
              },),
            ],
          ),
        );}
      ),
    );
  }
}
