import 'dart:convert';
import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:property_management_system/core/helper/database_helper.dart';
import 'package:property_management_system/core/model/login_model/login_params.dart';
import 'package:property_management_system/core/model/login_model/login_response.dart';
import 'package:property_management_system/core/model/property_model/property_model.dart';
import 'package:property_management_system/core/model/register_model/register_params.dart';
import 'package:property_management_system/core/model/register_model/register_response.dart';

class HttpHelper {
  static String url = 'http://10.0.2.2:8000/';
  static String baseUrl_api = 'http://10.0.2.2:8000/api';
  static DatabaseHelper db = DatabaseHelper();
  static Future<Either<RegisterResponse, String>> register(
      RegisterParams params) async {
    try {
      var url = Uri.parse(baseUrl_api + "/registeruser");
      http.MultipartRequest request = new http.MultipartRequest('POST', url);
      request.fields.addAll(params.toJson());
      if (params.image != null)
        request.files.add(await http.MultipartFile.fromPath(
          'photo',
          params.image == null ? '' : params.image!.path,
        ));
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode >= 300) return Right('error while connecting');
      final respStr = await response.stream.bytesToString();
      var decodedResponse = json.decode(respStr);
      return Left(RegisterResponse.fromJson(decodedResponse));
    } catch (e) {
      return Right('error while connecting');
    }
  }

  static Future<Either<RegisterResponse, String>> registerManager(
      RegisterParams params) async {
    try {
      var url = Uri.parse(baseUrl_api + "/registermanjer");
      http.MultipartRequest request = new http.MultipartRequest('POST', url);
      request.fields.addAll(params.toJson());
      if (params.image != null)
        request.files.add(await http.MultipartFile.fromPath(
          'photo',
          params.image == null ? '' : params.image!.path,
        ));
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode >= 300) return Right('error while connecting');
      final respStr = await response.stream.bytesToString();
      var decodedResponse = json.decode(respStr);
      return Left(RegisterResponse.fromJson(decodedResponse));
    } catch (e) {
      return Right('error while connecting');
    }
  }

  static Future<Either<LoginResponse, String>> login(LoginParams params) async {
    try {
      var url = Uri.parse(baseUrl_api + "/login");
      print(params.toJson());
      var response = await http.post(url, body: params.toJson());
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return Left(LoginResponse.fromJson(decodedResponse));
    } catch (e) {
      return Right('error while connecting');
    }
  }

  static Future<Either<String, String>> uploadImage(File image) async {
    try {
      var url = Uri.parse(baseUrl_api + "/addphoto");
      http.MultipartRequest request = new http.MultipartRequest('POST', url);
      String token = await db.getTokenFromMyIdentity();
      print(token);
      request.headers.addAll({"Authorization": "Bearer $token"});
      request.files.add(await http.MultipartFile.fromPath(
        'imag',
        image.path,
      ));
      http.StreamedResponse response = await request.send();
      print(response.statusCode);
      if (response.statusCode >= 300) return Right('error while connecting');
      print(response.statusCode);
      final respStr = await response.stream.bytesToString();
      var decodedResponse = json.decode(respStr);
      print(decodedResponse);
      return Left(decodedResponse['data']['imag']);
    } catch (e) {
      return Right('error while connecting');
    }
  }

  static Future<Either<String, String>> addProperty(
      PropertyModel params) async {
    try {
      var url = Uri.parse(baseUrl_api + "/creatEstate");
      print(params.toJson());

      String token = await db.getTokenFromMyIdentity();
      print(token);
      var response = await http.post(url,
          body: params.toJson(), headers: {"Authorization": "Bearer $token"});
      print(response.statusCode);
      print(response.body);
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      print(decodedResponse);
      return Left('');
    } catch (e) {
      print(e);
      return Right('error while connecting');
    }
  }
}
