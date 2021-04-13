import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

Future<dynamic> getFeaturedMatch() async {
  var url = Uri.http(serverUrl, featuredMatchUrl);

  var featuredMatchResponse = await http.get(url);

  return jsonDecode(featuredMatchResponse.body);
}

Future<dynamic> getRecentMatches() async {
  var url = Uri.http(serverUrl, recentTipsUrl);

  // attempt to get the tips from the repository
  var tipsResponse = await http.get(url);

  if (tipsResponse.statusCode == 200)  {
    return jsonDecode(tipsResponse.body);
  } else {
    var error = '{"message": "Sorry, check your connection"}';
    return jsonDecode(error);
  }
}

Future<dynamic> getAllTips() async {
  var url = Uri.http(serverUrl, tipsUrl);

  var tipsResponse = await http.get(url);

  if (tipsResponse.statusCode == 200) {
    return jsonDecode(tipsResponse.body);
  } else {
    return jsonDecode("{'message': 'an error occurred'}");
  }
}

Future<dynamic> getLoggedInUser() async {
  // assuming the user is already logged in, we should have a token
  // anyway, we don't even get to use this piece of code. what a waste.
  var prefs = await SharedPreferences.getInstance();
  var token = prefs.getString('winnintipsToken');

  var uri = Uri.http(serverUrl, userProfile);
  var profileRequest = await http.get(uri, headers: {
    'Authorization': 'Bearer $token'
  });

  return jsonDecode(profileRequest.body);
}