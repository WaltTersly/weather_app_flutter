import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class NetworkPortion {
  NetworkPortion({required this.url});
  dynamic url;

  Future<dynamic> getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = convert.jsonDecode(data);

      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}
