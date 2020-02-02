import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

enum Methods { POST, GET }

class ServerEngine {
  final String baseUrl;
  String resourceUrl;
  dynamic parameters;
  Future<http.Response> _response;

  String getBaseUrl() {
    return this.baseUrl;
  }

  ServerEngine({@required this.baseUrl});

  void __httpPostRequest({String urlPost, dynamic parameters}){
    var url = urlPost;
    Map<String, String> headers = {"Content-type": "application/json"};
    Future<http.Response> response = http.post(url,headers: headers, body: this.parameters);
    this._response = response;
  //print(response.body);
  
  }

  void __httpGetRequest({String urlGet, dynamic parameters}) {
    var url = urlGet;
    Future<http.Response> response = http.get(url, headers: parameters);
    this._response = response;
  }

  Future<http.Response> sendRequest(
      {@required String resourceUrl,
      dynamic parameters,
      @required Methods methods}) {
    this.resourceUrl = resourceUrl;
    String url = this.baseUrl + this.resourceUrl;
  //print(url);
  //print(methods);
  //print(parameters);
    if (methods == Methods.POST) {
      __httpPostRequest(urlPost: url, parameters: parameters);
    } else if (methods == Methods.GET) {
      __httpGetRequest(urlGet: url, parameters: parameters);
    }

    return this._response;
  }
}
