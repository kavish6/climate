import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  Network(this.urk);
  final Uri urk;
  Future getLocationData() async {
    http.Response response = await http.get(urk);

    if (response.statusCode == 200) {
      print('completed getting api dat');
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
      return 0;
    }
  }
}
