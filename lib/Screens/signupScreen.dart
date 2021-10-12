import 'package:flutter/material.dart';
import '../widgets/textButton.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:ecommerancy/widgets/providerData.dart';
import 'package:ecommerancy/widgets/doWidget.dart';
import 'package:ecommerancy/widgets/textFormField.dart';
import 'package:ecommerancy/widgets/textWidget.dart';

String? newEmail;
String? newPassword;
String? newName;

class signUpScreen extends StatelessWidget {
  final _formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 20.0,color: Colors.black,),
            onPressed: () {
              var router = AutoRouter.of(context);
              router.pop();
            }),
      ),
      backgroundColor: Colors.white,
      body: Consumer<ProviderData>(
          builder: (context,providerDate,child) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextWidget(textContent: 'Sign Up', textSize: 25.0, weight: FontWeight.w900, textColor: Colors.black,),
                            SizedBox(height: 45.0,),

                            TextForm(
                              inputType: TextInputType.name,
                              validatorFunction: (value) {
                                return(value == null || value.isEmpty
                                    ? 'Please Enter The UserName'
                                    : null);
                              },
                              label: 'Name',
                              onChanged: (value){
                                newName=value;
                              },
                              obscureValue: false,
                            ),
                            SizedBox(height: 20.0,),

                            TextForm(
                              inputType: TextInputType.emailAddress,
                              validatorFunction: (value){
                                return(value==null || value.isEmpty || !value.contains('@') || !value.contains('.')?'Email Should contains \'@\' and \'.\' ':null);
                              },
                              label: 'Email',
                              onChanged: (value){
                                newEmail=value;
                              },
                              obscureValue: false,
                            ),
                            SizedBox(height: 20.0,),

                            TextForm(
                              inputType: TextInputType.visiblePassword,
                              obscureValue: true,
                              validatorFunction: (value){
                                return(value==null || value.isEmpty || value.length<8?'Password Should contains at least 8 characters ':null);
                              },
                              label: 'Password',
                              onChanged: (value){
                                newPassword=value;
                              },),
                            SizedBox(height: 35.0,),

                            DoWidget(backgroundColor: basicColor,
                              paddingValue: 0.0,
                              childy: textButton(
                                childy: TextWidget(textContent: 'SIGN UP',
                                  textColor: Colors.white.withOpacity(0.8),
                                  textSize: 15.0,
                                  weight: FontWeight.w400,),
                                onPressed: () async{
                                  if(_formKey.currentState!.validate()){
                                    await Provider.of<ProviderData>(
                                        context, listen: false).register(
                                        context, newName, newEmail,
                                        newPassword);
                                  }
                                },
                              ),),
                          ],
                        ),
                      )),
                ],
              ),
            );
          }
      ),
    );
  }
}

