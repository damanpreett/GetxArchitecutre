import '../data/network/api_end_points.dart';
import '../data/network/base_api_services.dart';
import '../data/network/network_api_service.dart';

class AuthRepository{
  final BaseApiService _apiService =NetworkApiService();

// Future<LoginModel> loginApi(dynamic data)async{
Future<dynamic> loginApi(dynamic data)async{
  try{
      dynamic response=await _apiService.postApi(ApiEndPoint.login,data);
      // return  LoginModel.fromJson(response);
      return  response;
    }catch(e){
      rethrow ;
    }
  }
}