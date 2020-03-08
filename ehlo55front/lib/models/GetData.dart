import 'dart:convert';
import 'package:http/http.dart' as http;

class GetData {
  Future fetchData(String url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load');
    }
  }
}
