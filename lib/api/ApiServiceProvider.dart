import 'dart:convert';
import 'dart:io';
import 'package:bali_arcade/pojo/ResponseShop.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiServiceProvider {
  Future<ResponseShop> getUser(String route, int c) async {
    String fileName = "userdata$c.json";

    var dir = await getTemporaryDirectory();

    File file = new File(dir.path + "/" + fileName);
    if (file.existsSync()) {
      print("Loading from cache");
      var jsonData = file.readAsStringSync();
      ResponseShop response = ResponseShop.fromJson(json.decode(jsonData));
      return response;
    } else {
      print("Loading from API");
      String _BASE_URL = "$route";

      var response = await http.get(_BASE_URL);

      if (response.statusCode == 200) {
        var jsonResponse = response.body;
        ResponseShop res = ResponseShop.fromJson(json.decode(jsonResponse));
        print(res);
        //save json in local file
        file.writeAsStringSync(jsonResponse, flush: true, mode: FileMode.write);

        return res;
      }
    }
  }
}
