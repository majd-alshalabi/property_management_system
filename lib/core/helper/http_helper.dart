import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:property_management_system/core/model/register_model/register_params.dart';
import 'package:property_management_system/core/model/register_model/register_response.dart';

class HttpHelper {
  String baseUrl_api = 'http://10.0.2.2:8000/api';
  Future<Either<RegisterResponse, String>> register(
      RegisterParams params) async {
    try {
      var url = Uri.parse(baseUrl_api + "/register");
      print(params.toJson());
      var response = await http.post(url, body: params.toJson());
      var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
      return Left(RegisterResponse.fromJson(decodedResponse));
    } catch (e) {
      return Right('error while connecting');
    }
  }
}
