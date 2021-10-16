//buisness layer=view model = provider date
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../services/api_service.dart';

class ProviderData extends ChangeNotifier{
  ProviderData();

  Map _userDataNew={};
  Map get userDataNew => _userDataNew;

  Map userData={};
  Map get _userData2{
    return userData;
  }

  set _userData2(Map a){
    userData=a;
  }

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
    // var headers = {'Content-Type': 'application/json'};
    // var request = http.Request('POST', Uri.parse('https://60cfbb144a030f0017f67f1d.mockapi.io/api/v1/users'));
    // request.body = jsonEncode({
    //   "name": registerName,
    //   "email": registerEmail,
    //   "password": registerPassword
    // });
    // request.headers.addAll(headers);
    // http.StreamedResponse response = await request.send();
    registerModel(registerName, registerEmail, registerPassword, context);
    notifyListeners();
    // if (response.statusCode == 200) {
    //   print(await response.stream.bytesToString());
    // }
    // else {
    //   //=========Q.S.A.T=======
    //   // @override
    //   // void dispose()async{
    //   //   await registerName.dispose();
    //   //   await registerEmail.dispose();
    //   //   await registerPassword.dispose();
    //   //   print(await registerName);
    //   //   super.dispose();
    //   // }
    //   print(response.reasonPhrase);
    //   print(registerName);
    //   print(registerEmail);
    //   print(registerPassword);
    //   var router=AutoRouter.of(context);
    //   router.push(HomeScreen());
    //   // dispose();
    // }
    // return registerName;
  }

  logOut(BuildContext context) async{
     logOut(context);
     notifyListeners();
  }
}