import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../widgets/constants.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerancy/routes/router.gr.dart';
import 'package:provider/provider.dart';
import 'package:ecommerancy/widgets/providerData.dart';

class SignInScreen extends StatelessWidget {
  String? email;
  String? password;
  // var pattern =  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  bool validator = false;
  bool validatorPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<ProviderData>(
        builder: (context,providerDate,child){
        return LayoutBuilder(
          builder: (BuildContext context,BoxConstraints viewportConstraints){
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight,
                ),
                child: Padding(
                  padding: EdgeInsets.all(20.0),
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

                      TextWidget(textColor: Colors.grey, textContent: 'Email', textSize: 12.0,),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        autofocus: true,
                        cursorColor: basicColor,
                        onChanged: (value) {
                          email = value;
                          if(email!.isEmpty||!email!.contains('@')||!email!.contains('.')){
                            validator=true;
                          }
                          else{validator=false;}
                          },
                        decoration: InputDecoration(
                          fillColor: basicColor,
                          errorText: validator
                              ? 'Email should have contain \'@\' and \'.\''
                              : null,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: basicColor,),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),

                      TextWidget(textColor: Colors.grey, textContent: 'Password', textSize: 12.0,),
                      TextField(
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        cursorColor: basicColor,
                        onChanged: (value) {
                          password = value;
                          if(password!.isEmpty||password!.length<8){
                            validatorPassword=true; }
                          else{validatorPassword=false;}
                        },
                        decoration: InputDecoration(
                          errorText: validatorPassword
                              ? 'password should contain at least 8 charectars'
                              : null,
                          fillColor: basicColor,
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: basicColor,),
                          ),
                        ),
                      ),
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
                            if(validator==false && validatorPassword==false) {
                             Provider.of<ProviderData>(context,listen: false).login(email, password,context);}
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
            );},
        );}
      ),
    );
  }
}
