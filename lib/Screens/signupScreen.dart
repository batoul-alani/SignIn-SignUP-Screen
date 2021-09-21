import 'package:flutter/material.dart';
import '../widgets/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:ecommerancy/widgets/providerData.dart';

String? newEmail;
String? newPassword;
String? newName;

bool validatorNewName=false;
bool validatorNewEmail=false;
bool validatorNewPassword=false;

class signUpScreen extends StatelessWidget with ChangeNotifier{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.white,
        body: Consumer<ProviderData>(
        builder: (context,providerDate,child) {
          return LayoutBuilder(
              builder: (BuildContext context, BoxConstraints viewportConstraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: viewportConstraints.maxHeight,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 35.0,),
                        Row(
                          children: [
                            IconButton(
                                icon: Icon(Icons.arrow_back, size: 20.0,),
                                onPressed: () {
                                  var router = AutoRouter.of(context);
                                  router.pop();
                                })
                          ],
                        ),
                        SizedBox(height: 50.0,),

                        Padding(
                            padding: EdgeInsets.all(20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextWidget(textContent: 'Sign Up', textSize: 25.0, weight: FontWeight.w900, textColor: Colors.black,),
                                SizedBox(height: 45.0,),

                                TextWidget(textContent: 'Name', textSize: 12.0, textColor: Colors.grey,),
                                TextField(
                                  keyboardType: TextInputType.name,
                                  autofocus: true,
                                  cursorColor: basicColor,
                                  decoration: InputDecoration(
                                    fillColor: basicColor,
                                    errorText: validatorNewName
                                        ? 'Please Enter The UserName'
                                        : null,
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: basicColor,),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    newName = value;
                                    if (newName!.length < 1) {
                                      validatorNewName = true;
                                    }
                                    else {
                                      validatorNewName = false;
                                    }
                                  },
                                ),
                                SizedBox(height: 20.0,),

                                TextWidget(textContent: 'Email', textSize: 12.0, textColor: Colors.grey,),
                                TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  autofocus: true,
                                  cursorColor: basicColor,
                                  decoration: InputDecoration(
                                    errorText: validatorNewEmail
                                        ? 'Email should have contain \'@\' and \'.\''
                                        : null,
                                    fillColor: basicColor,
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: basicColor,),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    newEmail = value;
                                    if (newEmail!.isEmpty ||
                                        !newEmail!.contains('@') ||
                                        !newEmail!.contains('.')) {
                                      validatorNewEmail = true;
                                    }
                                    else {
                                      validatorNewEmail = false;
                                    }
                                  },
                                ),
                                SizedBox(height: 20.0,),

                                TextWidget(textContent: 'Password', textSize: 12.0, textColor: Colors.grey,),
                                TextField(
                                  keyboardType: TextInputType.visiblePassword,
                                  obscureText: true,
                                  cursorColor: basicColor,
                                  decoration: InputDecoration(

                                    fillColor: basicColor,
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color: basicColor,),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    newPassword = value;
                                    if (newPassword!.isEmpty ||
                                        newPassword!.length < 8) {
                                      validatorNewPassword = true;
                                    }
                                    else {
                                      validatorNewPassword = false;
                                    }
                                  },
                                ),
                                SizedBox(height: 35.0,),

                                DoWidget(backgroundColor: basicColor,
                                  paddingValue: 0.0,
                                  childy: textButton(
                                    childy: TextWidget(textContent: 'SIGN UP',
                                      textColor: Colors.white.withOpacity(0.8),
                                      textSize: 15.0,
                                      weight: FontWeight.w400,),
                                    onPressed: () {
                                      if (validatorNewName == false &&
                                          validatorNewEmail == false &&
                                          validatorNewPassword == false)
                                        Provider.of<ProviderData>(
                                            context, listen: false).register(
                                            context, newName, newEmail,
                                            newPassword);
                                    },
                                  ),),
                              ],
                            )),
                      ],
                    ),
                  ),
                );
              }
          );
          }
        ),
      );
  }
}
