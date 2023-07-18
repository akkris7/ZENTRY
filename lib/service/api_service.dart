import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';


class APIService{

  Future<Response?> postAPICall(String url, Object body, Map<String, String> headers) async {
    debugPrint(url);
    debugPrint(body.toString());
    try {
      Response response = await http.post(Uri.parse(url), body: body, headers: headers);
      debugPrint(response.body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Response?> getAPICall(String url, Map<String, String>? headers) async {
    debugPrint(url);
    try {
      Response response;
      if (headers != null) {
        response = await http.get(Uri.parse(url), headers: headers);
      } else {
        response = await http.get(Uri.parse(url));
      }

      debugPrint(response.body);
      return response;
    } catch (e) {
      throw Exception(e);
    }
  }
}