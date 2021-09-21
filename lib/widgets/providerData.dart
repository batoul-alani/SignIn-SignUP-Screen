import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:ecommerancy/routes/router.gr.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart'as http;
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';

String status='login s';
Map userData={};

class ProviderData extends ChangeNotifier{
  ProviderData();

  Future login(emailLog,passwordLog,BuildContext context) async{
    var _request = http.Request('GET', Uri.parse('https://60cfbb144a030f0017f67f1d.mockapi.io/api/v1/users?email=$emailLog&password=$passwordLog'));
    http.StreamedResponse _response = await _request.send();
    Map _userData;
    notifyListeners();
    if (_response.statusCode == 200) {
      await _response.stream.bytesToString().then((value) {
        if(value=='[]'){
          status='Error: didn\'t find email or password, please try again or SIGN UP';
          _userData={};
          print(status);
          print(value);
        }
        else{
          print(value);
          status=('Successful LogIn');
          _userData={'email':emailLog,'password':passwordLog};
          print(status);
          AutoRouter.of(context).push(HomeScreen());
        }
        userData=_userData;
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
        final _userData = await FacebookAuth.instance.getUserData();
        print(_userData);
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
      print('in if ${response.reasonPhrase}');
    }
    else {
      //=========Q.S.A.T=======
      print(response.reasonPhrase);
      print(registerName);
      print(registerEmail);
      print(registerPassword);
      var router=AutoRouter.of(context);
      router.push(HomeScreen());
    }
    return registerName;
  }

  logOut(BuildContext context) async{
     await FacebookAuth.instance.logOut();
     await GoogleSignIn().signOut();
    //Add LogOut From Api
    var routes=AutoRouter.of(context);
    routes.push(SignInScreen());
    userData={};
    print('loged out');
     notifyListeners();
  }
}