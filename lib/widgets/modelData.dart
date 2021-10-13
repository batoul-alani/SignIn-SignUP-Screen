import 'package:http/http.dart'as http;

loginModel(emailLogModel,passwordLogModel)async{
  var _request = http.Request('GET', Uri.parse('https://60cfbb144a030f0017f67f1d.mockapi.io/api/v1/users?email=$emailLogModel&password=$passwordLogModel'));
  http.StreamedResponse response = await _request.send();

}