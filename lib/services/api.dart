import 'dart:convert';

import 'package:http/http.dart' as http;

class CallApi {
  final String _url = "http://10.0.2.2:8000/api/";
  postData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: jsonEncode(data),
      headers: _setHeaders(),
    );
  }
  _setHeaders() =>
      {'Content-type': 'aplication/json', 'Accept': 'application/json'};

  getProductData(apiUrl) async {
    http.Response response = await http.get(Uri.parse(_url + apiUrl));
    try {
      if (response.statusCode == 200) {
        return response;
      } else {
        return 'failed';
      }
    } catch (e) {
      print(e);
      return 'failed';
    }
  }
}
