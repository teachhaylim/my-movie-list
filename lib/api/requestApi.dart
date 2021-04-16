import 'package:http/http.dart' as http;
import 'dart:convert' show json;

getData(url) async {
  var response = await http.get(Uri.parse(url));

  return json.decode(response.body)["results"];
}
