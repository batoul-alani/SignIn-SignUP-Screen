import 'package:flutter/material.dart';
import 'package:ecommerancy/main.dart';
import 'package:ecommerancy/widgets/textButton.dart';
import 'package:ecommerancy/widgets/textWidget.dart';
import 'package:ecommerancy/viewModel/providerData.dart';
import 'package:provider/provider.dart';
import 'package:ecommerancy/services/api_service.dart';
import 'package:ecommerancy/services/getSizes.dart';
import 'package:ecommerancy/widgets/buttonRow.dart';

class ProfilePage extends StatelessWidget {
  String fromMapString = '';
  String userName = '';

  String fromMap(Map m) {
    fromMapString = m['email'];
    return fromMapString;
  }

  String nameFromMap(Map m) {
    userName = m['name'];
    return userName;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: displyWidth(context) * 0.06,
        vertical: displyHeight(context)*0.07,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextWidget(
            textColor: basicColor,
            textContent: 'Profile Page',
            textSize: 23.0,
            weight: FontWeight.w600,
          ),
          SizedBox(height: displyHeight(context)*0.01,),
          Stack(
            children: <Widget>[
              Container(
                width: displyWidth(context) * 0.22,
                height: displyHeight(context) * 0.11,
                padding: EdgeInsets.all(displyWidth(context) * 0.04),
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('images/AVATAR.jpg'),fit: BoxFit.cover),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(50.0)),
                ),
              ),
              Positioned(
                  bottom: 0.0,
                  right: 0.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 17.0,
                    child: Center(
                      child: IconButton(
                        icon: Icon(Icons.add),
                        iconSize: 17.0,
                        onPressed: () {},
                        padding: EdgeInsets.all(0.8),
                        alignment: Alignment.center,
                        color: basicColor,
                        splashColor: Colors.white,
                      ),
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: displyHeight(context) * 0.015,
          ),
          TextWidget(
            textSize: 17.0,
            textContent: fromMap(uD),
            textColor: Colors.black.withOpacity(0.6),
            weight: FontWeight.w700,
          ),
          TextWidget(textSize: 14.0,textContent: 'Id number',textColor: Colors.black.withOpacity(0.6),),
          Divider(
            height: displyHeight(context) * 0.06,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              textButton(
                childy: ButtonRow(Icons.settings,'User Setting'),
                onPressed: () {},
              ),
              textButton(
                childy: ButtonRow(Icons.notifications,'Notifications'),
                onPressed: () {},
              ),
              textButton(
                childy: ButtonRow(Icons.lock,'Change Password'),
                onPressed: () {},
              ),
              textButton(
                childy: ButtonRow(Icons.language,'Language'),
                onPressed: () {},
              ),
              textButton(
                childy: ButtonRow(Icons.phone,'Contact Us'),
                onPressed: () {},
              ),
              textButton(
                childy: ButtonRow(Icons.copy,'FAQ'),
                onPressed: () {},
              ),
              textButton(
                childy: ButtonRow(Icons.info,'About Us',),
                onPressed: () {},
              ),
              textButton(
                childy: ButtonRow(Icons.power_settings_new, 'Logout',),
                onPressed: () {
                  Provider.of<ProviderData>(context, listen: false)
                      .logOut(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
