import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ecommerancy/widgets/textButton.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerancy/routes/router.gr.dart';
import 'package:provider/provider.dart';
import 'package:ecommerancy/widgets/providerData.dart';
import 'package:ecommerancy/widgets/textFormField.dart';
import 'package:ecommerancy/widgets/doWidget.dart';
import 'package:ecommerancy/widgets/textWidget.dart';

class SignInScreen extends StatelessWidget {
  final _formKey=GlobalKey<FormState>();
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<ProviderData>(
          builder: (context,providerDate,child){
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 20.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextWidget(textColor: Colors.black, textContent: 'Welcome,', textSize: 25.0, weight: FontWeight.w900,),
                          textButton( childy: TextWidget(textColor: basicColor, textContent: 'Sign Up', textSize: 14.0,  weight: FontWeight.w200,),
                            onPressed: () {
                              AutoRouter.of(context).push(SignUpScreen());
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: 7.0,),

                      TextWidget(textContent: 'Sign in to Continue', textColor: Colors.grey.withOpacity(0.9), textSize: 12.0,),
                      SizedBox(height: 25.0,),

                      TextForm(
                        inputType: TextInputType.emailAddress,
                        validatorFunction: (value){
                          return(value==null || value.isEmpty || !value.contains('@') || !value.contains('.')?'Email Should contains \'@\' and \'.\' ':null);
                        },
                        label: 'Email',
                        onChanged: (value){
                          email=value;
                        },
                        obscureValue: false,
                      ),
                      SizedBox(height: 20.0,),

                      TextForm(
                        inputType: TextInputType.emailAddress,
                        obscureValue: true,
                        validatorFunction: (value){
                          return(value==null || value.isEmpty || value.length<8 ?'Password Should contains at least 8 characters ':null);
                        },
                        label: 'Password',
                        onChanged: (value){
                          password=value;
                        },),
                      SizedBox(height: 10.0,),

                      Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            textButton(childy: TextWidget(textSize: 13.0, textContent: 'Forgot password?', textColor: Colors.black, weight: FontWeight.w700,),
                              onPressed: () {},)
                          ]
                      ),
                      SizedBox(height: 15.0,),

                      DoWidget(
                        paddingValue: 0.0,
                        backgroundColor: basicColor,
                        childy: textButton(childy: TextWidget(textColor: Colors.white.withOpacity(0.8), textContent: 'SIGN IN', textSize: 15.0, weight: FontWeight.w400,),
                          onPressed: () {
                            if(_formKey.currentState!.validate()){
                              Provider.of<ProviderData>(
                                  context, listen: false).login(email, password, context);
                            }
                          },
                        ),
                      ),

                      SizedBox(height: 35.0,),

                      TextWidget(textColor: Colors.black.withOpacity(0.8), textContent: '-OR-', weight: FontWeight.w900, alignMethode: TextAlign.center,),
                      SizedBox(height: 35.0,),

                      DoWidget(
                        backgroundColor: Colors.white,
                        paddingValue: 15.0,
                        childy: textButton(buttonColor: Colors.white,
                          onPressed: () {
                            Provider.of<ProviderData>(context,listen:false).loginFB(context);
                          },
                          childy: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(image: AssetImage('images/fb.png'),
                                height: 20.0,
                                width: 20.0,),
                              TextWidget(textColor: Colors.black.withOpacity(0.8),
                                textContent: 'Sign In with Facebook',
                                weight: FontWeight.w600,
                                textSize: 12.0,),
                              SizedBox(width: 30.0,),
                            ],
                          ),),),
                      SizedBox(height: 25.0,),

                      DoWidget(paddingValue: 15.0,
                        backgroundColor: Colors.white,
                        childy: textButton(buttonColor: Colors.white, onPressed: () {
                          Provider.of<ProviderData>(context,listen: false).loginGoogle(context);
                        },
                          childy: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image(image: AssetImage('images/google.png'),
                                height: 20.0,
                                width: 20.0,),
                              TextWidget(textContent: 'Sign In with Google',
                                textColor: Colors.black.withOpacity(0.8),
                                weight: FontWeight.w600,
                                textSize: 12.0,),
                              SizedBox(width: 30.0,),
                            ],
                          ),),),
                    ],
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
