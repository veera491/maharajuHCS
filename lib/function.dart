import 'dart:convert';
import 'package:http/http.dart' as http;

Future<List<dynamic>> fetchData(String url) async {
  var result =
  await http.get(Uri.parse(url));
  return jsonDecode(result.body)['results'];
}