//buisness layer=view model = provider date
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../services/api_service.dart';


class ProviderData extends ChangeNotifier{
  ProviderData();

  int _currentIndex=0;
  int get currentIndex => _currentIndex;
  set currentIndex(int index){
    _currentIndex=index;
    notifyListeners();
  }

  disposeValue(n, e, p){
    n=e=p='';
    print('this value from disposeValue $n');
    notifyListeners();
  }
  getProductsByCategory(index)async{
    await getProductsByCategoryModel(index);
    notifyListeners();
  }
  getProducts() async{
    await getProductsModel();
    notifyListeners();
  }
  getCategories()async{
    await getCategoriesModel();
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