import 'package:untitled/data/network/network_api_services.dart';
import 'package:untitled/resources/app_url/app_url.dart';

class LoginRepository {

  final _apiService = NetworkApiServices();


  Future loginApi(var data)async{

    dynamic response = _apiService.postApi(data, AppUrl.loginApi);
    return response;
  }

}