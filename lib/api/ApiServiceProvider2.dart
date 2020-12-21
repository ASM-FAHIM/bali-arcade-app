import 'dart:convert';
import 'dart:io';
import 'package:bali_arcade/pojo/ResponseShopCategory.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiServiceProvider2 {
  Future<ResponseShopCategory> getUser(String pid) async {
    String fileName = "userdata$pid.json";
    var dir = await getTemporaryDirectory();
    File file = new File(dir.path + "/" + fileName);
    if (file.existsSync()) {
      print("Loading from cache");
      var jsonData = file.readAsStringSync();
      ResponseShopCategory response =
          ResponseShopCategory.fromJson(json.decode(jsonData));
      return response;
    } else {
      print("Loading from API");
      String _BASE_URL =
          "http://baliarcade.work/api/baliarcade/all/shop/category/$pid";
      var response = await http.get(_BASE_URL);
      if (response.statusCode == 200) {
        var jsonResponse2 = response.body;
        ResponseShopCategory res2 =
            ResponseShopCategory.fromJson(json.decode(jsonResponse2));
        print(res2);

        //save json in local file
        file.writeAsStringSync(jsonResponse2,
            flush: true, mode: FileMode.write);
        return res2;
      }
    }
  }
}
