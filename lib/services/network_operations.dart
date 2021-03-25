import 'dart:convert';

import 'package:http/http.dart' as http;

const String serverUrl = "178.32.191.159:8000";
const String loginUrl = "/api/users/login/";
const String registerUrl = "/api/users/register/";
const String userProfile = "/api/users/profile";
const String makeVip = "/api/users/makevip/";

const String tipsUrl = "/api/tips";
const String recentTipsUrl = "/api/tips/recent";
const String featuredMatchUrl = "/api/tips/featured";

// The future of registration....
// Cool stuff..
Future<dynamic> userLogin(Map<String, String> loginInfo) async {
  var uri = Uri.http(serverUrl, loginUrl);
  var loginRequest = await http.post(uri, body: jsonEncode(loginInfo), headers: {
    'Content-Type': 'application/json; charset=UTF-8'
  });


  // assuming we go a positive response
  if (loginRequest.statusCode == 200) {
    // everything is okay
    return jsonDecode(loginRequest.body);
  } else if (loginRequest.statusCode == 404) {
    // if a status code 404 is returned,
    // 404 implies that the given user is not found.
    var incorrectLoginInfo = jsonDecode(loginRequest.body);
    return incorrectLoginInfo;
  }
  else {
    // something bad has really happened, possibly on the server side I guess..
    var errorMessage = '{"message": "Network Error, try again"}';
    return jsonDecode(errorMessage);
  }
}

// On to the other alternate future, the future of Registration.
Future<dynamic> userRegistration(Map<String, String> registrationInfo) async {
  var uri = Uri.http(serverUrl, registerUrl);

  var registrationResponse = await http.post(uri, body: jsonEncode(registrationInfo), headers: {
    'Content-Type': 'application/json; charset=UTF-8'
  });

  if (registrationResponse.statusCode == 200) {
    // implies that a user was successfully registered.
    return jsonDecode(registrationResponse.body);
  } else {
    // something went wrong somewhere, maybe in the user input I believe, or the server maybe
    var errorMessage = '{"message": "${registrationResponse.body}"}';
    return jsonDecode(errorMessage);
  }
}