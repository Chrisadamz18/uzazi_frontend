import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:uzazi/models/loginResponse.dart';
import 'package:uzazi/services/sharedService.dart';
import '/models/registerRequest.dart';
import '/models/registerResponse.dart';
import '/models/loginRequest.dart';
import '../config.dart';

class APIService {
  static var client = http.Client();

  static Future<bool> login(LoginRequestModel model) async {
    Map<String, String> requestHearders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.loginAPI);

    var response = await client.post(
      url,
      headers: requestHearders,
      body: jsonEncode(model.toJson()),
    );
    if (response.statusCode == 200) {
      await SharedService.setLogDetails(
        loginResponseJson(response.body),
      );

      return true;
    } else {
      return false;
    }
  }

  static Future<RegisterResponseModel> register(
      RegisterRequestModel model) async {
    Map<String, String> requestHearders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.http(Config.apiURL, Config.registerAPI);

    var response = await client.post(
      url,
      headers: requestHearders,
      body: jsonEncode(model.toJson()),
    );
    return registerResponseJson(response.body);
  }

  static Future<String> getUserProfile() async {
    var loginDetails = await SharedService.loginDetails();
    Map<String, String> requestHearders = {
      'Content-Type': 'application/json',
      'Authorization': 'Basic ${loginDetails!.data.token}'
    };
    var url = Uri.http(Config.apiURL, Config.userProfileAPI);

    var response = await client.get(
      url,
      headers: requestHearders,
    );
    if (response.statusCode == 200) {
      // await response.body
      return response.body;
    } else {
      return "";
    }
  }
}
