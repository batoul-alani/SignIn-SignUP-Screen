import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:ecommerancy/routes/router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

String status='';
String fromValue='';

Map _uD={};
Map get uD => _uD;
set uD(Map b){
  _uD=b;
}

Map _categories={};
Map get categories=>_categories;
set categories(Map c){
  _categories=c;
}

Map _products={};
Map get products=> _products;
set products(Map p){
  _products=p;
}

Map _categoriesProduct={};
Map get categoriesProduct=>_categoriesProduct;
set categoriesProduct(Map cp){
  _categoriesProduct=cp;
}

getProductsByCategoryModel(var categoryIndex) async{
  var _request = http.Request('GET', Uri.parse('https://60cfbb144a030f0017f67f1d.mockapi.io/api/v1/categories/$categoryIndex/products'));
  http.StreamedResponse _response = await _request.send();
  if (_response.statusCode == 200) {
    await _response.stream.bytesToString().then((value) {
      var _productsInfo=json.decode(value);
      int _length=_productsInfo.length;
      for(int i=0;i<_length;i++){
        _categoriesProduct[i]=_productsInfo[i];
      }
      categoriesProduct=_categoriesProduct;
    });
  }
  else {
  print(_response.reasonPhrase);
  }
}

getCategoriesModel() async{
  var _categoriesRequest = http.Request('GET', Uri.parse('https://60cfbb144a030f0017f67f1d.mockapi.io/api/v1/categories'));
  http.StreamedResponse _categoriesResponse = await _categoriesRequest.send();
  if (_categoriesResponse.statusCode == 200) {
    await _categoriesResponse.stream.bytesToString().then((value) {
      var categoriesInfo=json.decode(value);
      int _length=categoriesInfo.length;
      for (int i=0;i<_length;i++){
        _categories[i]=categoriesInfo[i];
      }
      categories=_categories;
    });
  }
  else {
  print(_categoriesResponse.reasonPhrase);
  }
}

getProductsModel()async{
  var _request = http.Request('GET', Uri.parse('https://60cfbb144a030f0017f67f1d.mockapi.io/api/v1/products'));
  http.StreamedResponse _response = await _request.send();

  if (_response.statusCode == 200) {
    await _response.stream.bytesToString().then((value) {
      var productsInfo=json.decode(value);
      int _length=productsInfo.length;
      for (int i=0;i<_length;i++){
        _products[i]=productsInfo[i];
      }
      products=_products;
    });
  }
  else {
    print(_response.reasonPhrase);
  }

}

loginModel(emailLogModel,passwordLogModel,BuildContext context) async{
  var _request = http.Request('GET', Uri.parse('https://60cfbb144a030f0017f67f1d.mockapi.io/api/v1/users?email=$emailLogModel&password=$passwordLogModel'));
  http.StreamedResponse _response = await _request.send();
  if(_response.statusCode==200){
    await _response.stream.bytesToString().then((value) {
      if(value=='[]'){
        status='Error: didn\'t find email or password, please try again or SIGN UP';
        _uD= {};
      }
      else{
        status='Successful LogIn';
        _uD={'email':emailLogModel,'password':passwordLogModel};
        AutoRouter.of(context).push(HomeScreen());

        var test1=jsonDecode(value)[0]['email'];
        var test2=json.decode(value);

        print(test2.length);
        print(test1);
      }
      uD=_uD;
      print(value);
      print(status);
      print('User Information $uD');
    });
  }
  else {
    print(_response.reasonPhrase);
    status='Please Try Again';
    print(status);
  }
}

loginFbModel(BuildContext context) async{
  try {
    final fb = await FacebookAuth.instance.login();
    if (fb.status == LoginStatus.success) {
      _uD = await FacebookAuth.instance.getUserData();
      AutoRouter.of(context).push(HomeScreen());
    }
    uD=_uD;
    print(uD);
  } catch(e){
    print(e);
  }
}

User? user;
loginGoogleModel(BuildContext context) async{
  final FirebaseAuth auth=FirebaseAuth.instance;
  final GoogleSignIn googleSignIn=new GoogleSignIn();
  final GoogleSignInAccount? googleSignInAccount=await googleSignIn.signIn();
  User? _user;
  if(googleSignInAccount!=null){
    final GoogleSignInAuthentication googleSignInAuthentication=await googleSignInAccount.authentication;
    final AuthCredential credential=GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );
    try{
      final authResult=await auth.signInWithCredential(credential);
      _user=authResult.user!;
      assert(!_user.isAnonymous);
      //assert(await user.getIdToken()!=null);
      User? currentUser= auth.currentUser;
      assert(_user.uid==currentUser!.uid);
      print('user name: ${_user.displayName}');
      print('user email ${_user.email}');
      print('log in using google success');
      AutoRouter.of(context).push(HomeScreen());
    }
    catch(e){
      print('Error occurred using Google Sign-In. Try again.');
    }
    user=_user;
    return user;
  }
}

registerModel(registerNameModel,registerEmailModel,registerPasswordModel,BuildContext context) async{
  var headers = {'Content-Type': 'application/json'};
  var request = http.Request('POST', Uri.parse('https://60cfbb144a030f0017f67f1d.mockapi.io/api/v1/users'));
  request.body = jsonEncode({
    "name": registerNameModel,
    "email": registerEmailModel,
    "password": registerPasswordModel
  });
  request.headers.addAll(headers);
  http.StreamedResponse response = await request.send();
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
  print(registerNameModel);
  print(registerEmailModel);
  print(registerPasswordModel);
  var router=AutoRouter.of(context);
  router.push(HomeScreen());
  // dispose();
  }
  return registerNameModel;
}

logoutModel(BuildContext context) async{
  await FacebookAuth.instance.logOut();
  await GoogleSignIn().signOut();
  user=null;
  var routes=AutoRouter.of(context);
  routes.push(SignInScreen());
  _uD={};
  uD=_uD;
  print(uD);
  print('logged out');
}