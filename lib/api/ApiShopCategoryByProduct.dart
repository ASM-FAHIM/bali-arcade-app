import 'dart:convert';
import 'dart:io';
import 'package:bali_arcade/pojo/ResponsePCbyCategory.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

class ApiShopCategoryByProduct {
  Future<ResponsePCbyCategory> getUser(String pc) async {
    String fileName = "Product$pc.json";

    var pcdir = await getTemporaryDirectory();

    File pcfile = new File(pcdir.path + "/" + fileName);
    if (pcfile.existsSync()) {
      print("Loading from cache");
      var jsonData = pcfile.readAsStringSync();
      ResponsePCbyCategory response = ResponsePCbyCategory.fromJson(json.decode(jsonData));
      return response;
    } else {
      print("Loading from API");
      String _BASE_URL =
          "http://baliarcade.work/api/baliarcade/all/product/$pc";

      var response = await http.get(_BASE_URL);

      if (response.statusCode == 200) {
        var jsonResponse = response.body;
        ResponsePCbyCategory res = ResponsePCbyCategory.fromJson(json.decode(jsonResponse));
        print(res);
        //save json in local file
        pcfile.writeAsStringSync(jsonResponse, flush: true, mode: FileMode.write);

        return res;
      }
    }
  }
}