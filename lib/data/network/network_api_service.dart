import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../../utils/constants.dart';
import '../../utils/share_pref.dart';
import '../app_exception.dart';
import 'base_api_services.dart';
import 'package:http_parser/src/media_type.dart';
import 'dart:typed_data';
import 'package:http_parser/http_parser.dart';

class NetworkApiService extends BaseApiService {
  @override
  Future getApi(String url) async {
    dynamic responseJson;
    if (kDebugMode) {
      print("url is : $url");
    }
    try {
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 20));
      if (kDebugMode) {
        print("response :${response.statusCode}");
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on TimeoutException {
      throw RequestTimeOutException("TimeoutException");
    }
    return responseJson;
  }

  @override
  Future getApiWithHeader(String url) async {
    dynamic responseJson;

    try {
      var token = await SharePref.getString(Constants.token);
      if (kDebugMode) {
        print("url is : $url , token $token");
        print('token :$token');
      }

      final response = await http.get(
        Uri.parse(url),
        headers: {"content-type": "application/json", 'authorization': token},
      ).timeout(Duration(seconds: 20));
      // final response = await http.get(Uri.parse(url).replace(queryParameters:{'page':page.toString()})).timeout(Duration(seconds: 20));
      if (kDebugMode) {
        print("response :${response.statusCode}");
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on TimeoutException {
      throw RequestTimeOutException("TimeoutException");
    }
    return responseJson;
  }

  @override
  Future getApiWithHeaderData(String url, dynamic jsonBody) async {
    dynamic responseJson;

    try {
      var token = await SharePref.getString(Constants.token);
      if (kDebugMode) {
        print("url is : $url ,token $token \n: Data is $jsonBody");
      }
      final response = await http
          // .get(Uri.parse(url) .replace(queryParameters:  queryParameters),
          .get(
        Uri.parse(url + '/' + jsonBody),
        headers: {
          "content-type": "application/json",
          'authorization': token,
        },
      ).timeout(Duration(seconds: 20));
      // final response = await http.get(Uri.parse(url).replace(queryParameters:{'page':page.toString()})).timeout(Duration(seconds: 20));
      if (kDebugMode) {
        print("response :${response.statusCode}");
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on TimeoutException {
      throw RequestTimeOutException("TimeoutException");
    }
    return responseJson;
  }

  @override
  Future deleteApiWithHeader(String url, jsonBody) async {
    dynamic responseJson;

    try {
      var token = await SharePref.getString(Constants.token);
      if (kDebugMode) {
        print("url is : $url , token $token\nData is $jsonBody");
      }
      final response = await http.delete(
        Uri.parse(url + '/' + jsonBody),
        headers: {
          "content-type": "application/json",
          'authorization': token,
        },
      ).timeout(Duration(seconds: 20));
      if (kDebugMode) {
        print("response :${response.statusCode}");
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException("");
    } on TimeoutException {
      throw RequestTimeOutException("TimeoutException");
    }
    return responseJson;
  }

  @override
  Future putApiWithHeader(String url, jsonBody) async {
    dynamic responseJson;
    try {
      var token = await SharePref.getString(Constants.token);
      if (kDebugMode) {
        print("url is : $url\nbody:${jsonBody} , token $token");
      }
      final response = await http
          .put(Uri.parse(url),
              headers: {
                "content-type": "application/json",
                'authorization': token
              },
              body: jsonEncode(jsonBody))
          .timeout(Duration(seconds: 20));
      if (kDebugMode) {
        print("response :${response.statusCode}");
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('Server not connected');
    } on TimeoutException {
      throw RequestTimeOutException("TimeoutException");
    }
    return responseJson;
  }
  @override
  Future putApi(String url) async {
    dynamic responseJson;
    try {
      var token = await SharePref.getString(Constants.token);
      if (kDebugMode) {
        print("url is : $url , token $token");
      }
      final response = await http
          .put(Uri.parse(url),
              headers: {
                "content-type": "application/json",
                'authorization': token
              })
          .timeout(Duration(seconds: 20));
      if (kDebugMode) {
        print("response :${response.statusCode}");
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('Server not connected');
    } on TimeoutException {
      throw RequestTimeOutException("TimeoutException");
    }
    return responseJson;
  }

  @override
  Future putApiWithHeaderData(String url, jsonBody) async {
    dynamic responseJson;
    try {
      var token = await SharePref.getString(Constants.token);
      if (kDebugMode) {
        print("url is : $url\nbody:${jsonBody} , token $token");
      }
      final response = await http
          .put  (Uri.parse(url + '/' + jsonBody),
              headers: {
                "content-type": "application/json",
                'authorization': token
              },
           )
          .timeout(Duration(seconds: 20));
      if (kDebugMode) {
        print("response :${response.statusCode}");
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('Server not connected');
    } on TimeoutException {
      throw RequestTimeOutException("TimeoutException");
    }
    return responseJson;
  }

  @override
  Future postApiWithHeader(String url, jsonBody) async {
    dynamic responseJson;

    try {
      var token = await SharePref.getString(Constants.token);
      if (kDebugMode) {
        print(" inside post url is : $url\nbody:${jsonBody} , token $token");
      }
      final response = await http
          .post(Uri.parse(url),
              headers: {
                "content-type": "application/json",
                'authorization': token
              },
              body: jsonEncode(jsonBody))
          .timeout(Duration(seconds: 20));
      if (kDebugMode) {
        print("response :${response.statusCode}");
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('Server not connected');
    } on TimeoutException {
      throw RequestTimeOutException("TimeoutException");
    }
    return responseJson;
  }

  @override
  Future postApi(String url, dynamic jsonBody) async {
    dynamic responseJson;
    if (kDebugMode) {
      print("url is : $url\nbody:${jsonBody}");
    }
    try {
      final response = await http
          .post(Uri.parse(url),
              headers: {"content-type": "application/json"},
              body: jsonEncode(jsonBody))
          .timeout(Duration(seconds: 20));
      if (kDebugMode) {
        print("response :${response.statusCode}");
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('Server not connected');
    } on TimeoutException {
      throw RequestTimeOutException("TimeoutException");
    }
    return responseJson;
  }

  @override
  Future notificationSend(String url, jsonBody)async {
    dynamic responseJson;
    if (kDebugMode) {
      print("url is : $url\nbody:${jsonBody}");
    }
    var id=jsonBody['id'];
    var name=jsonBody['name'];
    var receiverId=jsonBody['receiverId'];
    var senderId=jsonBody['senderId'];
    var serviceId=jsonBody['serviceId'];
    var login=jsonBody['login'];
    var receiverName=jsonBody['receiverName'];
    var body=jsonBody['msg'];
    print('user_${receiverId}');
    try {
      var request;
      if(Platform.isIOS){
        request = {
          'notification': {'title':name , 'body':body,"badge":1},
          'data': {
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'type': 'COMMENT',
     'id':id,
     'name':name,
     'receiverName':receiverName,
     'receiverId':receiverId,
     'senderId':senderId,
     'serviceId':serviceId,
     'login':login,
            'channelName':'Notification Send',
            'channelDescription':'Notification description',
          },
          'to': '/topics/user_${receiverId}'
        };
      }
      else{
        request = {
          'notification': {'title': name, 'body':body},
          'data': {
            'click_action': 'FLUTTER_NOTIFICATION_CLICK',
            'type': 'COMMENT',
            'id':id,
            'name':name,
            'receiverName':receiverName,
            'receiverId':receiverId,
            'senderId':senderId,
            'serviceId':serviceId,
            'login':login,
            'channelName':'Notification Send',
            'channelDescription':'Notification description',
          },
          'to': '/topics/user_${receiverId}'
        };
      }
      final response = await http
          .post(Uri.parse(url),
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${Constants.fcmSendToken}",
          },
          body: jsonEncode(request))
          .timeout(Duration(seconds: 20));
      if (kDebugMode) {
        print("response :${response.statusCode}");
      }
      responseJson = returnResponse(response);
    } on SocketException {
      throw InternetException('Server not connected');
    } on TimeoutException {
      throw RequestTimeOutException("TimeoutException");
    }
    return responseJson;
  }

  @override
  Future postServiceUploadImageApi(
      String url, String serviceId, String imagePath) async {
    dynamic responseJson;
    if (kDebugMode) {
      print("url is : $url\nserviceId:${serviceId}\nimagePath${imagePath}");
    }
    try {
      var token = await SharePref.getString(Constants.token);
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers
          .addAll({"content-type": "application/json", 'authorization': token});
      request.fields['serviceId'] = serviceId;
      http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
        'image',
        imagePath,
        contentType: MediaType.parse("image/png"),
      );
      request.files.add(multipartFile);
      var res = await request.send();
      var result = await http.Response.fromStream(res);
      responseJson = returnResponse(result);
    } on SocketException {
      throw InternetException('Server not connected');
    } on TimeoutException {
      throw RequestTimeOutException("TimeoutException");
    }
    return responseJson;
  }

  @override
  Future postUploadImageApi(
      String url, String imagePath, Uint8List? data, String name) async {
    dynamic responseJson;
    if (kDebugMode) {
      print("url is : $url\npostUploadImageApi${imagePath}");
    }
    try {
      var token = await SharePref.getString(Constants.token);
      var request = http.MultipartRequest('PATCH', Uri.parse(url));
      request.headers
          .addAll({"content-type": "application/json", 'authorization': token});
      if (kIsWeb) {
        request.files.add(await http.MultipartFile.fromBytes('profilePicture', data!,
            contentType: MediaType.parse("image/png"), filename: name));
      } else {
        http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
            'profilePicture', imagePath,
            contentType: MediaType.parse("image/png"));
        request.files.add(multipartFile);
      }

      var res = await request.send();
      var result = await http.Response.fromStream(res);
      responseJson = returnResponse(result);
    } on SocketException {
      throw InternetException('Server not connected');
    } on TimeoutException {
      throw RequestTimeOutException("TimeoutException");
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
        throw UnAuthorisedException(response.body.toString());
      case 403:
        throw UnAuthorisedException(response.body.toString());
      case 404:
        throw UnAuthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }

  @override
  Future createService(
      String url,
      String categoriesName,
      String subCategoriesName,
      String serviceName,
      String totalExperience,
      String currency,
      String chargePerService,
      String areaRange,
      String description,
      List<String> dayList,
      List<String> startTimeList,
      List<String> endTimeList,
      List<File> imagesList,
      List<Uint8List> bitesImageList,
      List<String> backBitesImageNameList) async {
    dynamic responseJson;
    if (kDebugMode) {
      print("url is : $url");
    }
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      var token = await SharePref.getString(Constants.token);
      request.headers
          .addAll({"content-type": "application/json", 'authorization': token});
      request.fields['categoriesName'] = categoriesName;
      request.fields['subCategoriesName'] = subCategoriesName;
      request.fields['serviceName'] = serviceName;
      request.fields['totalExperience'] = totalExperience;
      request.fields['currency'] = currency;
      request.fields['chargePerService'] = chargePerService;
      request.fields['areaRange'] = areaRange;
      request.fields['description'] = description;
      for (String item in dayList) {
        request.files.add(http.MultipartFile.fromString('availability', item));
      }
      for (String item in endTimeList) {
        request.files.add(http.MultipartFile.fromString('endTime', item));
      }
      for (String item in startTimeList) {
        request.files.add(http.MultipartFile.fromString('startTime', item));
      }
      List<http.MultipartFile> multipartFileList = [];
      if (kIsWeb) {
        for (int i = 0; i < bitesImageList.length; i++) {
          multipartFileList.add(await http.MultipartFile.fromBytes(
              'images', bitesImageList[i],
              contentType: MediaType.parse("image/png"),
              filename: backBitesImageNameList[i]));
        }
      } else {
        for (int i = 0; i < imagesList.length; i++) {
          multipartFileList.add(await http.MultipartFile.fromPath(
            'images',
            imagesList[i].path,
            contentType: MediaType.parse("image/png"),
          ));
        }
      }
        request.files.addAll(multipartFileList);
      print('hitting');
      var res = await request.send();
      var result = await http.Response.fromStream(res);
      responseJson = returnResponse(result);
    } on SocketException {
      throw InternetException('Server not connected');
    } on TimeoutException {
      throw RequestTimeOutException("TimeoutException");
    }
    return responseJson;
  }

}
