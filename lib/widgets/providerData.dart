//buisness layer=view model = provider date
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart'as http;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';
import 'package:ecommerancy/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';

String status='login s';
//Map userData={};

class ProviderData extends ChangeNotifier{
  ProviderData();

  Map userData={};
  Map get _userData2{
    return userData;
  }

  set _userData2(Map a){
    userData=a;
  }
  //TODO:1- Add Encapsulation
  //TODO:2- Clean your code
//encapsulation: data in buissness layer like provider data , always i used it like user data then i do getter and setter
  //
  //
// dispose the values there
  // we need to dispodse the value : reload for application

  disposeValue(n, e, p){
    n=e=p='';
    print('this value from disposeValue $n');
    notifyListeners();
  }

  Future login(emailLog,passwordLog,BuildContext context) async{
    var _request = http.Request('GET', Uri.parse('https://60cfbb144a030f0017f67f1d.mockapi.io/api/v1/users?email=$emailLog&password=$passwordLog'));
    http.StreamedResponse _response = await _request.send();

    //Map _userData;
    notifyListeners();
    if (_response.statusCode == 200) {
      await _response.stream.bytesToString().then((value) {
        if(value=='[]'){
          status='Error: didn\'t find email or password, please try again or SIGN UP';
          _userData2={};
          print(status);
          print(value);
          print('hello i am $_userData2 khkh');//userData
        }
        else{
          print(value);
          status=('Successful LogIn');
          _userData2={'email':emailLog,'password':passwordLog};
          print(status);
          AutoRouter.of(context).push(HomeScreen());
          print('hello i am $_userData2 brbrbr');
        }
        userData=_userData2;
        print(userData);
      });
    }
    else {
      print(_response.reasonPhrase);
      return status='Please Try Again';
    }
  }

  loginFB(BuildContext context)async{
    notifyListeners();
    try {
      final fb = await FacebookAuth.instance.login();
      if (fb.status == LoginStatus.success) {
        //final _userData = await FacebookAuth.instance.getUserData();
        _userData2 = await FacebookAuth.instance.getUserData();
        print(userData);
        AutoRouter.of(context).push(HomeScreen());
      }
    }catch(e){
      print(e);
    }
  }

  loginGoogle(BuildContext context)async{
    final FirebaseAuth auth=FirebaseAuth.instance;
    final GoogleSignIn googleSignIn=new GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount=await googleSignIn.signIn();

    User? user;
    notifyListeners();
    if(googleSignInAccount!=null){
      final GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
      final AuthCredential credential=GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      try{
        final authResult=await auth.signInWithCredential(credential);
        user=authResult.user!;
        assert(!user.isAnonymous);
        //assert(await user.getIdToken()!=null);
        User? currentUser= auth.currentUser;
        assert(user.uid==currentUser!.uid);
        print('user name: ${user.displayName}');
        print('user email ${user.email}');
        print('log in using google is ok');
        AutoRouter.of(context).push(HomeScreen());
      }
      catch(e){
        print('Error occurred using Google Sign-In. Try again.');
      }
      return user;
    }
  }

  register(BuildContext context,registerName,registerEmail,registerPassword) async{
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('https://60cfbb144a030f0017f67f1d.mockapi.io/api/v1/users'));
    request.body = jsonEncode({
      "name": registerName,
      "email": registerEmail,
      "password": registerPassword
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    notifyListeners();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      //=========Q.S.A.T=======
      // @override
      // void dispose()async{
      //   await registerName.dispose();
      //   await registerEmail.dispose();
      //   await registerPassword.dispose();
      //   print(await registerName);
      //   super.dispose();
      // }
      print(response.reasonPhrase);
      print(registerName);
      print(registerEmail);
      print(registerPassword);
      var router=AutoRouter.of(context);
      router.push(HomeScreen());
      // dispose();
    }
    return registerName;
  }

  logOut(BuildContext context) async{
     await FacebookAuth.instance.logOut();
     await GoogleSignIn().signOut();
     var routes=AutoRouter.of(context);
     routes.push(SignInScreen());
    _userData2={};
    print(userData);
    print('loged out');
     notifyListeners();
  }
}

// set validator for some value


