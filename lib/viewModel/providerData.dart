//buisness layer=view model = provider date
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../services/api_service.dart';

class ProviderData extends ChangeNotifier{
  ProviderData();

  disposeValue(n, e, p){
    n=e=p='';
    print('this value from disposeValue $n');
    notifyListeners();
  }

  Future login(emailLog,passwordLog,BuildContext context) async{
    loginModel(emailLog, passwordLog, context);
    notifyListeners();
  }

  loginFB(BuildContext context)async{
    loginFbModel(context);
    notifyListeners();
  }

  loginGoogle(BuildContext context)async{
    loginGoogleModel(context);
    notifyListeners();
  }

  register(BuildContext context,registerName,registerEmail,registerPassword) async{
    registerModel(registerName, registerEmail, registerPassword, context);
    notifyListeners();
  }

  logOut(BuildContext context) async{
    logoutModel(context);
     notifyListeners();
  }
}