import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:property_management_system/core/model/login_model/login_params.dart';
import 'package:property_management_system/core/model/login_model/login_response.dart';
import 'package:property_management_system/core/model/register_model/register_params.dart';
import 'package:property_management_system/core/model/register_model/register_response.dart';

class HttpHelper {
  String baseUrl_api = 'http://10.0.2.2:8000/api';
  Future<Either<RegisterResponse, String>> register(
      RegisterParams params) async {
    try {
      var url = Uri.parse(baseUrl_api + "/register");
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
      print(respStr);
      var decodedResponse = json.decode(respStr);
      return Left(RegisterResponse.fromJson(decodedResponse));
    } catch (e) {
      return Right('error while connecting');
    }
  }

  Future<Either<LoginResponse, String>> login(LoginParams params) async {
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
}
